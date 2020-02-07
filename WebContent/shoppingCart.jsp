<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Shopping Cart</h1>

<button>Add Item</button>
<br>
<br>

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
User user = new User();
int userid = user.getUserID();
String itemid1 = request.getParameter("thisitemid1");
int itemid = Integer.parseInt(itemid1);
String title = request.getParameter("thistitle1");
String dscrp = request.getParameter("thisdscrp1");
double price = Double.parseDouble(request.getParameter("thisprice1"));

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection connect = DriverManager
  .getConnection("jdbc:mysql://127.0.0.1:3306/projectdb?"
      + "user=john&password=pass1234");
Statement st = connect.createStatement();

int a = st.executeUpdate("insert into shoppingCart(userC_id,itemC_id,price, title, dscrp)\r\n" + 
		"values ('"+userid+"','"+itemid+"','"+price+"','"+title+"','"+dscrp+"');");
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
    <button href = "deleteShoppingCartItem.jsp">Delete</button></form></td>
    </tr>
    <%
    
    %>
    
     <% 
}

%>
<a href = "mainMenu.jsp" class = "btn-primary">Main Menu</a>
</body>
</html>