<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>User Review</h1>
<br>

<div>
<form action= "insertReview.jsp" method= "post">

<select name = "rating">
<option></option>
<option value = "Excellent">Excellent</option>
<option value = "Good">Good</option>
<option value = "Fair">Fair</option>
<option value = "Poor">Poor</option>
</select>
<br></br>
<a>Enter a Short Review</a>
<br>
<textarea rows = "3" name = "review"></textarea>
<input type= "hidden" name="thisitemid1" value = "<%=request.getParameter("thisitemid")%>"/><br/><br/>
<input type="submit"/>
</form>
</div>
<br>


</body>
</html>