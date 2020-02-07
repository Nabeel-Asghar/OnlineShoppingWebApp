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

<p>Select user to see items where user's reviews are 'Excellent' or 'Good'!</p>

<!-- Form which will process user1 and User2 through Query -->
<form action = "part3Q2.jsp" method = "POST">
<div class = "row">
<select name = "user1">

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
String x = "SELECT category FROM items";
ResultSet rs = st.executeQuery(x);
while(rs.next()){
	%>
	
    <option class = "dropdown-item" value =<%=rs.getString("category") %>><%=rs.getString("category") %></option>
    
    <%
    
    %> 
     <% 
}

%>
</select>

<!-- Generates Username options to select user2 from -->
<select name = "user2">
<% 
Statement ab = connect.createStatement();
String y = "SELECT category FROM items";
ResultSet cd = ab.executeQuery(y);
while(cd.next()){
	%>

    <option class = "dropdown-item" value =<%=cd.getString("category")%>><%=cd.getString("category") %></option>  
    <%  
    %>  
     <% 
}
%>
</select>
</div>
<br>
<input type = "text" name = "date"></input>
<button class = "input-group-btn btn-success" >Search</button>
</form>

<br>

<!-- Table which displays results of query generated from data collected from form -->
<table class = "table">
<tr>
<td>User name</td>
<td></td>
</tr>
<% 

String item1 = request.getParameter("user1");
String item2 = request.getParameter("user2");
String date = request.getParameter("date");
Statement xx = connect.createStatement();
String c = "select username from users where user_id= (select userid from items where category in('"+item1+"','"+item2+"') and date_posted ='"+date+"' HAVING COUNT(*)>1) ;";
ResultSet yy = xx.executeQuery(c);
while(yy.next()){
	%>

	<tr>
    
    <td><%=yy.getString("username") %></td>
    
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