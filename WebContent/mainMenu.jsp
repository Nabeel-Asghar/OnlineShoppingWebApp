<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
out.println("Welcome");
out.println("<br></br>");
out.println("<a href = \"AddItem.html\"> Add an Item</a> <br></br>");
out.println("<a href = \"searchItem.jsp\"> Search an Item</a> <br></br>");
out.println("<a href = \"ViewShoppingCart.jsp\">Shopping Cart</a> <br></br>");
out.println("<a href = \"sellerProfile.jsp\">Sellers List</a> <br></br>");
out.println("<a href = \"ViewFavoriteSellers.jsp\">Your Favorite Sellers</a> <br></br>");
out.println("<a href = \"ViewFavoriteItems.jsp\">Your Favorite Items</a> <br></br>");
out.println("<a href = \"part3Menu.html\" class = \"btn-primary\">Part 3 Menu</a>");
%>
</body>
</html>