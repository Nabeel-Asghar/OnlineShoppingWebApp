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
<%@ page import = "dbProject.Item" %>
<%@ page import = "dbProject.FavoriteItem" %>
<% 

User user = new User();
int userid = user.getUserID();
int Cartitemid = Integer.parseInt(request.getParameter("thisCartitemid"));

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection connect = DriverManager
  .getConnection("jdbc:mysql://127.0.0.1:3306/projectdb?"
      + "user=john&password=pass1234");
Statement st = connect.createStatement();
int x = st.executeUpdate("delete from ShoppingCart where userC_id='"+userid+"' and itemC_id = '"+Cartitemid+"';");
String redirect = "searchItem.jsp";
response.sendRedirect(redirect);
%>
</body>
</html>