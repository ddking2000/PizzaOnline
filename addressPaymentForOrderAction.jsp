<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String city=request.getParameter("city");
String mobileNumber=request.getParameter("mobileNumber");
String paymentMethod=request.getParameter("paymentMethod");
String transactionId="";
transactionId=request.getParameter("transactionId");
String status="bill";
try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("update user set address=?,city=?,mobileNumber=? where email=?");
	ps.setString(1,address);
	ps.setString(2,city);
	ps.setString(3,mobileNumber);
	ps.setString(4,email);
	ps.executeUpdate();
	
	PreparedStatement ps1=con.prepareStatement("update cart set address=?,city=?,mobileNumber=?,orderDate=now(), paymentMethod=?,transactionId=?,status=? where email=? and address is NULL");
	ps1.setString(1,address);
	ps1.setString(2,city);
	ps1.setString(3,mobileNumber);
	ps1.setString(4,paymentMethod);
	ps1.setString(5,transactionId);
	ps1.setString(6,status);
	ps1.setString(7,email);
	ps1.executeUpdate();
	response.sendRedirect("bill.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}
%>