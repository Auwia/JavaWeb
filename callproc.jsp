<%@ page import="java.sql.*" %>

<%

String url = "jdbc:oracle:thin:@//DBHOST:1521/SERVICE";
String user = "USER";
String password = "PASSWORD";

Connection conn = null;
CallableStatement cs = null;

try {

    Class.forName("oracle.jdbc.driver.OracleDriver");

    conn = DriverManager.getConnection(url, user, password);

    cs = conn.prepareCall("{ call test_proc(?) }");

    cs.registerOutParameter(1, java.sql.Types.VARCHAR);

    cs.execute();

    String result = cs.getString(1);

    out.println("<h2>Risultato:</h2>");
    out.println(result);

} catch(Exception e) {

    out.println("Errore: " + e);

} finally {

    if(cs != null) cs.close();
    if(conn != null) conn.close();
}

%>
