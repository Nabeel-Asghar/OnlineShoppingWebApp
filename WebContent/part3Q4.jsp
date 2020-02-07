<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Top Sellers</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<table class = "table">
<tr>
<td>Username</td>
<td>Number of Items</td>
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
String x = "SELECT (SELECT username From users WHERE user_id=userid), COUNT(item_id) FROM items WHERE date_posted >= '05/01/2018' GROUP BY userid order by COUNT(item_id) desc;";
ResultSet rs = st.executeQuery(x);
rs.next();
	%>
	<tr>
    <td><%=rs.getString("(SELECT username From users WHERE user_id=userid)")%></td> <!-- Get Username Here -->
    <td><%=rs.getString("Count(item_id)") %></td></tr>
    
    <%
    String s= rs.getString("Count(item_id)");
    rs.next();
    if(s.equals(rs.getString("Count(item_id)"))==true){%>
    	<td><%=rs.getString("(SELECT username From users WHERE user_id=userid)")%></td> <!-- Get Username Here -->
        <td><%=rs.getString("Count(item_id)") %></td></tr>
        <%
    }
    
    %>
    
     <% 
    


%>

</table>
<br><br>
<a href = "part3Menu.html">Part 3 Menu</a><br></br>
<a href = "mainMenu.jsp">Main Menu </a><br></br>
</body>
</html>