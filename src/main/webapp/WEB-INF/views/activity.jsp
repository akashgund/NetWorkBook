<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<title>Activity Home</title>
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

	function openChat(userId, loggedInUser) {
		window.alert("in openchat function");
		var receiverId = userId;
		document.getElementById("chatbox").innerHTML = userId;
		var xmlHttp;
		try // Firefox, Opera 8.0+, Safari
		{
			xmlHttp = new XMLHttpRequest();
			//window.alert("xmlhttpRequest made");
		} catch (e) {
			try // Internet Explorer
			{
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					alert("Your browser does not support AJAX!");
					return false;
				}
			}
		}

		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4) {
				console.log(loggedInUser);
				console.log(receiverId);
				console.log(xmlHttp.responseText);
			}
		}

		xmlHttp.open("GET", "../messages/fetchMessages.htm?sender="
				+ loggedInUser + "&receiver=" + userId, true);// add message controller text here
		xmlHttp.send();
	}
	//this function refreshes chat every few seconds
	
	/*setInterval(refreshChat,5000);
	function refreshChat(){
		console.log("ready to refresh chat");
		
		}
	*/

	// this is for sending message

	function sendMessage(loggedInUser,reciever, message) {

		var sender = loggedInUser;
		//window.alert("logged In"+loggedInUser);
		var p = document.getElementById("chatbox");
		
		var receiverName = p.textContent;
		var xmlHttp;
		try // Firefox, Opera 8.0+, Safari
		{
			xmlHttp = new XMLHttpRequest();
			//window.alert("xmlhttpRequest made");
		} catch (e) {
			try // Internet Explorer
			{
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					alert("Your browser does not support AJAX!");
					return false;
				}
			}
		}

		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4) {
				console.log(loggedInUser);
				console.log(receiverName);
				console.log(xmlHttp.responseText);
				var chat = xmlHttp.responseText;
				var jsonResponse = JSON.parse(chat);
				console.log("Ajax response:" + jsonResponse);
				console.log("JSON response.length" + jsonResponse.length);
				var x = document.getElementById("messages");
				while (x.firstChild) {
					x.removeChild(x.firstChild);
				}
				for (i = 0; i < jsonResponse.length; i++) {
					var div = document.createElement("div");

					console.log(jsonResponse[i].message);
					//div.innerHTML(chat[i].message);
					var content = document
							.createTextNode(jsonResponse[i].message);

					div.append(content);
					//window.alert(chat[i].message);

					x.prepend(div);

				}
			}
		}

		xmlHttp.open("GET", "../messages/sendMessages.htm?sender="
				+ loggedInUser + "&receiver=" + receiverName + "&message="
				+ message, true);// add message controller text here

		xmlHttp.send();

	}
	
	</script>
	
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:set var="loggedInUser" value="${sessionScope.loggedInUser}" ></c:set>
	
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

<nav class="navbar navbar-expand-lg navbar-light bg-light ">
  <a class="navbar-brand" href="${contextPath}/user/index.htm">HOME</a>
  
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
  <ul class="navbar-nav mr-auto">
 <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Options
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="${contextPath}/event/eventHome.htm">Events</a><!-- show all stuffs posted by user give option to delete/ edit them -->
          
        
        </div>
      </li>
      <!-- 
  <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    
   
     -->
  

<li class="nav-item"><!-- add the logged in user here in this button -->
<button type="button" class="btn btn-outline-success my-2 my-sm-0" id="userNameDisplay">
${loggedInUser}
</button>
</li>
<span></span>
    <ul class="navbar-nav mr-auto">
      <li class="nav-item ">
        <a class="nav-link" href="${contextPath}/user/logout.htm">Logout <span class="sr-only"></span></a>
      </li>
      </ul>
      </ul>
  </div>
  </nav><!-- this is navbar end-->
  
  
  <button type="button" class="btn btn-outline-success my-2 my-sm-0" id="EventButton" onclick='window.location.href="${contextPath}/activity/loadEvents.htm"'>
Event
</button>
  <button type="button" class="btn btn-outline-success my-2 my-sm-0" id="PostButton" onclick='window.location.href="${contextPath}/activity/loadPosts.htm"'>
Activity
</button>
  <div class="row">
  
  
  	<div id="friends" name="friends" class="col-md-3">
				<p>this is friends section</p>
				<c:set var="loggedInUser" value="${sessionScope.loggedInUser}"></c:set>

				<c:forEach var="user" items="${requestScope.networkList}">
					<div class="container">
						<script>
							
						</script>

						<button id="chatOpenButton" class="btn btn-outline-success my-2 my-sm-0"
							onclick="openChat('${user.userName}','${loggedInUser}')">
							<li>Name:${user.userName }</li>
						</button>
					</div>

				</c:forEach>

			</div>
			
			
						<div class="panel-footer col-md-12" name="panel-footer"
				id="panel-footer" onscroll="chkscroll(this)">
				<!-- -->


				<div id="chatbox" name="chatbox" class="col-md-12"
					style="background-color: #8b9ac2">
					<p id="chattingWith" name="chattingWith">this is chatPage</p>
				</div>
				<!-- chat box ends here -->
				<div id="buffer" name="buffer" style="background-color: #8b9bd2">
					<div id="messages" name="messages"
						class="container-fluid col-md12 fix-messages"></div>

					<div id="chatMessage" name="chatMessage" class="col-md-10">
						<form class="form-inline my-2 my-lg-0 fix-chatbox">
							<input class="form-control mr-sm-2" type="text"
								placeholder='Enter Message' size="100" name="message"
								aria-label="Chat Box">

							<button class="btn btn-outline-success my-2 my-sm-0"
								type="button"
								onclick="sendMessage('${loggedInUser}','${receiverName}',this.form.message.value )">Send</button>
						</form>

					</div>
				</div>
				<!-- end buffer -->
			</div>
  </div>
  
</body>
</html>