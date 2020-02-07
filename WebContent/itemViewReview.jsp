<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Favorite Items</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
</head>
<body>

<h1>View Item Reviews</h1>

<br>
<br>
<a href = "searchItem.jsp">Search Another Item</a> <br></br>
<br>
<br>
<table class = "table">
<tr>
<td>PRODUCT NAME</td>
<td>SCORE</td>
<td>DESCRIPTION</td>
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

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection connect = DriverManager
  .getConnection("jdbc:mysql://127.0.0.1:3306/projectdb?"
      + "user=john&password=pass1234");
Statement st = connect.createStatement();


String x = "select (select title from items where item_id = '"+itemid+"'), score, short_remark from reviews where itemR_id = '"+itemid+"';";
ResultSet rs = st.executeQuery(x);
while(rs.next()){
	%>

	<tr>
    <td><%=rs.getString("(select title from items where item_id = '"+itemid+"')") %></td>
    <td><%=rs.getString("score") %></td>
    <td><%=rs.getString("short_remark") %></td>
    </tr>
    <%
    
    %>
    
     <% 
}


%>
</table>
<br></br>
</body>
</html>