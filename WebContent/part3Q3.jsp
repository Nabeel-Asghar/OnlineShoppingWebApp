<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Common Favorite Users</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

<p>All comments are good or Excellent</p>

<!-- Form which will process user1 and User2 through Query -->
<form action = "part3Q3.jsp" method = "POST">

<select name = "user">

<!-- Generates Username options to select user1 from -->
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
String x = "SELECT username FROM users";
ResultSet rs = st.executeQuery(x);
while(rs.next()){
	%>
	
    <option class = "dropdown-item" value =<%=rs.getString("username") %>><%=rs.getString("username") %></option>
    
    <%
    
    %> 
     <% 
}

%>
</select>


<br>
<button class = "input-group-btn btn-success" >Search</button>
</form>

<br>

<!-- Table which displays results of query generated from data collected from form -->
<table class = "table">
<tr>
<td>Title</td>
<td>Category</td>
<td>Description</td>
<td>Price</td>
<td>Date Posted</td>
<td>Item Id</td>
<td>Seller Id</td>
</tr>
<% 

String user = request.getParameter("user");

String c = "select * from items where userid= (select user_id from users where username = '"+user+"') and item_id in (select itemR_id from reviews where itemR_id not in (select itemR_id from reviews where score = 'Fair' or score = 'Poor') group by item_id);";
ResultSet yy = st.executeQuery(c);
while(yy.next()){
	%>

	<tr>
    
    <td><%=yy.getString("title") %></td>
    <td><%=yy.getString("category") %></td>
    <td><%=yy.getString("dscrp") %></td>
    <td><%=yy.getString("price") %></td>
    <td><%=yy.getString("date_posted") %></td>
    <td><%=yy.getString("item_id") %></td>
    <td><%=yy.getString("userid") %></td>
    
    <%
    
    %>
    
     <% 
}

%>
</tr>
</table>

<br><br>
<a href = "part3Menu.html">Part 3 Menu</a><br></br>
<a href = "mainMenu.jsp">Main Menu </a><br></br>
</body>
</html>