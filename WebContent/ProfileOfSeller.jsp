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
<td>PRODUCT NAME</td>
<td>DESCRIPTION</td>
<td>PRICE</td>
<td>CATEGORY</td>
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
int userid= Integer.parseInt(request.getParameter("thisuserid"));
String username= request.getParameter("thisusername");
String fName= request.getParameter("thisfirstname");
String lName= request.getParameter("thislastname");
String age=request.getParameter("thisage");
String gender=request.getParameter("thisgender");
String email = request.getParameter("thisemail");

out.println(username);
%><br></br><% 
out.println(fName);
%><br></br><% 
out.println(lName);
%><br></br><% 
out.println(age);
%><br></br><% 
out.println(gender);
%><br></br><% 
out.println(email);
%><br></br><% 


String x ="SELECT * FROM items WHERE userid='"+userid+"';";
ResultSet rs = st.executeQuery(x);

while(rs.next()){%>
	<tr>
    <td><%=rs.getString("title") %></td>
    <td><%=rs.getString("dscrp") %></td>
    <td><%=rs.getString("price") %></td>
    <td><%=rs.getString("category") %></td>
    </tr>
<% }

%>

</body>
</html>