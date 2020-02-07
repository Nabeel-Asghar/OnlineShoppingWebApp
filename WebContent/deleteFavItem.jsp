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
int favitemid = Integer.parseInt(request.getParameter("thisfavitemid"));

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection connect = DriverManager
  .getConnection("jdbc:mysql://127.0.0.1:3306/projectdb?"
      + "user=john&password=pass1234");
Statement st = connect.createStatement();
int x = st.executeUpdate("delete from favoriteItems where userF_id='"+userid+"' and itemF_id = '"+favitemid+"';");
String redirect = "addFavItem.jsp";
response.sendRedirect(redirect);
%>
<br></br>
</body>
</html>