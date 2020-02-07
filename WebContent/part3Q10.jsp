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

	Statement statement = null;
	Connection connection = null;
	PreparedStatement preparedstatement = null;
	ResultSet res = null;
	ResultSet res2 = null;
	ResultSet res3 = null;
	
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection connect = DriverManager
	  .getConnection("jdbc:mysql://127.0.0.1:3306/projectdb?"
	      + "user=john&password=pass1234");
	Statement st = connect.createStatement();
	String x = "SELECT * FROM users";
	res3 = st.executeQuery(x);
	%>
	<form>
    <select name="user1" id="user1">
    <option value = "result"></option>
    <% while(res3.next()){ 
    	%>
        <option class = "dropdown-item" value="<%=res3.getString("username")%>" > <%= res3.getString("username")%></option>
    <%}%>
    </select>
    
 	<%res3 =st.executeQuery(x); %>
 	   
    <select name="user2" id="user2">
    <option value = "result2"></option>
    <%  while(res3.next()){ 
    	%>
        <option class = "dropdown-item"  value="<%=res3.getString("username")%>" > <%= res3.getString("username")%></option>
    <% } %>
    </select>
    
    <input type="submit" value="Submit"/>
</form>

<%
String user1 = request.getParameter("user1");
String user2 = request.getParameter("user2");

String sql= "SELECT Count(item_id) FROM items WHERE userid = (SELECT user_id FROM users WHERE Username='"+user1+"') and item_id in(SELECT distinct itemR_id FROM reviews WHERE score='Excellent' and userR_id=(SELECT user_id FROM users WHERE Username='"+user2+"'));";
res = st.executeQuery(sql);
res.next();
int a1 = Integer.parseInt(res.getString("Count(item_id)"));

String sql1=  "SELECT Count(item_id)FROM items WHERE userid=(SELECT user_id FROM users WHERE Username='"+user1+"');";
res2 = st.executeQuery(sql1);
res2.next();
int a2 = Integer.parseInt(res2.getString("Count(item_id)"));

String sql2 = "SELECT Count(item_id) FROM items WHERE userid = (SELECT user_id FROM users WHERE Username='"+user2+"') and item_id in(SELECT distinct itemR_id FROM reviews WHERE score='Excellent' and userR_id=(SELECT user_id FROM users WHERE Username='"+user1+"'));";
res = st.executeQuery(sql2);
res.next();
int b1 = Integer.parseInt(res.getString("Count(item_id)"));

String sql3 = "SELECT Count(item_id)FROM items WHERE userid=(SELECT user_id FROM users WHERE Username='"+user2+"');";
res2 = st.executeQuery(sql3);
res2.next();
int b2 = Integer.parseInt(res2.getString("Count(item_id)"));

if(a1==a2 && b1==b2){
	%><h1>These users have only posted Excellent reviews for each other!!!!!</h1><%
}

%>

<a href = "part3Menu.html">Part 3 Menu</a><br></br>
<a href = "mainMenu.jsp">Main Menu </a><br></br>
</body>
</html>