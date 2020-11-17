<%@page import="oracle.sql.*" %>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@page import="oracle.jdbc.driver.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String name=request.getParameter("qname");
String connum=request.getParameter("qnum");
String mailID=request.getParameter("qmail");
String comment=request.getParameter("comment");

Connection con1=null;
int i=0;
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");  
	con1=DriverManager.getConnection("jdbc:oracle:thin:localhost:1521:xe","system","Elakiya21");  
	PreparedStatement stmt=con1.prepareStatement("insert into vaavi values(?,?,?,?)");  
	stmt.setString(1,name);  
	stmt.setString(2,connum);  
	stmt.setString(3,mailID); 
	stmt.setString(4,comment);
	i=stmt.executeUpdate();  
	if(i>0)
	 JOptionPane.showMessageDialog(null,"WE WILL CONTACT YOU SOON");
}
catch(Exception e){ 
	System.out.println(e);
	}  
%>
	if(i>0)
<jsp:forward page="Varieties ADP.html"></jsp:forward>

</body>
</html>