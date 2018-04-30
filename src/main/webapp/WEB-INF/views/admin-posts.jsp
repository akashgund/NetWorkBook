<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<nav class="navbar navbar-expand-lg navbar-light bg-light "> <a
		class="navbar-brand" href="${contextPath}/admin/home.htm">ADMIN HOME</a>
		</nav>
<nav class="navbar navbar-expand-lg navbar-light bg-light "> <a
		class="navbar-brand" href="${contextPath}/user/refresh.htm">HOME</a>
		</nav>
	<div class="row">
		<div id="postPage" name="postPage" id="postPage" class="col-md-9"
			style="background-color: #8b9bd2"
			style="max-height: 50;overflow-y: scroll;">

			

		</div>
	</div>

</body>

<script type="text/javascript">
	window.onload = function() {
		fetchPosts();
		//loadPost();
	};

	function fetchPosts() {
		var xmlHttp;
		//window.alert("in");
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
				//window.alert("success");

				console.log(xmlHttp.responseText);
				var x = document.getElementById("postPage");
				while (x.firstChild) {
					x.removeChild(x.firstChild);
				}
				var posts = xmlHttp.responseText;
				console.log(posts);
				var jsonResponse = JSON.parse(posts);

				for (i = 0; i < jsonResponse.length; i++) {
					var mainDiv = document.createElement("div");
					mainDiv.setAttribute("class", "fluid-container col-md-12");
					 var counter=i+1;
						var postDiv = document.createElement("div");
						postDiv.style = " height:200px";
						postDiv.setAttribute("class", "container col-md-10");
						postDiv.setAttribute("style", "background-color: #42c2f4");
						postDiv.setAttribute("id","postDiv"+jsonResponse[i].id);
						
						var brDiv = document.createElement("div");

						 var removePostButton =document.createElement("button");
						removePostButton.setAttribute("id","removepost"+counter);
						
						 removePostButton.setAttribute("class","btn btn-outline-success my-2 my-sm-0");
						 //dislikerButton.setAttribute("class","btn btn-outline-success my-2 my-sm-0");
						 var t2= document.createTextNode("Remove Post");
						 
						removePostButton.append(t2);
						removePostButton.onclick=removePost;

						var user = document.createTextNode(jsonResponse[i].userName
								+ "Updated Status!!");
						var content = document.createTextNode("Status : "
								+ jsonResponse[i].caption);
						var time = document.createTextNode("    Uploaded on: "
								+ jsonResponse[i].timestamp);

						var br = document.createElement("br");
						brDiv.append(br);
						brDiv.append(br);
						postDiv.append(user);
						postDiv.append(brDiv);

						postDiv.append(content);
						postDiv.append(brDiv);
						postDiv.append(time);
						postDiv.append(brDiv);
						postDiv.append(removePostButton);
						mainDiv.append(postDiv);
						x.prepend(mainDiv);

					
				}

			}
		}
		//window.alert(xmlHttp);
		xmlHttp.open("GET", "../admin/fetchPosts.htm", true);// recieves all user and their details
		xmlHttp.send();
	}


	function removePost()
	{
		var postIdString = this.id;
		//window.alert(postIdString);
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
			{window.alert("this changes");
			postId=postIdString.slice(length-1, length); }
		else
			{
		postId=postIdString.slice(firstnum, length); ;}

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
				fetchPosts();
				
			}
		}
		//window.alert(postId);
		xmlHttp.open("GET", "../admin/removePost.htm?postId="+postId, true);// registerlike

		xmlHttp.send();

		}
</script>


</html>
