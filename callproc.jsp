<%@ page import="java.sql.*, java.text.*" %>
<%@ page errorPage="error.jsp" %>
<%
String url = "jdbc:oracle:thin:@//DBHOST:1521/SERVICE";
String user = "USER";
String password = "PASSWORD";

Connection conn = null;
CallableStatement cs = null;

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");

    conn = DriverManager.getConnection(url, user, password);

    cs = conn.prepareCall("{ call test_proc(?,?) }");

    String dateStr = request.getParameter("data"); // es. 2025-03-19
    java.util.Date utilDate =
        new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);

    java.sql.Date sqlDate =
        new java.sql.Date(utilDate.getTime());

    cs.setDate(1, sqlDate);
    cs.registerOutParameter(2, java.sql.Types.VARCHAR);

    cs.execute();

    String result = cs.getString(2);

    out.println("Risultato: " + result);

} catch (Exception e) {
    e.printStackTrace(new java.io.PrintWriter(out)); // stampa l'errore
}
%>
