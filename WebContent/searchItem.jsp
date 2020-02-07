<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Items by Category</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<div class = "card" style = "background-color: blue">
<h1 style = "text-align: center;">Search Item by Category</h1>
</div>
<br>

<form action= "searchItem.jsp" method= "post">
<div class="input-group" style = "width: 300px;">
<input class = "form-control" type = "text" name = "searchItem"></input>
<button class = "input-group-btn btn-success" >Search</button>
</div>
</form>

<br>

<div class = "card">
<table class = "table table-dark">
<tr>
<td>NAME</td>
<td>DESCRIPTION</td>
<td>PRICE</td>
<td>CATEGORY</td>
<td></td>
<td></td>
</tr>

<%@ page import ="java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "dbProject.Item" %>
<%@ page import = "dbProject.FavoriteItem" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "dbProject.User" %>
<% 

String searchCategory = request.getParameter("searchItem");
//String itemName = request.getParameter("title");
//String description= request.getParameter("description");
//String p = request.getParameter("price");
//double price = 1000;
//SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
//Date date = new Date(); //Add date so that it is posted automatically
//String date= request.getParameter("date");
String category= request.getParameter("category");

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection connect = DriverManager
  .getConnection("jdbc:mysql://127.0.0.1:3306/projectdb?"
      + "user=john&password=pass1234");
Statement st = connect.createStatement();
String x ="SELECT item_id, title, dscrp, price, category FROM items WHERE category='"+searchCategory+"';";
ResultSet rs = st.executeQuery(x);

while(rs.next()){
	
	/*ResultSet rs1 = st.executeQuery("SELECT item_id FROM items WHERE dscrp ='"+description+"';");
	rs1.next();
	int itemid = rs1.getInt(1);
	Item.setItemData(itemid, price, itemName, description, formatter.format(date), category);*/
	%>
	
	<tr>
	<td><%=rs.getString("TITLE") %></td>
    <td><%=rs.getString("DSCRP") %></td>
    <td><%=rs.getDouble("PRICE") %></td>
    <td><%=rs.getString("CATEGORY") %></td>
    <td><form action= "Reviews.jsp" method= "POST">
    <input type= "hidden" name = "thisitemid" value = "<%=rs.getInt("ITEM_ID") %>">
    <button class= "btn-success" href = "Reviews.jsp">Rate this Item</button></form></td>
    <td><form action= "favoriteItems.jsp" method= "POST">
    <input type="hidden" name = "thisitemid" value = "<%=rs.getInt("ITEM_ID") %>">
    <input type="hidden" name = "thistitle" value = "<%=rs.getString("TITLE") %>">
    <input type="hidden" name = "thisdscrp" value = "<%=rs.getString("DSCRP") %>">
    <input type="hidden" name = "thisprice" value = "<%=rs.getString("PRICE") %>">
    <button class = "btn-warning" href = "favoriteItems.jsp">Favorite this Item</button></form></td>  
    <td><form action = "shoppingCart.jsp" method = "POST">
    <input type="hidden" name = "thisitemid1" value = "<%=rs.getInt("ITEM_ID") %>">
    <input type="hidden" name = "thistitle1" value = "<%=rs.getString("TITLE") %>">
    <input type="hidden" name = "thisdscrp1" value = "<%=rs.getString("DSCRP") %>">
    <input type="hidden" name = "thisprice1" value = "<%=rs.getString("PRICE") %>">
    <button class = "btn-warning" href = "shoppingCart.jsp">Add to Shopping Cart</button></form></td>
    <td><form action = "itemViewReview.jsp" method = "POST">
    <input type="hidden" name = "thisitemid1" value = "<%=rs.getInt("ITEM_ID") %>">
    <button class = "btn-danger" href = "itemViewReview.jsp">View Reviews</button></form></td>
   	</tr> 
   	<% 
   	
}
rs.close();
%>
</table>
</div>
<a href = "mainMenu.jsp" class = "btn-primary">Main Menu</a>
</body>
</html>