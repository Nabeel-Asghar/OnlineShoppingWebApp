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


<table border = "2">
<tr>
<td>NAME</td>
<td>EMAIL</td>
<tr>



<%@ page import ="java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<% 



Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection connect = DriverManager
  .getConnection("jdbc:mysql://127.0.0.1:3306/projectdb?"
      + "user=john&password=pass1234");
Statement st = connect.createStatement();
String x = "select * from users";

ResultSet rs = st.executeQuery(x);
while(rs.next()){
	%>
	

	<tr>
	<td><%=rs.getString("first_name") %><%=rs.getString("last_name") %></td>
    <td><%=rs.getString("EMAIL") %></td>
    <td><form action= "favoriteSellers.jsp" method= "POST">
    <input type= "hidden" name = "thisuserid" value = "<%=rs.getInt("user_id") %>">
    <input type= "hidden" name = "thisusername" value = "<%=rs.getString("username") %>">
    <input type= "hidden" name = "thisfirstname" value = "<%=rs.getString("first_name") %>">
    <input type= "hidden" name = "thislastname" value = "<%=rs.getString("last_name") %>">
    <input type= "hidden" name = "thisemail" value = "<%=rs.getString("email") %>">
    <button href = "favoriteSellers.jsp">Favorite This Seller</button></form></td>
    
    <td><form action= "ProfileOfSeller.jsp" method= "POST">
    <input type= "hidden" name = "thisuserid" value = "<%=rs.getInt("user_id") %>">
    <input type= "hidden" name = "thisusername" value = "<%=rs.getString("username") %>">
    <input type= "hidden" name = "thisfirstname" value = "<%=rs.getString("first_name") %>">
    <input type= "hidden" name = "thislastname" value = "<%=rs.getString("last_name") %>">
    <input type= "hidden" name = "thisemail" value = "<%=rs.getString("email") %>">
    <input type = "hidden" name ="thisage" value = "<%=rs.getString("age") %>">
    <input type = "hidden" name ="thisgender" value = "<%=rs.getString("gender") %>">
    <button href = "ProfileOfSeller.jsp">View Profile</button></form></td>

    </tr>
    
    <%
    
}
%>
<br></br>
<a href = "mainMenu.jsp" class = "btn-primary">Main Menu</a>
</body>
</html>