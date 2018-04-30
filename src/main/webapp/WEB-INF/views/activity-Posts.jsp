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
window.onload = function() {
	fetchUser();
	sessionStorage.setItem("Page", 1);
	//loadPost();
};
function fetchUser()
{
	var userName = document.getElementById("userNameDisplay").textContent;

	// window.alert(userName);
	 console.log(userName);
	 console.log("fetching all events");
	loadPost(userName);

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
			var myDislikeButton = document.getElementById("mydislikeButton");
			if(x!=null){
			while (x.firstChild) {
				x.removeChild(x.firstChild);
			}
			}
			for (i = 0; i < jsonResponse.length; i++) {
				var mainDiv = document.createElement("div");
				var tempLike=myLikeButton;
				mainDiv.setAttribute("class", "fluid-container col-md-12");
				 var counter=i+1;
				var postDiv = document.createElement("div");
				postDiv.style = " height:200px";
				postDiv.setAttribute("class", "container col-md-10");
				postDiv.setAttribute("style", "background-color: #42c2f4");
				postDiv.setAttribute("id","postDiv"+counter);
				
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
				 likerButton.setAttribute("id","likerButton"+counter);
				 likeButton.setAttribute("id","likeButton"+counter);
				 likeButton.setAttribute("name",loggedInUser)
				 	 likerButton.setAttribute("name",loggedInUser)
				 likeButton.setAttribute("class","btn btn-outline-success my-2 my-sm-0 ");
				 likerButton.setAttribute("class","btn btn-outline-success my-2 my-sm-0 ");
				 var viewPostButton =document.createElement("button");
				 viewPostButton.setAttribute("id","viewPostButton"+counter);
				 viewPostButton.setAttribute("name",loggedInUser)
				  viewPostButton.setAttribute("class","btn btn-outline-success my-2 my-sm-0 ");
				 
				 
				 
				//likeButton.addEventListener('click', Like(jsonResponse[i].id), false);
				 //likeButton.addEventListener('click',Like);*/
				// likeButton.onclick= Like;
				 viewPostButton.onclick=viewPost;

				 likerButton.onmouseover = fetchLikes;
				
				 likerButton.onmouseout = removeLikersDisplay;
				 var t1= document.createTextNode("Like");
				 likeButton.append(t1);
				 var t3=document.createTextNode("Likers");
				 likerButton.append(t3);

				 var postButtonText =document.createTextNode("View Location");
				 viewPostButton.append(postButtonText);
				 //likeButton.append(spanElement);
				 var dislikeButton = document.createElement("button");
				 var dislikerButton =document.createElement("button");
				 dislikeButton.setAttribute("id","dislikeButton"+counter);
				 dislikerButton.setAttribute("id","dislikeButton"+counter);
				 dislikeButton.setAttribute("class","btn btn-outline-success my-2 my-sm-0");
				 dislikerButton.setAttribute("class","btn btn-outline-success my-2 my-sm-0");
				 var t2= document.createTextNode("Dislike");
				 var xyz =document.createTextNode("Dislikers");
				 dislikeButton.append(t2);
				 dislikerButton.append(xyz);
				 //dislikeButton.onclick=Dislike;
				

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
				
			
				console.log("like button added:"+myLikeButton);
				var br = document.createElement("br");
				brDiv.append(br);
				brDiv.append(br);
				postDiv.append(user);
				postDiv.append(brDiv);

				postDiv.append(content);
				postDiv.append(brDiv);
				postDiv.append(time);
				postDiv.append(brDiv);
				
				//postDiv.append(likeButton);
				postDiv.append(likerButton);
				//postDiv.append(dislikeButton)
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
	xmlHttp.open("GET", "../posts/loadPost.htm?Page="+page, true);// add Post

	xmlHttp.send();

}


function fetchLikes() {
	//window.alert("ready to fetch number of likes");
	var postIdString = this.id;
	var length = postIdString.length;

	var postId = postIdString.slice(length-1,length);
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
			
			console.log(xmlHttp.responseText);
			var json = JSON.parse(xmlHttp.responseText);
			/*var x= this.id;
			console.log(x);
			x.setAttribute("data-toggle","modal");
			this.setAttribute("data-target","#Notification");//data-toggle="modal" data-target="#Notification"*/
			var x= document.getElementById("postDiv"+postId);
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
			/*var name="";
			for(i=0;i<json.length;i++)
			{name = name +"\n"+json[i].userName;}
		window.alert(name);*/
			
		}
	}

	xmlHttp.open("GET", "../posts/fetchLikes.htm?postId="+postId+"&userName="+userName, true);// registerlike

	xmlHttp.send();
	
}



function fetchDislikes() {
	console.log("ready to fetch number of dislikes");
	//window.alert("ready to fetch number of likes");
	var postIdString = this.id;
	var length = postIdString.length;

	var postId = postIdString.slice(length-1,length);
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

			console.log(xmlHttp.responseText);
			var json = JSON.parse(xmlHttp.responseText);
			/*var x= this.id;
			console.log(x);
			x.setAttribute("data-toggle","modal");
			this.setAttribute("data-target","#Notification");//data-toggle="modal" data-target="#Notification"*/
			var x= document.getElementById("postDiv"+postId);
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

	xmlHttp.open("GET", "../posts/fetchDislikes.htm?postId="+postId+"&userName="+userName, true);// registerlike

	xmlHttp.send();
	

	
}

function removeLikersDisplay()
{	var y =document.getElementById("visitorDiv");
y.remove();
	
	
	}
function removeDislikersDisplay()


{

	var y =document.getElementById("visitorDiv");
	y.remove();
		
	}



function viewPost()
{
	
	var postIdString = this.id;
	var length = postIdString.length;

	var postId = postIdString.slice(length-1,length);
	
	

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
			var json = JSON.parse(xmlHttp.responseText);
			var url="https:www.google.com/maps/search/?api=1&query="+json.location; //&query_place_id=ChIJKxjxuaNqkFQR3CK6O1HNNqY
			popupWindow=window.open(url,'popUpWindow','height=800px,width=1200px,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes');
			//return false;
			console.log(json);
			

		
			
			
		}
	}

	xmlHttp.open("GET", "../posts/getLocation.htm?postId="+postId, true);// registerlike

	xmlHttp.send();
	


	}




</script>

</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<c:set var="loggedInUser" value="${sessionScope.loggedInUser}"></c:set>

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
		class="navbar-brand" href="${contextPath}/user/index.htm">HOME</a>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Options </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">Events</a>
					<!-- show all stuffs posted by user give option to delete/ edit them -->


				</div></li>
				<!-- 
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>


 -->


			<li class="nav-item">
				<!-- add the logged in user here in this button -->
				<button type="button" class="btn btn-outline-success my-2 my-sm-0"
					id="userNameDisplay">${loggedInUser}</button>
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
	
	
	<div id="postPage" name="postPage" id="postPage" class="col-md-9"
				style="background-color: #8b9bd2"
				style="max-height: 50;overflow-y: scroll;">
				</div>

</body>
</html>