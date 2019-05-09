package WebDB;
import java.sql.*;
import java.time.ZoneId;
import java.util.Calendar;

import oracle.jdbc.pool.OracleDataSource;
import javax.servlet.http.HttpSession;
import java.util.Date;

public class DataHandler {
	String jdbcUrl = "jdbc:oracle:thin:@//oracle18.cs.ou.edu:1521/orclpdb";
	String userId = "Yu1357";
	String password = "KHxv2Vj5";
	Connection conn;
	Statement stmt;
	ResultSet res;
	
	
	
	public boolean authenticateUser(String jdbcUrl, String userId, String password, HttpSession session) throws SQLException {
		this.jdbcUrl = jdbcUrl;
		this.userId = userId;
		this.password = password;
		try {
			OracleDataSource ds = new OracleDataSource();
			ds.setURL(jdbcUrl);
			conn = ds.getConnection(userId, password);
			return true;
		}catch(SQLException e) {
			System.out.println("Invalid User");
			session.setAttribute("loginerrormsg", "Wrong username or password");
			this.userId = null;
			this.password = null;
			return false;
		}
	}
	
	
	public Connection getDBConnection() throws SQLException{
		final OracleDataSource ds = new OracleDataSource();
		ds.setURL(jdbcUrl);
		
		if(conn == null)
			conn = ds.getConnection(userId, password);
		conn.setAutoCommit(true);
		return conn;
	}
	
	
	
	
	
	public boolean insertManufacturer(String name, String street, String city,
			String state, String zipcode) throws SQLException {
		getDBConnection();
		final String sqlInsert = "INSERT INTO microchip_manufacturer_tab VALUES(?,address_obj(?, ?, ?, ?))";
		int rowsUpdated = 0;
		try(
				PreparedStatement stm = conn.prepareStatement(sqlInsert);
				){
			stm.setString(1,name);
			stm.setString(2, street);
			stm.setString(3, city);
			stm.setString(4, state);
			stm.setString(5, zipcode);
			rowsUpdated = stm.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return rowsUpdated != 0;
	}
	
	
	public boolean insertLaptop(int cid, String speed, int price, String memory, String cusName, String fName, String[] softwares, String weight) throws SQLException {
		getDBConnection();
		String softwaresStr = "software_obj(";
		int rows = 0;
		for(int i = 0; i < softwares.length - 1; i++)
			softwaresStr += "?, ";
		if(softwares.length > 0)
			softwaresStr += "?";
		softwaresStr += ")";
		 String sqlInsert = "";

		if(cusName.length() != 0)
			sqlInsert = "INSERT INTO laptop_tab "
				+ "SELECT ?, ?, ?, ?, REF(c), REF(m), " + softwaresStr + ", ? "
						+ "FROM microchip_manufacturer_tab m, customer_tab c "
						+ "WHERE c.customer_name = ? AND m.facturer_name = ?";
		else
			sqlInsert = "INSERT INTO laptop_tab "
					+ "SELECT ?, ?, ?, ?, null, REF(m), " + softwaresStr + ", ? "
							+ "FROM microchip_manufacturer_tab m "
							+ "WHERE m.facturer_name = ?";
		
        try (PreparedStatement stmt = conn.prepareStatement(sqlInsert);) {
        	stmt.setInt(1, cid);
        	stmt.setString(2, speed);
        	stmt.setInt(3, price);
        	stmt.setString(4, memory);
        		for(int i = 0; i < softwares.length; i++) {
        		stmt.setString(i + 5, softwares[i]);
        	}
        	stmt.setString(5 + softwares.length, weight);
        	if(cusName.length() > 0 ) {
        		stmt.setString(6 + softwares.length, cusName);
        		stmt.setString(7 + softwares.length, fName);
        	}
        	else {
        		stmt.setString(6 + softwares.length, fName);
        	}
        	rows = stmt.executeUpdate();
        	
        }catch(SQLException e) {
        	e.printStackTrace();
        }
        
        this.insertComputer(cid, speed, price, memory, cusName, fName, softwares);
        
       return rows != 0;
	}
	
	
	public boolean insertDesktop(int cid, String speed, int price, String memory, String cusName, String fName, String[] softwares, String monitor) throws SQLException {
		getDBConnection();
		String softwaresStr = "software_obj(";
		int rows = 0;
		for(int i = 0; i < softwares.length - 1; i++)
			softwaresStr += "?, ";
		if(softwares.length > 0)
			softwaresStr += "?";
		softwaresStr += ")";
		
		 String sqlInsert = "";

		if(cusName.length() != 0) {
			sqlInsert = "INSERT INTO desktop_tab "
				+ "SELECT ?, ?, ?, ?, REF(c), REF(m), " + softwaresStr + ", ? "
						+ "FROM microchip_manufacturer_tab m, customer_tab c "
						+ "WHERE c.customer_name = ? AND m.facturer_name = ?";
				}
		else {
			sqlInsert = "INSERT INTO desktop_tab "
					+ "SELECT ?, ?, ?, ?, null, REF(m), " + softwaresStr + ", ? "
							+ "FROM microchip_manufacturer_tab m "
							+ "WHERE m.facturer_name = ?";
		}
		
		
        try (PreparedStatement stmt = conn.prepareStatement(sqlInsert);
        	 ) {
        	stmt.setInt(1, cid);
        	stmt.setString(2, speed);
        	stmt.setInt(3, price);
        	stmt.setString(4, memory);
        	        		for(int i = 0; i < softwares.length; i++) {
        		stmt.setString(i + 5, softwares[i]);

        	}
        	stmt.setString(5 + softwares.length, monitor);

        	if(cusName.length() > 0 ) {
        		stmt.setString(6 + softwares.length, cusName);
        		stmt.setString(7 + softwares.length, fName);
        	}
        	else {
        		stmt.setString(6 + softwares.length, fName);

        	}
        	rows = stmt.executeUpdate();
        	
        }catch(SQLException e) {
        	e.printStackTrace();
        }
       this.insertComputer(cid, speed, price, memory, cusName, fName, softwares);
       return rows != 0;
	}	
	
	public boolean insertComputer(int cid, String speed, int price, String memory, String cusName, String fName, String[] softwares) throws SQLException {
		getDBConnection();
		String softwaresStr = "software_obj(";
		int rows = 0;
		for(int i = 0; i < softwares.length - 1; i++)
			softwaresStr += "?, ";
		if(softwares.length > 0)
			softwaresStr += "?";
		softwaresStr += ")";
		
		 String sqlInsertCom = "";

		if(cusName.length() != 0) {
			
			sqlInsertCom = "INSERT INTO computer_tab "
					+ "SELECT ?, ?, ?, ?, REF(c), REF(m), " + softwaresStr + " "
							+ "FROM microchip_manufacturer_tab m, customer_tab c "
							+ "WHERE c.customer_name = ? AND m.facturer_name = ?";
				}
		else {
			sqlInsertCom = "INSERT INTO computer_tab "
					+ "SELECT ?, ?, ?, ?, null, REF(m), " + softwaresStr + " "
							+ "FROM microchip_manufacturer_tab m "
							+ "WHERE m.facturer_name = ?";
		}
		
		
        try (
        	 PreparedStatement stmt1 = conn.prepareStatement(sqlInsertCom);) {

        	stmt1.setInt(1, cid);
        	stmt1.setString(2, speed);
        	stmt1.setInt(3, price);
        	stmt1.setString(4, memory);
        		for(int i = 0; i < softwares.length; i++) {
        		stmt1.setString(i + 5, softwares[i]);

        	}
        	if(cusName.length() > 0 ) {
         		stmt1.setString(5 + softwares.length, cusName);
        		stmt1.setString(6 + softwares.length, fName);
        	}
        	else {
        		stmt1.setString(5 + softwares.length, fName);

        	}
        	rows = stmt1.executeUpdate();
        	
        }catch(SQLException e) {
        	e.printStackTrace();
        }
        
       return rows != 0;
	}	
	
	public boolean insertCustomer(String name,String serialNo, String street, String city,
			String state, String zipcode) throws SQLException {
		getDBConnection();
		 String sqlInsert = "INSERT INTO customer_tab VALUES(?,address_obj(?, ?, ?, ?)) ";
		String sqlInsert2 = null;
		if(serialNo != null && serialNo.length() > 0)
			sqlInsert2 = " INSERT INTO order_tab SELECT ?, "
													  + "REF(c), "
													  + "REF(p), "
													  + "date_obj(?,?)"
													  + "FROM customer_tab c, computer_tab p "
													  + "WHERE c.customer_name = ? AND p.serial_no = ? ";
			
		

		int rowsUpdated = 0;
		try(
				PreparedStatement stm = conn.prepareStatement(sqlInsert);
				){
			stm.setString(1,name);
			stm.setString(2, street);
			stm.setString(3, city);
			stm.setString(4, state);
			stm.setString(5, zipcode);
			rowsUpdated = stm.executeUpdate();

			if(serialNo.length() != 0) {
			try(PreparedStatement stm1 = conn.prepareStatement(sqlInsert2);){
				java.util.Date date= new Date();
				Calendar cal = Calendar.getInstance();
				cal.setTime(date);
				int month = cal.get(Calendar.MONTH);
				int year = cal.get(Calendar.YEAR);
				
			stm1.setInt(1, Integer.parseInt(serialNo));
			stm1.setInt(2, month);
			stm1.setInt(3, year);
			stm1.setString(4, name);
			stm1.setInt(5, Integer.parseInt(serialNo));
			stm1.executeUpdate();
			
			}
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return rowsUpdated != 0;
	}
	
	
	public boolean querry4(String serialNo) throws SQLException {
			getDBConnection();
			int rowsUpdated = 0;
			final String sqlInsert = "UPDATE computer_tab SET customer_name = (SELECT REF(c)  "
																		+ "FROM customer_tab c, order_tab o "
																		+ "WHERE c.customer_name = o.customer_name.customer_name "
																		+ "AND  o.com_serial_no.serial_no = ?) "
									+ "WHERE serial_no = ?";
			
			
			try(
					PreparedStatement stm = conn.prepareStatement(sqlInsert);
					){
				
				stm.setInt(1, Integer.parseInt(serialNo));
				stm.setInt(2, Integer.parseInt(serialNo));
				rowsUpdated = stm.executeUpdate();
				
				
			}catch(SQLException e){
				e.printStackTrace();
			}
			
			return rowsUpdated != 0;
		}
	
    public ResultSet getQuerry4Res(String serialNo) throws SQLException {
        getDBConnection();

        String sql =
                "SELECT p.serial_no, " +
                "P.customer_name.customer_name " +
                "FROM computer_tab P "
                +"WHERE p.serial_no = ? ";
        PreparedStatement stmt1 = conn.prepareStatement(sql);
        stmt1.setInt(1, Integer.parseInt(serialNo));
        res = stmt1.executeQuery();
        return res;
    }
	
    public ResultSet getComputerTable() throws SQLException {
        getDBConnection();

        String sql =
            "SELECT c.serial_no,\r\n" + 
            "       c.speed,\r\n" + 
            "       c.price,\r\n" + 
            "       c.memory,\r\n" + 
            "       c.customer_name.customer_name,\r\n" + 
            "       c.facturer_name.facturer_name,\r\n" + 
            "       c.softwares\r\n" + 
            "FROM   computer_tab c";

        // Prepare the SQL query.
        PreparedStatement stmt = conn.prepareStatement(sql);

        //execute the query and store the result in the ResultSet rset
        res = stmt.executeQuery();
        return res;
    }
    
    
    public ResultSet querry5(int year) throws SQLException {
    	getDBConnection();
    	
    	String sql = "SELECT p.serial_no, "
    					  + "p.speed, "
    					  + "p.price, "
    					  + "p.memory, "
    					  + "p.customer_name.customer_name, "
    					  + "p.facturer_name.facturer_name, "
    					  + "p.softwares, "
    					  + "p.weight, "
    					  + "o.order_date.month "
    			   + "FROM laptop_tab p, order_tab o "
    			   + "WHERE p.serial_no = o.com_serial_no.serial_no "
    			   + "AND o.order_date.year = ? ";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, year);
        res = stmt.executeQuery();
        return res;
    }
    
    
    public ResultSet querry6(String fname) throws SQLException {
    	getDBConnection();
    	
    	String sql = "SELECT  c.customer_name, "
    					   + "c.address.street, "
    					   + "c.address.city, "
    					   + "c.address.state, "
    					   + "c.address.zipcode "  
    			   + "FROM customer_tab c " + 
    				 "WHERE c.customer_name IN (SELECT p.customer_name.customer_name  " + 
    			     						   "FROM computer_tab p "
    			     						 + "WHERE p.facturer_name.facturer_name = ? ) ";
    	
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, fname);
        res = stmt.executeQuery();
        return res;
    }
    
    
    public ResultSet querry7() throws SQLException {
    	getDBConnection();
    	
    	String sql = "SELECT  o.customer_name.customer_name, "
    					   + "p.softwares "
    			   + "FROM laptop_tab p, order_tab o " + 
    				 "WHERE p.serial_no = o.com_serial_no.serial_no  ";
    	
        PreparedStatement stmt = conn.prepareStatement(sql);
        res = stmt.executeQuery();
        return res;
    }
    
    public ResultSet querry8(int price) throws SQLException {
    	getDBConnection();
    	
    	String sql = "SELECT o.customer_name.customer_name "
    			   + "FROM  order_tab o "
    			   + "WHERE  o.com_serial_no.serial_no IN (SELECT p.serial_no  "
    			   										+ "FROM   desktop_tab p "
    			   										+ "WHERE p.price > ?) ";
    	
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, price);
        res = stmt.executeQuery();
        return res;
    }
    
    public ResultSet querry9(int serialNo) throws SQLException {
    	getDBConnection();
    	
    	String sql = "SELECT l.softwares\r\n" + 
    				 "FROM   laptop_tab l\r\n" + 
    				 "WHERE  l.serial_no = ?";
    	
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, serialNo);
        res = stmt.executeQuery();
        return res;
    }
    
    
    
    public ResultSet querry10(int year) throws SQLException {
    	getDBConnection();    	
    	this.querry10DeleteOrder(year);
    	this.querry10DesktopSetNullCustomer(year);
    	this.querry10LaptopSetNullCustomer(year);
    	this.querry10ComputerSetNullCustomer(year);

    	String sql = "DELETE FROM customer_tab c\r\n" + 
    			"WHERE  c.customer_name NOT IN (SELECT o.customer_name.customer_name\r\n" + 
    			"                          FROM   order_tab o \r\n" + 
    			"                          WHERE  o.order_no  IN(SELECT k.order_no FROM   order_tab k WHERE  k.order_date.year > ?))";
    	
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, year);
        stmt.executeQuery();
        String sql1 = "SELECT c.customer_name, "
        				   + "c.address.street, "
        				   + "c.address.city, "
        				   + "c.address.state, "
        				   + "c.address.zipcode "
        			 + "FROM customer_tab c";
        
        PreparedStatement stmt1 = conn.prepareStatement(sql1);
        res = stmt1.executeQuery();
        return res;
    }
    
    private ResultSet querry10DeleteOrder(int year) throws SQLException {
    	String sql = "DELETE FROM order_tab o\r\n" + 
        		"WHERE o.customer_name.customer_name IN(SELECT c.customer_name FROM customer_tab c\r\n" + 
        		"WHERE  c.customer_name NOT IN (SELECT o.customer_name.customer_name\r\n" + 
        		"                          FROM   order_tab o \r\n" + 
        		"                          WHERE  o.order_no  IN(SELECT k.order_no FROM   order_tab k WHERE  k.order_date.year > ?)))\r\n";
        
        PreparedStatement stmt1 = conn.prepareStatement(sql);
        stmt1.setInt(1, year);
        res = stmt1.executeQuery();
        return res;
    }
    
    
    private ResultSet querry10LaptopSetNullCustomer(int year) throws SQLException {  	
        String sql = "UPDATE  laptop_tab c SET customer_name = null\r\n" + 
        		"WHERE c.customer_name.customer_name IN(SELECT c.customer_name FROM customer_tab c\r\n" + 
        		"WHERE  c.customer_name NOT IN (SELECT o.customer_name.customer_name\r\n" + 
        		"                          FROM   order_tab o \r\n" + 
        		"                          WHERE  o.order_no  IN(SELECT k.order_no FROM   order_tab k WHERE  k.order_date.year > ?)))";
        
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, year);
        res = stmt.executeQuery();
        return res;
    }
    
    
    private ResultSet querry10DesktopSetNullCustomer(int year) throws SQLException {  	
        String sql = "UPDATE  desktop_tab c SET customer_name = null\r\n" + 
        		"WHERE c.customer_name.customer_name IN(SELECT c.customer_name FROM customer_tab c\r\n" + 
        		"WHERE  c.customer_name NOT IN (SELECT o.customer_name.customer_name\r\n" + 
        		"                          FROM   order_tab o \r\n" + 
        		"                          WHERE  o.order_no  IN(SELECT k.order_no FROM   order_tab k WHERE  k.order_date.year > ?)))";
        
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, year);
        res = stmt.executeQuery();
        return res;
    }
    
    
    private ResultSet querry10ComputerSetNullCustomer(int year) throws SQLException {	
        String sql = "UPDATE  computer_tab c SET customer_name = null\r\n" + 
        		"WHERE c.customer_name.customer_name IN(SELECT c.customer_name FROM customer_tab c\r\n" + 
        		"WHERE  c.customer_name NOT IN (SELECT o.customer_name.customer_name\r\n" + 
        		"                          FROM   order_tab o \r\n" + 
        		"                          WHERE  o.order_no  IN(SELECT k.order_no FROM   order_tab k WHERE  k.order_date.year > ?)))";
        
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, year);
        res = stmt.executeQuery();
        return res;
    }
    
    public ResultSet getCustomerTable() throws SQLException {	
        String sql = "SELECT c.customer_name, "
				   + "c.address.street, "
				   + "c.address.city, "
				   + "c.address.state, "
				   + "c.address.zipcode "
			 + "FROM customer_tab c";
        
        PreparedStatement stmt = conn.prepareStatement(sql);
        res = stmt.executeQuery();
        return res;
    }
    
    
    
    public ResultSet getDesktopTable() throws SQLException {	
        String sql = "SELECT c.serial_no,\r\n" + 
        		"       c.speed,\r\n" + 
        		"       c.price,\r\n" + 
        		"       c.memory,\r\n" + 
        		"       c.customer_name.customer_name,\r\n" + 
        		"       c.facturer_name.facturer_name,\r\n" + 
        		"       c.softwares,\r\n" + 
        		"       c.monitor_type\r\n" + 
        		"FROM   desktop_tab c";
        
        PreparedStatement stmt = conn.prepareStatement(sql);
        res = stmt.executeQuery();
        return res;
    }
    
    
    public ResultSet getLaptopTable() throws SQLException {	
        String sql = "SELECT c.serial_no,\r\n" + 
        		"       c.speed,\r\n" + 
        		"       c.price,\r\n" + 
        		"       c.memory,\r\n" + 
        		"       c.customer_name.customer_name,\r\n" + 
        		"       c.facturer_name.facturer_name,\r\n" + 
        		"       c.softwares,\r\n" + 
        		"       c.weight\r\n" + 
        		"FROM   laptop_tab c";
        
        PreparedStatement stmt = conn.prepareStatement(sql);
        res = stmt.executeQuery();
        return res;
    }
   
    
    public ResultSet getManufacturerTable() throws SQLException {	
        String sql = "SELECT c.facturer_name,\r\n" + 
        		"       c.address.street,\r\n" + 
        		"       c.address.city,\r\n" + 
        		"       c.address.state, \r\n" + 
        		"       c.address.zipcode\r\n" + 
        		"FROM microchip_manufacturer_tab c";
        
        PreparedStatement stmt = conn.prepareStatement(sql);
        res = stmt.executeQuery();
        return res;
    }
    
    public ResultSet getOrderTable() throws SQLException {	
        String sql = "SELECT o.order_no,\r\n" + 
        		"       o.customer_name.customer_name,\r\n" + 
        		"       o.com_serial_no.serial_no,\r\n" + 
        		"       o.order_date.month,\r\n" + 
        		"       o.order_date.year\r\n" + 
        		"FROM order_tab o\r\n";
        
        PreparedStatement stmt = conn.prepareStatement(sql);
        res = stmt.executeQuery();
        return res;
    }
}
