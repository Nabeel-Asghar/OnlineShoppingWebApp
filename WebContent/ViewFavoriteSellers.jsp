<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border="2">
<tr>
<td>SELLER USERNAME</td>
<td>SELLER EMAIL</td>
<td>FIRST NAME</td>
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
String x = "select * from favoriteSellers where logUser_id='"+userid+"';";
ResultSet rs = st.executeQuery(x);
while(rs.next()){
	%>

	<tr>
    <td><%=rs.getString("username") %></td>
    <td><%=rs.getString("email") %></td>
    <td><%=rs.getString("first_name") %></td>
     <td><form action= "deleteFavSellers.jsp" method= "POST">
    <input type= "hidden" name = "thisfavuserid" value = "<%=rs.getInt("userFS_id") %>">
    <button href = "deleteFavSellers.jsp">Delete</button></form></td></tr>
    <% 
}
%>
<a href = "sellerProfile.jsp" >Add  more Users to Favorites</a><br></br>
<a href = "mainMenu.jsp" class = "btn-primary">Main Menu</a>
</body>
</html>