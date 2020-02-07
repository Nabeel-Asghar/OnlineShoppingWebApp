<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import ="java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "dbProject.User" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Date" %>
<% 
String email= request.getParameter("Email");
String pwd=request.getParameter("pwd");
String fName = request.getParameter("fName");
String lName= request.getParameter("lname");
String username = request.getParameter("username");
String gender= request.getParameter("gender");
String age= request.getParameter("age");
SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
Date date = new Date(); //Add date so that it is posted automatically
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection connect = DriverManager
  .getConnection("jdbc:mysql://127.0.0.1:3306/projectdb?"
      + "user=john&password=pass1234");
Statement st = connect.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM users WHERE email='"+email+"';");
if(rs.next()){
	if(rs.getString(8).equals(pwd)){
		out.println("Welcome");
		out.println("<br></br>");
		out.println("<a href = \"AddItem.html\"> Add an Item</a> <br></br>");
		out.println("<a href = \"searchItem.jsp\"> Search an Item</a> <br></br>");
		out.println("<a href = \"ViewShoppingCart.jsp\">Shopping Cart</a> <br></br>");
		out.println("<a href = \"sellerProfile.jsp\">Sellers List</a> <br></br>");
		out.println("<a href = \"ViewFavoriteSellers.jsp\">Your Favorite Sellers</a> <br></br>");
		out.println("<a href = \"ViewFavoriteItems.jsp\">Your Favorite Items</a> <br></br>");
		//todo Add a Home Page
		String LoggedInUserId= rs.getString(1);
		int userid = rs.getInt(1);
		User.setLoginUserData(userid, fName, lName, username, email, gender, age);
		int x = st.executeUpdate("DROP TRIGGER IF EXISTS `projectdb`.`itemscheck`");
		String sql =
				"CREATE TRIGGER `projectdb`.`itemscheck`\r\n"+
				"BEFORE INSERT ON `projectdb`.`items`\r\n" + 
				"FOR EACH ROW\r\n" + 
				"BEGIN\r\n" + 
				"IF \r\n" + 
				"(SELECT count(item_id) from projectdb.items where date_posted = '"+formatter.format(date)+"' and userid  = "+userid+") > 4\r\n" + 
				"THEN\r\n" + 
				"SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='Cannot post more than 5 items per day!';\r\n" + 
				"END IF;\r\n" + 
				"END \r\n";
		PreparedStatement preparedStatement;
		preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
		preparedStatement.executeUpdate();
	}
	else {
		out.println("Error: Invalid Email or Password!");
	}
}
else
%>
<br></br>
<%
%>
<br></br>
<a href = "index.jsp">Sign Out</a> <br></br>

</body>
</html>