<%@page import= "project.ConnectionProvider" %>
<%@page import= "java.sql.*"  %>
<%
String id=request.getParameter("id");
String email=request.getParameter("email");
String status="Delivered";
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	 ResultSet rs=st.executeQuery("select *from cart inner join product where cart.product_id=product.id and cart.orderDate is not NULL and cart.status='Delivered'");
     response.sendRedirect("ordersReceived.jsp?msg=delivered");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("ordersReceived.jsp?msg=wrong");
}
%>