<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Favorite Sellers</title>
</head>
<body>

<h1>Favorite Sellers</h1>

<br>
<br>

<table border="2">
<tr>
<td>NAME</td>
<td>EMAIL</td>
</tr>


<%@ page import ="java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "dbProject.User" %>
<%@ page import = "dbProject.Item" %>
<%@ page import = "dbProject.FavoriteItem" %>
<% 

User user = new User();
int userid = user.getUserID();
int sellerid = Integer.parseInt(request.getParameter("thisuserid"));
String fusername = request.getParameter("thisusername");
String fName = request.getParameter("thisfirstname");
String lName = request.getParameter("thislastname");
String email = request.getParameter("thisemail");

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection connect = DriverManager
  .getConnection("jdbc:mysql://127.0.0.1:3306/projectdb?"
      + "user=john&password=pass1234");
Statement st = connect.createStatement();
int a = st.executeUpdate("insert into favoriteSellers(userFS_id,logUser_id, username, first_name, last_name, email)\r\n" + 
		"values ('"+sellerid+"','"+userid+"','"+fusername+"','"+fName+"','"+lName+"','"+email+"');");
String x = "select * from favoriteSellers where logUser_id='"+userid+"';";
ResultSet rs = st.executeQuery(x);
while(rs.next()){
	%>

	<tr>
    <td><%=rs.getString("first_name") %><%=rs.getString("last_name") %></td>
    <td><%=rs.getString("email") %></td>
    <td><form action= "deleteFavSellers.jsp" method= "POST">
    <input type= "hidden" name = "thisfavuserid" value = "<%=rs.getInt("userFS_id") %>">
    <button href = "deleteFavSellers.jsp">Delete</button></form></td>
    <%
    
    %>
    
     <% 
}


%>
<a href = "index.jsp">Home</a> <br></br>
<a href = "sellerProfile.jsp">Favorite Another Seller</a> <br></br>
<a href = "mainMenu.jsp" class = "btn-primary">Main Menu</a>
<br></br>
</body>
</html>