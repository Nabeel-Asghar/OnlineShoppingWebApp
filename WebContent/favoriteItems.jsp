<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Favorite Items</title>
</head>
<body>

<h1>Favorite Items</h1>

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
String itemid1 = request.getParameter("thisitemid");
int itemid = Integer.parseInt(itemid1);
String title = request.getParameter("thistitle");
String dscrp = request.getParameter("thisdscrp");
double price = Double.parseDouble(request.getParameter("thisprice"));

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection connect = DriverManager
  .getConnection("jdbc:mysql://127.0.0.1:3306/projectdb?"
      + "user=john&password=pass1234");
Statement st = connect.createStatement();

int z = st.executeUpdate("DROP TRIGGER IF EXISTS `projectdb`.`favoritescheck`");
String sql =
		"CREATE TRIGGER `projectdb`.`favoritescheck`\r\n"+
		"BEFORE INSERT ON `projectdb`.`favoriteItems`\r\n" + 
		"FOR EACH ROW\r\n" + 
		"BEGIN\r\n" + 
		"IF \r\n" + 
		"(SELECT count(fav_id) from projectdb.favoriteItems where itemF_id = '"+itemid+"' and userF_id = '"+userid+"') > 0\r\n" + 
		"THEN\r\n" + 
		"SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='Cannot add or update row: only one active row allowed per type';\r\n" + 
		"END IF;\r\n" + 
		"END \r\n";
PreparedStatement preparedStatement;
preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
preparedStatement.executeUpdate();

int a = st.executeUpdate("insert into favoriteItems(userF_id,itemF_id,price, title, dscrp)\r\n" + 
		"values ('"+userid+"','"+itemid+"','"+price+"','"+title+"','"+dscrp+"');");
String x = "select * from favoriteItems where userF_id='"+userid+"';";
ResultSet rs = st.executeQuery(x);
while(rs.next()){
	%>

	<tr>
    <td><%=rs.getString("title") %></td>
    <td><%=rs.getString("dscrp") %></td>
    <td><%=rs.getString("price") %></td>
    <td><form action= "deleteFavItem.jsp" method= "POST">
    <input type= "hidden" name = "thisfavitemid" value = "<%=rs.getInt("itemF_id") %>">
    <button href = "deleteFavItem.jsp">Delete</button></form></td>
    </tr>
    <%
    
    %>
    
     <% 
}


%>
<a href = "index.jsp">Home</a> <br></br>
<a href = "searchItem.jsp">Favorite Another Item</a> <br></br>
<a href = "mainMenu.jsp" class = "btn-primary">Main Menu</a>
<br></br>
</body>
</html>