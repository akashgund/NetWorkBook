<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<title>Project</title>
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

.tooltip {
	position: relative;
	display: inline-block;
}

.tooltip .tooltiptext {
	visibility: hidden;
	width: 120px;
	background-color: black;
	color: #fff;
	text-align: center;
	border-radius: 6px;
	padding: 5px 0;
	/* Position the tooltip */
	position: absolute;
	z-index: 1;
}
</style>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA4WZ-AHAAti_dBwHk5mTRWxGjFPhI_j0E&sensor=true&libraries=places,weather"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


</head>
<body>
	<div id="${sessionScope.loggedInUser}"></div>
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

	<nav class="navbar navbar-expand-lg navbar-light bg-light "> <a
		class="navbar-brand" href="${contextPath}/user/refresh.htm">HOME</a>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Options </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item"
						href="${contextPath}/activity/activityHome.htm">Activity</a>
					<!-- show all stuffs posted by user give option to delete/ edit them -->
					<a class="dropdown-item" href="${contextPath}/event/eventHome.htm">Events</a>
					<!-- implement add event/view event -->

				</div></li>
			<!--  <form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>-->

			<li class="nav-item">
				<button type="button" class="btn btn-outline-success my-2 my-sm-0"
					data-toggle="modal" data-target="#Post">Add Post</button>
			</li>
			<li class="nav-item" id="adminButton"></li>



			<li class="nav-item">
				<button type="button" id="userNameDisplay"
					class="btn btn-outline-success my-2 my-sm-0"
					onclick='window.location.href="${contextPath}/user/profile.htm"'>${sessionScope.loggedInUser}</button>
			</li>
			<span></span>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item "><a class="nav-link"
					href="${contextPath}/user/logout.htm">Logout <span
						class="sr-only"></span></a></li>
			</ul>
		</ul>
	</div>
	</nav>
	<!-- this is navbar end-->


	</div>

	<div class="modal fade" id="Notification" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Notifications</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!--  add notifications code  here -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>


	<!-- add posts modal -->
	<div class="modal fade" id="Post" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">New Post</h5>
					<!--  post form -->
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<form>
							<label for="PostCaption">Enter Status Update</label>
							<textarea class="form-control" id="PostCaption" rows="3"></textarea>
					</div>
					<div class="form-group">
						<input class="form-control mr-sm-2" type="input"
							placeholder='click button to enter Location' size="100"
							name="locationBox" id="locationBox" aria-label="Caption">
						<button type="button" class="btn btn-outline-success my-2 my-sm-0"
							name="addLocation" id="addLocation" onclick="getLocation()">Add
							Location!</button>
						<!-- onclick="getLocation() -->
					</div>
					<button type="button" class="btn btn-outline-success my-2 my-sm-0"
						onclick="PostStatus('${sessionScope.loggedInUser}',this.form.PostCaption.value , this.form.locationBox.value )">
						Post Status</button>
				</div>
				</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">

			<div id="postPage" name="postPage" id="postPage" class="col-md-9"
				style="background-color: #8b9bd2"
				style="max-height: 75;overflow-y: scroll;">

				<!--  <div id="likeButton" name="likeButton" >
				<button  type="button" class="btn btn-outline-success my-2 my-sm-0"
						onclick="Like('${sessionScope.loggedInUser}')" id="mylikeButton"> Like</button><!-- ,this.div.something 
				</div>
					<div id="likeButton" name="likeButton" >
				<button  type="button" class="btn btn-outline-success my-2 my-sm-0"
						onclick="Dislike('${sessionScope.loggedInUser}')" id="mydislikeButton" > Dislike</button>
				</div>
				-->

			</div>

			<div id="friends" name="friends" class="col-md-3">
				<p>Network Members!</p>
				<c:set var="loggedInUser" value="${sessionScope.loggedInUser}"></c:set>

				<c:forEach var="user" items="${requestScope.networkList}">
					<div class="container">
						<script>
							
						</script>

						<button id="chatOpenButton"class="btn btn-outline-success my-2 my-sm-0"
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
					<p id="chattingWith" name="chattingWith">Chat Room!</p>
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
								onclick="sendMessage('${loggedInUser}',this.form.message.value )">Send</button>
						</form>

					</div>
				</div>
				<!-- end buffer -->
			</div>
			<!-- chat page ends here -->




		</div>



	</div>
</body>
<script>
	//ajax function to load chat here!!!
	window.onload = function() {
		sessionStorage.setItem("Page", 1);
		fetchUser();
		//loadPost();
	};
	$(window).scroll(function() {   
		   if($(window).scrollTop() + $(window).height() > $(document).height() - 15) {
			   
				 var page=sessionStorage.getItem("Page");
				 //window.alert(page++);
				 page++;
				 sessionStorage.setItem("Page", page++);
				 console.log("page"+page);
				 fetchUser();
		   }
		});
	function fetchUser() {
		var userName = document.getElementById("userNameDisplay").textContent;

		//window.alert(userName);
		console.log(userName);
		loadPost(userName);
		adminPanelAccess(userName);

	}
	function adminPanelAccess(loggedInUser) {
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

				console.log(xmlHttp.responseText);
				var posts = xmlHttp.responseText;
				var jsonResponse = JSON.parse(posts);
				console.log("Ajax response:", jsonResponse);
				var nav = document.getElementById("adminButton");
				while (nav.firstChild) {
					nav.removeChild(nav.firstChild);
				}
				//var nav= document.getElementsByClassName("navbar navbar-expand-lg navbar-light bg-light");
				/*<li class="nav-item">
				<button type="button" class="btn btn-outline-success my-2 my-sm-0"
					data-toggle="modal" data-target="#Post">Add Post</button>
				</li>
				 */
				//var li = document.createElement("li");
				//li.setAttribute("class","nav-item");
				if (jsonResponse.adminStatus == 1) {
					var adminButton = document.createElement("button");
					adminButton.setAttribute("type", "button");
					adminButton.setAttribute("class",
							"btn btn-outline-success my-2 my-sm-0");
					var text = document.createTextNode("Admin Panel");
					//adminButton.setAttribute()
					adminButton.appendChild(text);
					adminButton.onclick = adminPanelRedirect;
					//	li.appendChild(adminButton);
					nav.appendChild(adminButton);
				}

			}
		}

		xmlHttp.open("GET", "../user/checkAdmin.htm?loggedInUser="
				+ loggedInUser, true);// add message controller text here
		xmlHttp.send();

	}

	function adminPanelRedirect() {
		var ctx = "${pageContext.request.contextPath}";
		window.location.href = ctx + "/admin/home.htm";
	}

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
	function sendMessage(loggedInUser, message) {

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

	//document.getElementById("panel-footer").addEventListener("scroll", chkscroll());
	function chkscroll(o) {
		window.alert(o.scrollTop);
		if (o.offsetHeight + o.scrollTop == o.scrollHeight) {
			window.alert("End");
		}
	}

	function PostStatus(loggedInUser, caption, location) {
		console.log(caption);
		console.log(loggedInUser);
		var sender = loggedInUser;

		var locationSave = location;
		//window.alert("logged In"+loggedInUser);
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
				console.log("trip to add post succesful");
				var loc = document.getElementById("locationBox");
				loc.value = "";
				var post = document.getElementById("PostCaption");
				post.value = "";
				window.alert("Post Added!");
				loadPost(sender);
			}
		}

		xmlHttp.open("GET", "../posts/addPost.htm?sender=" + loggedInUser
				+ "&Post=" + caption + "&location=" + locationSave, true);// add Post

		xmlHttp.send();
	}

	function loadPost(loggedInUser) {
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
				
				console.log(xmlHttp.responseText);
				var posts = xmlHttp.responseText;
				console.log(posts);
				
				var jsonResponse = JSON.parse(posts);
				console.log("Ajax response:", jsonResponse);
				//console.log("JSON response.length"+ jsonResponse.length);
				var x = document.getElementById("postPage");
				var myLikeButton = document.getElementById("mylikeButton");
				var myDislikeButton = document
						.getElementById("mydislikeButton");
				if (x != null) {
					while (x.firstChild) {
						x.removeChild(x.firstChild);
					}
				}
				for (i = 0; i < jsonResponse.length; i++) {
					var mainDiv = document.createElement("div");
					var tempLike = myLikeButton;
					mainDiv.setAttribute("class", "fluid-container col-md-12");
					var counter = i + 1;
					var postDiv = document.createElement("div");
					postDiv.style = " height:200px";
					postDiv.setAttribute("class", "container col-md-10");
					postDiv.setAttribute("style", "background-color: #42c2f4");
					//postDiv.setAttribute("id", "postDiv" + counter);
					postDiv.setAttribute("id", "postDiv" + jsonResponse[i].id);
					

					var brDiv = document.createElement("div");
					/*var id =tempLike.getAttribute("id");
					var newid= id+i;
					//window.alert(newid);
					tempLike.setAttribute("id",newid);*/

					//div.style:="border-top: 1px solid #ddd";
					//div.style=" border-bottom-right-radius: 3px";
					//div.style="border-bottom-left-radius: 3px";
					//div.style="height:200px;";
					//div.className("container");
					/*
					 border-top: 1px solid #ddd;
					border-bottom-right-radius: 3px;
					border-bottom-left-radius: 3px;
					 */
					var likeButton = document.createElement("button");

					var likerButton = document.createElement("button");
					likerButton.setAttribute("id", "likerButton" + counter);
					likeButton.setAttribute("id", "likeButton" + counter);
					likeButton.setAttribute("name", loggedInUser)
					likerButton.setAttribute("name", loggedInUser)
					likeButton.setAttribute("class",
							"btn btn-outline-success my-2 my-sm-0 ");
					likerButton.setAttribute("class",
							"btn btn-outline-success my-2 my-sm-0 ");
					var viewPostButton = document.createElement("button");
					viewPostButton.setAttribute("id", "viewPostButton"
							+ jsonResponse[i].id);
					viewPostButton.setAttribute("name", loggedInUser)
					viewPostButton.setAttribute("class",
							"btn btn-outline-success my-2 my-sm-0 ");

					//likeButton.addEventListener('click', Like(jsonResponse[i].id), false);
					//likeButton.addEventListener('click',Like);*/
					likeButton.onclick = Like;
					viewPostButton.onclick = viewPost;

					likerButton.onmouseover = fetchLikes;

					likerButton.onmouseout = removeLikersDisplay;
					var t1 = document.createTextNode("Like");
					likeButton.append(t1);
					var t3 = document.createTextNode("Likers");
					likerButton.append(t3);

					var postButtonText = document
							.createTextNode("View Location");
					viewPostButton.append(postButtonText);
					//likeButton.append(spanElement);
					var dislikeButton = document.createElement("button");
					var dislikerButton = document.createElement("button");
					dislikeButton.setAttribute("id", "dislikeButton" + counter);
					dislikerButton
							.setAttribute("id", "dislikeButton" + counter);
					dislikeButton.setAttribute("class",
							"btn btn-outline-success my-2 my-sm-0");
					dislikerButton.setAttribute("class",
							"btn btn-outline-success my-2 my-sm-0");
					var t2 = document.createTextNode("Dislike");
					var xyz = document.createTextNode("Dislikers");
					dislikeButton.append(t2);
					dislikerButton.append(xyz);
					dislikeButton.onclick = Dislike;

					dislikerButton.onmouseover = fetchDislikes;
					dislikerButton.onmouseout = removeDislikersDisplay;

					console.log(jsonResponse[i].message);
					//div.innerHTML(chat[i].message);
					var user = document.createTextNode(jsonResponse[i].userName
							+ "Updated Status!!");
					var content = document.createTextNode("Status : "
							+ jsonResponse[i].caption);
					var time = document.createTextNode("    Uploaded on: "
							+ jsonResponse[i].timestamp);

					var hiddenField = document.createElement("input");

					console.log("like button added:" + myLikeButton);

					
					
					var br = document.createElement("br");
					brDiv.append(br);
					brDiv.append(br);
					postDiv.append(user);
					postDiv.append(brDiv);

					postDiv.append(content);
					postDiv.append(brDiv);
					postDiv.append(time);
					postDiv.append(brDiv);

					postDiv.append(likeButton);
					postDiv.append(likerButton);
					postDiv.append(dislikeButton)
					postDiv.append(dislikerButton);

					postDiv.append(viewPostButton);


					mainDiv.append(postDiv);

					//mainDiv.append(br);
					//mainDiv.append(br);
					//window.alert(chat[i].message);

					x.prepend(mainDiv);

				}
			}
		}
		
		 var page=sessionStorage.getItem("Page");
			console.log("passing page number"+page);
		xmlHttp.open("GET", "../posts/loadPost.htm?Page="+page, true);// add Post

		xmlHttp.send();

	}
	function deletePost()
	{var postIdString = this.id;
	var length = postIdString.length;

	var postId = postIdString.slice(length - 1, length);
	//window.alert("PostId "+postId);
	var userName = document.getElementById("userNameDisplay").textContent;
	var xmlHttp;
	;

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

		}
	}

	xmlHttp.open("GET", "../posts/DeletePost.htm?postId=" + postId, true);// registerlike

	xmlHttp.send();
		}
	function Like() {

		//window.alert(postId);
		var postIdString = this.id;
		var length = postIdString.length;
		var firstnum;
		for(i=0;i<length;i++)
			{
			var c= postIdString.charAt(i);
			//window.alert(parseInt(postIdString, i));
			if (!isNaN(c))
					{
				//window.alert("first num found at "+i+"length"+length);
				firstnum=i;
				//window.alert("firstnum="+firstNum)
				break;
				}
			}
		var postId;
		//window.alert("firstnum "+firstnum + " length-1"+(length-1));
		if((length-1)==firstnum)
			{//window.alert("this changes");
			postId=postIdString.slice(length-1, length); }
		else
			{
		postId=postIdString.slice(firstnum, length); ;}
		/*if (isNaN(parseInt(postIdString, length-1))) {
			//window.alert("this changes");
		postId= postIdString.slice(length - 2, length);
		}
		else
			{
			postId= postIdString.slice(length - 1, length);
			}
		*/
		//window.alert("PostId "+postId);
		var userName = document.getElementById("userNameDisplay").textContent;
		var xmlHttp;
		;

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
				//window.alert("liked");
			}
		}

		xmlHttp.open("GET", "../posts/Likes.htm?postId=" + postId
				+ "&userName=" + userName, true);// registerlike

		xmlHttp.send();
	}

	function Dislike() {
		var postIdString = this.id;
		var length = postIdString.length;
		var firstnum;
		for(i=0;i<length;i++)
			{
			var c= postIdString.charAt(i);
			//window.alert(parseInt(postIdString, i));
			if (!isNaN(c))
					{
				//window.alert("first num found at "+i+"length"+length);
				firstnum=i;
				//window.alert("firstnum="+firstNum)
				break;
				}
			}
		var postId;
		//window.alert("firstnum "+firstnum + " length-1"+(length-1));
		if((length-1)==firstnum)
			{//window.alert("this changes");
			postId=postIdString.slice(length-1, length); }
		else
			{
		postId=postIdString.slice(firstnum, length); ;}
		/*if (!isNaN(parseInt(postIdString, length-1))) {
			
		postId= postIdString.slice(length - 2, length);
		window.alert(postId);
		}
		else
			{
			postId= postIdString.slice(length - 1, length);
			}*/
		var userName = document.getElementById("userNameDisplay").textContent;
		//window.alert("PostId "+postId);
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
				//window.alert("trip success");
			}
		}

		xmlHttp.open("GET", "../posts/Dislikes.htm?postId=" + postId
				+ "&userName=" + userName, true);// xmlHttp.open("GET", "../posts/Likes.htm?postId="+postId, true);

		xmlHttp.send();
	}
	function getLocation() {

		if (navigator.geolocation) {
			//window.alert(navigator.geolocation.getCurrentPosition(showPosition)+ "in if");
			//window.alert("in getLocation");
			navigator.geolocation.getCurrentPosition(showPosition);
		} else {
			window.alert("navigation not supported");
		}

	}
	function showPosition(position) {
		//window.alert("in pos");
		var latitude = position.coords.latitude;
		var longitude = position.coords.longitude;
		console.log("lat" + latitude);
		console.log("long" + longitude);

		var latlng = new google.maps.LatLng(latitude, longitude);
		var field = document.getElementById("locationBox");
		field.value = latlng;
		//var latlng1= latlng.slice(1, length-1);

		//console.log(url);
		//popupWindow=window.open(url,'popUpWindow','height=500,width=500,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes');

		//https://www.google.com/maps/search/?api=1&query=47.5951518,-122.3316393&query_place_id=ChIJKxjxuaNqkFQR3CK6O1HNNqY

	}
	function fetchLikes() {
		//window.alert("ready to fetch number of likes");
		var postIdString = this.id;
		var length = postIdString.length;

		var firstnum;
		for(i=0;i<length;i++)
			{
			var c= postIdString.charAt(i);
			//window.alert(parseInt(postIdString, i));
			if (!isNaN(c))
					{
				//window.alert("first num found at "+i+"length"+length);
				firstnum=i;
				//window.alert("firstnum="+firstNum)
				break;
				}
			}
		var postId;
		//window.alert("firstnum "+firstnum + " length-1"+(length-1));
		if((length-1)==firstnum)
			{//window.alert("this changes");
			postId=postIdString.slice(length-1, length); }
		else
			{
		postId=postIdString.slice(firstnum, length); ;}
		/*if (isNaN(parseInt(postIdString, length-1))) {
			//window.alert("this changes");
		postId= postIdString.slice(length - 2, length);
		}
		else
			{
			postId= postIdString.slice(length - 1, length);
			}
			*/
		//window.alert("PostId "+postId);
		var userName = document.getElementById("userNameDisplay").textContent;
		var xmlHttp;
		;

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

				console.log(xmlHttp.responseText);
				var json = JSON.parse(xmlHttp.responseText);
				/*var x= this.id;
				console.log(x);
				x.setAttribute("data-toggle","modal");
				this.setAttribute("data-target","#Notification");//data-toggle="modal" data-target="#Notification"*/
				var x = document.getElementById("postDiv" + postId);
				console.log(xmlHttp.responseText);
				var json = JSON.parse(xmlHttp.responseText);
				console.log(json);
				var visitors = document.createElement("Div");
				visitors.setAttribute("id", "visitorDiv");
				for (i = 0; i < json.length; i++) {
					var t = document.createTextNode(json[i].userName + " , ");

					visitors.append(t);
				}
				x.append(visitors);
				/*var name="";
				for(i=0;i<json.length;i++)
				{name = name +"\n"+json[i].userName;}
				window.alert(name);*/

			}
		}

		xmlHttp.open("GET", "../posts/fetchLikes.htm?postId=" + postId
				+ "&userName=" + userName, true);// registerlike

		xmlHttp.send();

	}

	function fetchDislikes() {
		console.log("ready to fetch number of dislikes");
		//window.alert("ready to fetch number of likes");
		var postIdString = this.id;
		var length = postIdString.length;
		var firstnum;
		for(i=0;i<length;i++)
			{
			var c= postIdString.charAt(i);
			//window.alert(parseInt(postIdString, i));
			if (!isNaN(c))
					{
				//window.alert("first num found at "+i+"length"+length);
				firstnum=i;
				//window.alert("firstnum="+firstNum)
				break;
				}
			}
		var postId;
		//window.alert("firstnum "+firstnum + " length-1"+(length-1));
		if((length-1)==firstnum)
			{//window.alert("this changes");
			postId=postIdString.slice(length-1, length); }
		else
			{
		postId=postIdString.slice(firstnum, length); ;}
		/*
		if (isNaN(parseInt(postIdString, length-1))) {
			//window.alert("this changes");
		postId= postIdString.slice(length - 2, length);
		}
		else
			{
			postId= postIdString.slice(length - 1, length);
			}*/
		//window.alert("PostId "+postId);
		var userName = document.getElementById("userNameDisplay").textContent;
		var xmlHttp;
		;

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
				
				console.log(xmlHttp.responseText);
				var json = JSON.parse(xmlHttp.responseText);
				/*var x= this.id;
				console.log(x);
				x.setAttribute("data-toggle","modal");
				this.setAttribute("data-target","#Notification");//data-toggle="modal" data-target="#Notification"*/
				var x = document.getElementById("postDiv" + postId);
				console.log(xmlHttp.responseText);
				//window.alert(xmlHttp.responseText);
				var json = JSON.parse(xmlHttp.responseText);
				console.log(json);
				var visitors = document.createElement("Div");
				visitors.setAttribute("id", "visitorDiv");
				for (i = 0; i < json.length; i++) {
					var t = document.createTextNode(json[i].userName + " , ");

					visitors.append(t);
				}
				x.append(visitors);

			}
		}

		xmlHttp.open("GET", "../posts/fetchDislikes.htm?postId=" + postId
				+ "&userName=" + userName, true);// registerlike

		xmlHttp.send();

	}

	function removeLikersDisplay() {
		var y = document.getElementById("visitorDiv");
		y.remove();

	}
	function removeDislikersDisplay()

	{

		var y = document.getElementById("visitorDiv");
		y.remove();

	}

	function displayPost(path) {

	}

	function viewPost() {

		var postIdString = this.id;
		var length = postIdString.length;
			//window.alert(postIdString);
		var firstnum;
		for(i=0;i<length;i++)
			{
			var c= postIdString.charAt(i);
			//window.alert(parseInt(postIdString, i));
			if (!isNaN(c))
					{
				//window.alert("first num found at "+i+"length"+length);
				firstnum=i;
				//window.alert("firstnum="+firstNum)
				break;
				}
			}
		var postId;
		//window.alert("firstnum "+firstnum + " length-1"+(length-1));
		if((length-1)==firstnum)
			{//window.alert("this changes");
			postId=postIdString.slice(length-1, length); }
		else
			{
		postId=postIdString.slice(firstnum, length); ;}
		/*
		if (isNaN(parseInt(postIdString, length-1))) {
			//window.alert("this changes");
		postId= postIdString.slice(length - 2, length);
		}
		else
			{
			postId= postIdString.slice(length - 1, length);
			}
			*/

		try // Firefox, Opera 8.0+, Safari
		{
			xmlHttp = new XMLHttpRequest();
			var userName = document.getElementById("userNameDisplay").textContent;
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

				console.log(xmlHttp.responseText);
				if(xmlHttp.responseText!=null)
					{
				var json = JSON.parse(xmlHttp.responseText);
				
				var url = "https:www.google.com/maps/search/?api=1&query="
						+ json.location; //&query_place_id=ChIJKxjxuaNqkFQR3CK6O1HNNqY
				popupWindow = window
						.open(
								url,
								'popUpWindow',
								'height=800px,width=1200px,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes');
				//return false;
				console.log(json);
					}

			}
		}
		//window.alert(postId);

		xmlHttp.open("GET", "../posts/getLocation.htm?postId=" + postId, true);// registerlike

		xmlHttp.send();

	}
</script>



</html>