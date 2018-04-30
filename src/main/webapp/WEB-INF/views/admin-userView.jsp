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

function getPosts()
{
	}



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
		<a
		class="navbar-brand" href="${contextPath}/user/refresh.htm"> HOME </a>
		</nav>
		
		
		<table class="table" id="userTable" name="userTable">
  <thead>
    <tr>
      <th scope="col">Sr. No</th>
      <th scope="col">User Name</th>
      
      <th scope ="col">Email Id</th>
      <th scope="col">Admin Status</th>
      <th scope="col" > User Status</th>
      
    </tr>
    </thead>
    
    <tbody id ="tableBody">
    </tbody>
    
    
    </table>
    
</body>

<script>

window.onload = function() {
	fetchUser();
	//loadPost();
};


function fetchUser()
{
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
			var userList = xmlHttp.responseText;
			var jsonResponse = JSON.parse(userList);
			var table= document.getElementById("userTable");
			var tablebody = document.getElementById("tableBody");
			if(table!=null){
				while (table.firstChild) {
					table.removeChild(table.firstChild);
				}
			}

			if(tablebody!=null){
				while (tablebody.firstChild) {
					tablebody.removeChild(tablebody.firstChild);
				}
			}
				/*
				  <thead>
    <tr>
      <th scope="col">Sr. No</th>
      <th scope="col">User Name</th>
      
      <th scope ="col">Email Id</th>
      <th scope="col">Admin Status</th>
      <th scope="col" > User Status</th>
      
    </tr>
    </thead>
				*/

				var thead = document.createElement("thead");
				var tr = document.createElement("tr");
				var thSr = document.createElement("th");
				thSr.setAttribute("scope", "col");
				 var sr = document.createTextNode("Sr");
				 thSr.appendChild(sr);
				 
				 

				var thun = document.createElement("th");
				thun.setAttribute("scope", "col");
				var un1= document.createTextNode("UserName");
				thun.appendChild(un1);

				var thEID = document.createElement("th");
				thEID.setAttribute("scope", "col");
				var ee= document.createTextNode("EmailId");
				thEID.appendChild(ee);
				

				var thAS = document.createElement("th");
				thAS.setAttribute("scope", "col");
				var aa =  document.createTextNode("Admin Status");
				thAS.appendChild(aa);

				var thUS = document.createElement("th");
				thUS.setAttribute("scope", "col");
				var uu =  document.createTextNode("UserStatus");
				thUS.appendChild(uu);


				tr.appendChild(thSr);
				tr.appendChild(thun);
				tr.appendChild(thEID);
				tr.appendChild(thUS);
				tr.appendChild(thAS);
					
					
				
				thead.appendChild(tr);


				table.appendChild(thead);
				
	
			
			for (i = 0; i < jsonResponse.length; i++) {
				var row= document.createElement("row");
				
				var th = document.createElement("th");
				th.setAttribute("scope","row");
				var thContent = document.createTextNode(i+1);
				th.appendChild(thContent);
				var tdUserName = document.createElement("td");
				 var un = document.createTextNode(jsonResponse[i].userName);
				 var x=jsonResponse[i].userName;
				
				 tdUserName.appendChild(un);

				 
				 var tdemail=document.createElement("td");
				 var email=  document.createTextNode(jsonResponse[i].userEmail);
				 tdemail.appendChild(email);


				// var tdadminStat= document.createElement("td");
				 var adminStatus= jsonResponse[i].adminStatus;

				 //tdadminStat.appendChild(adminStatus);

				 var tdad =document.createElement("td");
				 var ad;
				 if(adminStatus==0)
					 {
					 ad=document.createTextNode("N/A     ");
					 }
				 else {
					 ad= document.createTextNode("Admin");
					 }
				tdad.appendChild(ad);
					
				 var tdus=document.createElement("td");
				 var us;
				 var userStat= jsonResponse[i].activationStatus;
				 if(userStat==0)
					 {
					 us=document.createTextNode("In Active");
					 }
				 else if(userStat==1)
					 {
					us= document.createTextNode("        Active");
					 }

				 tdus.appendChild(us);



				 var makeAdminButton =document.createElement("button");
				 makeAdminButton.setAttribute("id",x);
				 makeAdminButton.setAttribute("name",x)
				  makeAdminButton.setAttribute("class","btn btn-outline-success my-2 my-sm-0 ");
				 var postButtonText =document.createTextNode("Make Admin");
				 makeAdminButton.append(postButtonText);
				 makeAdminButton.onclick=makeAdmin;



				 var removeAdminButton =document.createElement("button");
				 removeAdminButton.setAttribute("id",x);
				 removeAdminButton.setAttribute("name",x)
				  removeAdminButton.setAttribute("class","btn btn-outline-success my-2 my-sm-0 ");
				 var postButtonText1 =document.createTextNode("Remove Admin");
				 removeAdminButton.append(postButtonText1);
				 removeAdminButton.onclick=removeAdmin;



				 var blockUserButton= document.createElement("button");
				blockUserButton.setAttribute("id",x);
				blockUserButton.setAttribute("name",x)
				blockUserButton.setAttribute("class","btn btn-outline-success my-2 my-sm-0 ");
				var blockButtonText;
				  blockButtonText=document.createTextNode("Block User");


				  var unblockUserButton= document.createElement("button");
					unblockUserButton.setAttribute("id",x);
					unblockUserButton.setAttribute("name",x)
					unblockUserButton.setAttribute("class","btn btn-outline-success my-2 my-sm-0 ");
					var unblockButtonText;
					  unblockButtonText=document.createTextNode("Unblock User");
					  
				unblockUserButton.append(unblockButtonText);
				  
				
			
				 blockUserButton.append(blockButtonText);
				 blockUserButton.onclick=blockUser;

				 unblockUserButton.onclick= unblockUser;
				 


				 
				 row.appendChild(th);
				 row.appendChild(tdUserName);
				 row.appendChild(tdemail);
				 row.appendChild(tdus);
				 row.appendChild(tdad);
				 if(jsonResponse[i].adminStatus==0){
				 row.appendChild(makeAdminButton);
				 }
				 if(jsonResponse[i].adminStatus==1&& ((jsonResponse[i].userName).toUpperCase()!=='ADMIN')){
					 row.appendChild(removeAdminButton);
					 }
				 if(jsonResponse[i].activationStatus == 1)
					{
					 row.appendChild(blockUserButton);
					}

				 if(jsonResponse[i].activationStatus == 0)
					{
					 row.appendChild(unblockUserButton);
					}

				 
				 
				 tablebody.appendChild(row);
					var br = document.createElement("br");
				 tablebody.appendChild(br);
				

				
			
		}
			
			table.appendChild(tablebody);
		

	 }
	}
	//window.alert(xmlHttp);
	xmlHttp.open("GET", "../admin/fetchUser.htm", true);// recieves all user and their details
	xmlHttp.send();
}

function blockUser()
{

	var userName = this.id;
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

			console.log("blocked user");
			fetchUser();
		}
	}

	xmlHttp.open("GET", "../admin/Block.htm?userName="+userName, true);// xmlHttp.open("GET", "../posts/Likes.htm?postId="+postId, true);
	
	xmlHttp.send();

	
}

function unblockUser()
{

	var userName = this.id;
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
			
			console.log("unblocked user");
			console.log(xmlHttp.responseText);
			fetchUser();
		}
	}

	xmlHttp.open("GET", "../admin/unBlock.htm?userName="+userName, true);// xmlHttp.open("GET", "../posts/Likes.htm?postId="+postId, true);

	xmlHttp.send();
	
	
}

function makeAdmin()
{

	var userName = this.id;
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
			
			console.log("made Admin");
			console.log(xmlHttp.responseText);
			fetchUser();
		}
	}

	xmlHttp.open("GET", "../admin/makeAdmin.htm?userName="+userName, true);// xmlHttp.open("GET", "../posts/Likes.htm?postId="+postId, true);

	xmlHttp.send();
	}

function removeAdmin()
{

	var userName = this.id;
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
			
			console.log("made Admin");
			console.log(xmlHttp.responseText);
			fetchUser();
		}
	}

	xmlHttp.open("GET", "../admin/removeAdmin.htm?userName="+userName, true);// xmlHttp.open("GET", "../posts/Likes.htm?postId="+postId, true);

	xmlHttp.send();
	}
	



</script>
</html>