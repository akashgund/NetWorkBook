<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>

</head>
<body >

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<form action="${contextPath}/user/login.htm" method="POST">
<table>
<tr>
<td>
<label for="userName" class="prompt">User Name</label> <span></span>
<input type="text" name="userName" required="required"/><br>
</td>
</tr>
<tr>
<td>

<label for="password" class="prompt">Password:</label> 
<input type="password" name="password" required="required"/><br>
</td>
</tr>
<tr>
<td>
<input type="submit" name="submit" value="Login"/></td>
</tr>

</table>

</form>
</body>
</html>