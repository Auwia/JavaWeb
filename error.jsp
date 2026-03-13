<%@ page isErrorPage="true" %>

<h2>Errore JSP</h2>

<pre>
<%= exception %>
</pre>

<pre>
<%
exception.printStackTrace(new java.io.PrintWriter(out));
%>
</pre>
