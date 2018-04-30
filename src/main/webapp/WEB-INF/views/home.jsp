<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
Login Page
</h1>	
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<table>
<tr>
<form action="${contextPath}/user/login.htm">
<input type="submit" value="Login" action="${contextPath}/user/login.htm">
</form>
</tr>
<tr>
<form action="${contextPath}/user/register.htm">
<input type="submit" value="Register" action="${contextPath}/user/register.htm">
</form>
</tr>
</table>
</body>
</html>
