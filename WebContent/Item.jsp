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
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "dbProject.User" %>
<%@ page import = "dbProject.Item" %>
<%

String itemName = request.getParameter("title");
String description= request.getParameter("description");
//String p = request.getParameter("price");
double price = Double.parseDouble(request.getParameter("price"));
SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
Date date = new Date(); //Add date so that it is posted automatically
//String date= request.getParameter("date");
String category= request.getParameter("category");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection connect = DriverManager
  .getConnection("jdbc:mysql://127.0.0.1:3306/projectdb?"
      + "user=john&password=pass1234");
Statement st = connect.createStatement();
User user = new User();
int userid = user.getUserID();
//String z= "DROP TRIGGER IF EXISTS `projectdb`.`itemscheck;";
//PreparedStatement ps;
//ps= (PreparedStatement) connect.prepareStatement(z);
//ps.executeUpdate();


int x = st.executeUpdate("INSERT INTO items(price, title, dscrp, date_posted, category, userid)\r\n" + 
		"VALUES('"+price+"','"+itemName+"','"+description+"','"+formatter.format(date)+"','"+category+"','"+userid+"')");

//ResultSet rs = st.executeQuery("SELECT item_id FROM items WHERE dscrp ='"+description+"';");
//rs.next();
//int itemid = rs.getInt(1);
/*Item.setItemData(itemid, price, itemName, description, formatter.format(date), category);*/


out.println("Item Added.");
%>

<a href = "AddItem.html">Add Another Item</a> <br></br>
<a href = "mainMenu.jsp" class = "btn-primary">Main Menu</a>
</body>

</html>