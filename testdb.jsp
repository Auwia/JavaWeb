<%@ page import="java.sql.*" %>

<%
String url = "jdbc:oracle:thin:@//dbserver:1521/ORCL";
String user = "user";
String password = "password";

try {

    Class.forName("oracle.jdbc.driver.OracleDriver");

    Connection conn = DriverManager.getConnection(url,user,password);

    Statement stmt = conn.createStatement();

    ResultSet rs = stmt.executeQuery("SELECT 'OK' FROM dual");

    while(rs.next()) {
        out.println("Result: " + rs.getString(1));
    }

} catch(Exception e) {
    out.println(e);
}

%>
