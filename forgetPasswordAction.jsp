<%@page import= "project.ConnectionProvider" %>
<%@page import= "java.sql.*"  %>
<%
String email=request.getParameter("email");
String mobileNumber=request.getParameter("mobileNumber");
String securityQuestion=request.getParameter("securityQuestion");
String answer=request.getParameter("answer");
String newPassword=request.getParameter("newPassword");

int check=0;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from user where email='"+email+"' and mobileNumber='"+mobileNumber+"' and securityQuestion='"+securityQuestion+"' and answer='"+answer+"' ");
while(rs.next())
{
	check=1;
	st.execute("update user set password='"+newPassword+"' where email='"+email+"' ");
	response.sendRedirect("forgetPassword.jsp?msg=done");
}
if(check==0)
{
	response.sendRedirect("forgetPassword.jsp?msg=invalid");
}
}
catch(Exception e)
{
	System.out.println(e);
}
%>