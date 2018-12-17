<%@ page import="java.sql.*" %>

<%!
public class DBConnection {
	public Connection con;
	public Statement st;

	public DBConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			try {
				this.con = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelportal", "root", "");
				this.st = this.con.createStatement(1004, 1008);
			} catch (SQLException e) {
				System.out.println("Connection Failed!");
			}
		} catch (ClassNotFoundException e) {
			System.out.println("Driver Not Found!");
		}
	}
}
%>