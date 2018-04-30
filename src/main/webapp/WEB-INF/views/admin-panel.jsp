<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EventActivity</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<style type="text/css">
.navi {
	position: fixed;
}

.panel-footer {
	position: fixed;
	left: 0;
	bottom: 0px;
	height: 200px;
	padding: 10px 15px;
	background-color: #f5f5f5;
	border-top: 1px solid #ddd;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px;
	overflow-y: scroll;
	overflow-x: hidden;
}

.fix-chatbox {
	position: fixed;
	right: 10px;
	bottom: 0;
	padding: 10px 15px;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px;
}

.fix-messages {
	postion: fixed;
	left: 0;
	bottom: 20px;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px;
}
</style>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA4WZ-AHAAti_dBwHk5mTRWxGjFPhI_j0E&sensor=true&libraries=places,weather"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<script>





</script>


</head>
<body>

	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
		integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
		integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
		crossorigin="anonymous"></script>
		
		
		 <button type="button" class="btn btn-outline-success my-2 my-sm-0" id="ManageButton" onclick='window.location.href="${contextPath}/admin/users.htm"'>
Manage Users
</button>


		 <button type="button" class="btn btn-outline-success my-2 my-sm-0" id="ManaegePostButton" onclick='window.location.href="${contextPath}/admin/posts.htm"'>
Manage Posts
<!-- 
</button>


		 <button type="button" class="btn btn-outline-success my-2 my-sm-0" id="ManageEventButton" onclick='window.location.href="${contextPath}/admin/events.htm"'>
Manage event
</button>
-->

 <button type="button" class="btn btn-outline-success my-2 my-sm-0" id="ManageEventButton" onclick='window.location.href="${contextPath}/admin/report.htm"'>
Generate Report
</button>

 <button type="button" class="btn btn-outline-success my-2 my-sm-0" id="ManageEventButton" onclick='window.location.href="${contextPath}/user/logout.htm"'>
Logout
</button>
 <button type="button" class="btn btn-outline-success my-2 my-sm-0" id="ManageEventButton" onclick='window.location.href="${contextPath}/user/refresh.htm"'>
Home
</button>

</body>
</html>