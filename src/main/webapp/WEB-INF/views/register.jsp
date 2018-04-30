<%@page import="com.captcha.botdetect.web.servlet.Captcha"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Page</title>
</head>
<body>

		<c:set var="contextPath" value="${pageContext.request.contextPath}" />
		
		

	<form action="${contextPath}/user/register.htm" method="POST" >
		<table>
			<tr>
			<td>User Name:</td>
				<td><input type="text" name="userName" required="required" /></td>
			</tr>
			<tr>
			<td> Email</td>
				<td><input type="text" name="userEmail" required="required" /></td>
			</tr>
			<tr>
			<td> password: </td>
				<td><input type="password" name="password" required="required" /></td>
			</tr>
			
			<tr>
			
			<label for="captchaCode" class="prompt">Retype the characters from the picture:</label> 
							<%
  // Adding BotDetect Captcha to the page

  Captcha captcha = Captcha.load(request, "exampleCaptcha");
  captcha.setUserInputID("captchaCode");

  String captchaHtml = captcha.getHtml();
  out.write(captchaHtml);

%>
<td>
<input id="captchaCode" type="text" name="captchaCode" required="required"/>
				</td>
			
			</tr>
			<br>
			
	
			
			<tr>
			<td><input type="submit" name="submit" value="Register"/></td>
			</tr>
		</table>



	</form>

</body>
</html> 

