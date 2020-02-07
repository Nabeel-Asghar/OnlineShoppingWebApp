<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>

<%@ page import ="java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "dbProject.User" %>
<%@ page import = "dbProject.Item" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Date" %>
<% 

String itemid1 = request.getParameter("thisitemid1");
int thisitemid = Integer.parseInt(itemid1);
String itemRating = request.getParameter("rating");
String itemReview = request.getParameter("review");

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection connect = DriverManager
  .getConnection("jdbc:mysql://127.0.0.1:3306/projectdb?"
      + "user=john&password=pass1234");
Statement st = connect.createStatement();
User user = new User();
int userid = user.getUserID();
int itemid = thisitemid;
SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
Date date = new Date();
int z = st.executeUpdate("DROP TRIGGER IF EXISTS `projectdb`.`reviewscheck`");
String sql =
		"CREATE TRIGGER `projectdb`.`reviewscheck`\r\n"+
		"BEFORE INSERT ON `projectdb`.`reviews`\r\n" + 
		"FOR EACH ROW\r\n" + 
		"BEGIN\r\n" + 
		"IF \r\n" + 
		"(SELECT count(review_id) from projectdb.reviews where review_date = '"+formatter.format(date)+"' and userR_id = '"+userid+"') > 4\r\n" + 
		"THEN\r\n" + 
		"SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='Cannot add more than 5 reviews per day!';\r\n" + 
		"END IF;\r\n" + 
		"END \r\n";
PreparedStatement preparedStatement;
preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
preparedStatement.executeUpdate();


int x = st.executeUpdate("insert into reviews (userR_id, itemR_id, score, short_remark, review_date)\r\n" + 
		"values('"+userid+"','"+itemid+"', '"+itemRating+"', '"+itemReview+"','"+formatter.format(date)+"');");
out.println("sucessfully added review.");
%>
<a href = "searchItem.jsp">add another review</a> <br></br>
<a href = "mainMenu.jsp" class = "btn-primary">Main Menu</a>
<br></br>
</body>
</html>