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
<%

String pwd=request.getParameter("pwd");
String confpwd=request.getParameter("confpwd");
String fName= request.getParameter("fname");
String lName= request.getParameter("lname");
String email= request.getParameter("Email");
String gender= request.getParameter("gender");
String username=request.getParameter("username");

String age= request.getParameter("age");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection connect = DriverManager
  .getConnection("jdbc:mysql://127.0.0.1:3306/projectdb?"
      + "user=john&password=pass1234");
Statement st = connect.createStatement();

ResultSet rs = st.executeQuery("SELECT email FROM users WHERE email='"+email+"';");
if(pwd.equals(confpwd)==false){
	out.println("Passwords don't match!");
	out.println("<a href = \"index.jsp\">Click here to try again</a> <br></br>");
}

else{
	if (rs.next()==false){
		String sql = "INSERT INTO users(age,username,gender, email, first_name, last_name, user_pswrd)\r\n" + 
				"VALUES('"+age+"','"+username+"','"+gender+"','"+email+"','"+fName+"','"+lName+"','"+pwd+"')";
			PreparedStatement preparedStatement;
			preparedStatement = (PreparedStatement) connect.prepareStatement(sql);
			preparedStatement.executeUpdate();
			out.println("Registered.");
		}
	else {
			out.println("Email already registered. Click here to sign in: "+"<a href = \"Login.html\"> Sign in</a> <br></br>");
		}
}


%>
<br></br>
<a href = "index.jsp">Sign out</a> <br></br>
</body>
</html>