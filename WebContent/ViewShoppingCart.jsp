<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping Cart</title>
</head>
<body>
<table border="2">
<tr>
<td>PRODUCT NAME</td>
<td>DESCRIPTION</td>
<td>PRICE</td>
</tr>

<%@ page import ="java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "dbProject.User" %>
<%@ page import = "dbProject.Item" %>
<%@ page import = "dbProject.FavoriteItem" %>
<% 
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection connect = DriverManager
  .getConnection("jdbc:mysql://127.0.0.1:3306/projectdb?"
      + "user=john&password=pass1234");
Statement st = connect.createStatement();

User user = new User();
int userid = user.getUserID();
String x = "select * from shoppingCart where userC_id='"+userid+"';";
ResultSet rs = st.executeQuery(x);
while(rs.next()){
	%>

	<tr>
    <td><%=rs.getString("title") %></td>
    <td><%=rs.getString("dscrp") %></td>
    <td><%=rs.getString("price") %></td>
     <td><form action= "deleteShoppingCartItem.jsp" method= "POST">
    <input type= "hidden" name = "thisCartitemid" value = "<%=rs.getInt("itemC_id") %>">
    <button href = "deleteShoppingCartItem.jsp">Delete</button></form></td></tr>
    <% 
}
%>
<a href = "searchItem.jsp" >Add  more Items to Cart</a> <br></br>
<a href = "mainMenu.jsp" class = "btn-primary">Main Menu</a>
<br></br>
</body>
</html>