<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<%@page import="java.util.Base64"%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>

<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<%
String msg=request.getParameter("msg");
if ("added".equals(msg))
{
%>
<h3 class="alert">Product added successfully!</h3>
<%} %>
<%
if("exist".equals(msg))
{
%>
<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing went to wrong Try Again!</h3>
<%} %>

          <!-- <table>
        <thead><tr>
            <th scope="col">Id</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody> -->
        
        
        <div class="container-fluid">
            <div class="row">
                
               
  <%
       try
       {
    	   Connection con=ConnectionProvider.getCon();
    	   Statement st=con.createStatement();
    	   ResultSet rs=st.executeQuery("select *from product where active='Yes'");
    	   while(rs.next())
    	   {
    		
           
                      
       %>
         <%--  <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(4) %></td>
            <td><a href="addtoCartAction.jsp?id=<%=rs.getString(1) %>">Add to cart <i class='fas fa-pen-fancy'></i></a></td>
          
          </tr> --%>
           <div class="col-3">
                    <div class="container">
                        <div class="card my-4 " style="width: 18rem; background-color: honeydew;">
<img class="card-img-top" height="200" src="pizza1.jpg"                                alt="NO image">
                                 
                            <div class="card-body">
                                <h3 class="card-title " style="color:darkblue;">
                                    <%=rs.getString(2) %>
                                    
                                    </h3>                            
                                <h5 class="card-text " style="color: green;">
                                    &#8377;<%=rs.getString(4) %></h5>
                                <h6 > <%=rs.getString(3) %></h6>
                                 
                               
                                
                                
                                
                               
                            </div>
                            <div class="buttons d-flex flex-row">
                              <a href="addtoCartAction.jsp?id=<%=rs.getString(1) %>">
                               <button class="btn btn-warning fa fa-shopping-cart mycart"
                                        style="width: 12rem;"> ADD TO CART
                               </a>
                                </button>
                              
                            </div>
                            
                        </div>
                    </div></div>
               
             
          
          
          
          
          
          
         <%
         }
         }
         catch(Exception e)
         {
        	 System.out.println(e);
         }%>
         
             </div>
            </div>
        
          
         
       <!--  </tbody>
      </table> -->
      

</body>
</html>