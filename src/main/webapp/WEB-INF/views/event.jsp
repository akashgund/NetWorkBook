<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Event Page</title>

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
</style>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA4WZ-AHAAti_dBwHk5mTRWxGjFPhI_j0E&sensor=true&libraries=places,weather"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	


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
          <a class="dropdown-item" href="${contextPath}/activity/activityHome.htm">Activity</a><!-- show all stuffs posted by user give option to delete/ edit them -->
          
        
        </div>
      </li>
      <!-- 
  <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    -->
   
    
    <li class="nav-item">
    <button type="button" class="btn btn-outline-success my-2 my-sm-0" data-toggle="modal" data-target="#Event">
  Add Event
</button>
</li>

<li class="nav-item"><!-- add the logged in user here in this button -->
<button type="button" class="btn btn-outline-success my-2 my-sm-0" id="userNameDisplay">
${sessionScope.loggedInUser}
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
  
  
  
  
  
  	<div class="modal fade" id="Event" tabindex="-1" role="dialog"
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
							<label for="PostCaption">Enter event Details</label>
							<textarea class="form-control" id="PostEvent" rows="3"></textarea>
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
						onclick="addEvent('${loggedInUser}',this.form.PostEvent.value , this.form.locationBox.value )">
						Add Event</button>
				</div>
				<div name="EventDisplayPage" id="EventDisplayPage">
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

			<div id="EventPage" name="EventtPage" id="EventPage" class="col-md-9"
				style="background-color: #8b9bd2"
				style="max-height: 50;overflow-y: scroll;">
				 <button class="btn btn-outline-success my-2 my-sm-0" type="button" data-toggle="modal" data-target="#Event">Add Event</button>
				</div>

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
			<!-- chat page ends here -->




		</div>



	</div>

</body>
	<script>

	window.onload = function() {
		fetchUser();
		//loadPost();
	};
	function fetchUser()
	{
		var userName = document.getElementById("userNameDisplay").textContent;
	
		 window.alert(userName);
		 console.log(userName);
		loadEvents(userName);

		 }
	 
	function getLocation() {
		//window.alert("in location search");
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition);
		} else {
			window.alert("navigation not supported");
		}

	}
	/*function LocationFind(){
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showPosition);
		} else {
			window.alert("navigation not supported");
		}
		}*/
	function showPosition(position) {
		var latitude = position.coords.latitude;
		var longitude = position.coords.longitude;
		console.log("lat"+ latitude);
		console.log("long"+ longitude);
		//window.alert(latlng);
		var latlng = new google.maps.LatLng(latitude, longitude);
		var field = document.getElementById("locationBox");
		field.value = latlng;
		//var latlng1= latlng.slice(1, length-1);
		
		//console.log(url);
		//popupWindow=window.open(url,'popUpWindow','height=500,width=500,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes');

		//https://www.google.com/maps/search/?api=1&query=47.5951518,-122.3316393&query_place_id=ChIJKxjxuaNqkFQR3CK6O1HNNqY

	}

	function addEvent(loggedInUser, caption, location) {
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
				var post = document.getElementById("PostEvent");
				post.value = "";
				window.alert("Event Added!");
				loadEvents(sender);
			}
		}

		xmlHttp.open("GET", "../posts/addEvent.htm?sender=" + loggedInUser
				+ "&Caption=" + caption + "&location=" + locationSave, true);// add Post

		xmlHttp.send();
	}

	function loadEvents(loggedInUser) {
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
				console.log(xmlHttp.responseText);
				console.log(posts);
			var jsonResponse = JSON.parse(posts);
				console.log("Ajax response:", jsonResponse);

				var x = document.getElementById("EventPage");
				if(x!=null){
				while (x.firstChild) {
					x.removeChild(x.firstChild);
				}
				}
				
				for (i = 0; i < jsonResponse.length; i++) {
					var mainDiv = document.createElement("div");
					mainDiv.setAttribute("class", "fluid-container col-md-12");
					var eventDiv = document.createElement("div");
					eventDiv.style = " height:200px";
					eventDiv.setAttribute("class", "container col-md-10");
					eventDiv.setAttribute("style", "background-color: #42c2f4");
					var counter=i+1;
					eventDiv.setAttribute("id","postDiv"+jsonResponse[i].eventId);
					
					var brDiv = document.createElement("div");

					 var likeButton = document.createElement("button");
					 
					 likeButton.setAttribute("id","likeButton"+counter);
					 likeButton.setAttribute("name",loggedInUser)
					 likeButton.setAttribute("class","btn btn-outline-success my-2 my-sm-0 ");
					 likeButton.onclick= Like;////create Like function
					 var t1= document.createTextNode("Like");
					 likeButton.append(t1);

					var visitButton  = document.createElement("button");
					 visitButton.setAttribute("id","visitButton"+counter);
					 visitButton.setAttribute("name",loggedInUser)
					 visitButton.setAttribute("class","btn btn-outline-success my-2 my-sm-0 ");
					 visitButton.onclick= Visitor;////create Like function
					 var t2= document.createTextNode("Visit");
					 visitButton.append(t2);

						var visitorButton  = document.createElement("button");
					 visitorButton.setAttribute("id","visitorButton"+counter);
					 visitorButton.setAttribute("name",loggedInUser)
					 visitorButton.setAttribute("class","btn btn-outline-success my-2 my-sm-0 ");
					 visitorButton.onmouseover= VisitorList;////create Like function
					 visitorButton.onmouseout = removeVisitorList;
					 var t2= document.createTextNode("Visitor List");
					 visitorButton.append(t2);


					 var locationButton  = document.createElement("button");
					 locationButton.setAttribute("id","locationButton"+counter);
					 locationButton.setAttribute("name",loggedInUser)
					 locationButton.setAttribute("class","btn btn-outline-success my-2 my-sm-0 ");
				locationButton.onclick= viewLocation;////create Like function
					 var t3= document.createTextNode("View Location");
					 locationButton.append(t3);
					 
					 
					 var br = document.createElement("br");
						brDiv.append(br);



						var owner = document.createTextNode(jsonResponse[i].ownerName
								+ " is hosting a Event!!");
						var content = document.createTextNode(" Event Details : "
								+ jsonResponse[i].caption);

						eventDiv.append(owner);
						eventDiv.append(content);
						eventDiv.append(brDiv);

						eventDiv.append(likeButton);
						eventDiv.append(visitButton);
						eventDiv.append(visitorButton);
						eventDiv.append(locationButton);

						mainDiv.append(eventDiv);
					 
						x.prepend(mainDiv);
					
				}//end of for 
				
			}
		}

		xmlHttp.open("GET", "../event/loadEvents.htm", true);// add Post

		xmlHttp.send();

		
	}

	function Like()
	{
		var eventIdString = this.id;
		var length = eventIdString.length;
		var firstnum;
		for(i=0;i<length;i++)
			{
			var c= eventIdString.charAt(i);
			//window.alert(parseInt(postIdString, i));
			if (!isNaN(c))
					{
				//window.alert("first num found at "+i+"length"+length);
				firstnum=i;
				//window.alert("firstnum="+firstNum)
				break;
				}
			}
		var eventId;
		//window.alert("firstnum "+firstnum + " length-1"+(length-1));
		if((length-1)==firstnum)
			{//window.alert("this changes");
			eventId=eventIdString.slice(length-1, length); }
		else
			{
		eventId=eventIdString.slice(firstnum, length); ;}
		//window.alert("PostId "+postId);
		var userName = document.getElementById("userNameDisplay").textContent;
		var xmlHttp;;
		
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

		xmlHttp.open("GET", "../event/Likes.htm?eventId="+eventId, true);// registerlike

		xmlHttp.send();
		
		}

	

	function Visitor()
	{	var eventIdString = this.id;
	var length = eventIdString.length;
	var firstnum;
	for(i=0;i<length;i++)
		{
		var c= eventIdString.charAt(i);
		//window.alert(parseInt(postIdString, i));
		if (!isNaN(c))
				{
			//window.alert("first num found at "+i+"length"+length);
			firstnum=i;
			//window.alert("firstnum="+firstNum)
			break;
			}
		}
	var eventId;
	//window.alert("firstnum "+firstnum + " length-1"+(length-1));
	if((length-1)==firstnum)
		{//window.alert("this changes");
		eventId=eventIdString.slice(length-1, length); }
	else
		{
	eventId=eventIdString.slice(firstnum, length); ;}
	//window.alert("PostId "+postId);
	var userName = document.getElementById("userNameDisplay").textContent;
	var xmlHttp;;
	
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

	xmlHttp.open("GET", "../event/Visitor.htm?eventId="+eventId+"&userName="+userName, true);// registerlike

	xmlHttp.send();
		}
	function removeVisitorList()
	{
		var eventIdString = this.id;
		var length = eventIdString.length;

		var length = eventIdString.length;
		var firstnum;
		for(i=0;i<length;i++)
			{
			var c= eventIdString.charAt(i);
			//window.alert(parseInt(postIdString, i));
			if (!isNaN(c))
					{
				//window.alert("first num found at "+i+"length"+length);
				firstnum=i;
				//window.alert("firstnum="+firstNum)
				break;
				}
			}
		var eventId;
		//window.alert("firstnum "+firstnum + " length-1"+(length-1));
		if((length-1)==firstnum)
			{//window.alert("this changes");
			eventId=eventIdString.slice(length-1, length); }
		else
			{
		eventId=eventIdString.slice(firstnum, length); ;}
		//window.alert("PostId "+postId);
		var x= document.getElementById("postDiv"+eventId);
			var y =document.getElementById("visitorDiv");
			y.remove();
		}
	function VisitorList()
	{
		var eventIdString = this.id;
		var length = eventIdString.length;

		var length = eventIdString.length;
		var firstnum;
		for(i=0;i<length;i++)
			{
			var c= eventIdString.charAt(i);
			//window.alert(parseInt(postIdString, i));
			if (!isNaN(c))
					{
				//window.alert("first num found at "+i+"length"+length);
				firstnum=i;
				//window.alert("firstnum="+firstNum)
				break;
				}
			}
		var eventId;
		//window.alert("firstnum "+firstnum + " length-1"+(length-1));
		if((length-1)==firstnum)
			{//window.alert("this changes");
			eventId=eventIdString.slice(length-1, length); }
		else
			{
		eventId=eventIdString.slice(firstnum, length); ;}
		//window.alert("PostId "+postId);
		var userName = document.getElementById("userNameDisplay").textContent;
		var xmlHttp;;
		
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
				var x= document.getElementById("postDiv"+eventId);
				console.log(xmlHttp.responseText);
				var json = JSON.parse(xmlHttp.responseText);
				console.log(json);
				var visitors = document.createElement("Div");
				visitors.setAttribute("id","visitorDiv");
				for(i=0;i<json.length;i++)
					{
					 var t= document.createTextNode(json[i].userName+" , ");
					 
					 visitors.append(t);
					}
				x.append(visitors);
				
			}
		}

		xmlHttp.open("GET", "../event/VisitorList.htm?eventId="+eventId, true);// registerlike

		xmlHttp.send();


		
		}

	function viewLocation()
	{var eventIdString = this.id;
	var length = eventIdString.length;

	var length = eventIdString.length;
	var firstnum;
	for(i=0;i<length;i++)
		{
		var c= eventIdString.charAt(i);
		//window.alert(parseInt(postIdString, i));
		if (!isNaN(c))
				{
			//window.alert("first num found at "+i+"length"+length);
			firstnum=i;
			//window.alert("firstnum="+firstNum)
			break;
			}
		}
	var eventId;
	//window.alert("firstnum "+firstnum + " length-1"+(length-1));
	if((length-1)==firstnum)
		{//window.alert("this changes");
		eventId=eventIdString.slice(length-1, length); }
	else
		{
	eventId=eventIdString.slice(firstnum, length); ;}
	

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

			console.log(xmlHttp.responseText ,"here");
			var json = JSON.parse(xmlHttp.responseText);
			var url="https:www.google.com/maps/search/?api=1&query="+json.location; //&query_place_id=ChIJKxjxuaNqkFQR3CK6O1HNNqY
			popupWindow=window.open(url,'popUpWindow','height=800px,width=1200px,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes');
			//return false;
			console.log(json);
			

		
			
			
		}
	}

	xmlHttp.open("GET", "../event/getLocation.htm?eventId="+eventId, true);// registerlike

	xmlHttp.send();
	
		}
	
	</script>

</html>