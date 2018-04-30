package com.me.project.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.SimpleEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.captcha.botdetect.web.servlet.Captcha;
import com.me.project.dao.AdminDAO;
import com.me.project.dao.NetworkDAO;
import com.me.project.dao.UserDAO;
import com.me.project.pojo.User;


@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value="/user/login.htm", method=RequestMethod.GET)
	public String Login(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession()!=null)
		{
HttpSession session = request.getSession();
			
			String loggedInUser =(String) session.getAttribute("loggedInUser");
			
			if(loggedInUser!=null)
				 
			{
				System.out.println("redirected after back button from here");
		
		return("index");
			}
		}
		
		return("login");
		
	}
	
	

	@RequestMapping(value="/user/logout.htm", method=RequestMethod.GET)
	public String Logout(HttpServletRequest request, HttpServletResponse response, UserDAO userDAO,NetworkDAO networkDAO,ModelMap map) throws IOException {
		 response.setHeader("Cache-Control","no-cache");
		  response.setHeader("Cache-Control","no-store");
		  response.setHeader("Pragma","no-cache");
		  response.setDateHeader ("Expires", -1);
		
		request.getSession().invalidate();
		//response.sendRedirect("login.jsp");
			return("login");
		
		
	}
	
	
	
	@RequestMapping(value="/user/login.htm", method=RequestMethod.POST)
	public String Login(HttpServletRequest request, HttpServletResponse response, UserDAO userDAO,NetworkDAO networkDAO,ModelMap map)
	{
		String userName= request.getParameter("userName");
		String password=request.getParameter("password");
		User user = userDAO.getUser(userName, password);
		
		if(userName.equalsIgnoreCase("admin") && password.equalsIgnoreCase("admin"))
		{
			HttpSession session =request.getSession();
			session.setAttribute("loggedInUser", "Admin");
			return "admin-panel";
		}
		if(user!=null)
		{
			ArrayList<User> users = networkDAO.allUsers();
			System.out.println("size of list of users in network:"+ users.size());
			map.addAttribute("networkList", users);
			map.addAttribute("loggedInUser",user);
			HttpSession session =request.getSession();
			session.setAttribute("loggedInUser", user.getUserName());
			
			
		return("index");
		}
		
		else 
		{
			request.setAttribute("errorMessage","User not found please enter correct credentials");
			return("error");
		}
	}
	
	@RequestMapping(value="/user/refresh.htm", method=RequestMethod.GET)
	public String Refresh(HttpServletRequest request, HttpServletResponse response, UserDAO userDAO,NetworkDAO networkDAO,ModelMap map)
	{
		if(request.getSession()!=null)
		{
HttpSession session = request.getSession();
			
			String loggedInUser =(String) session.getAttribute("loggedInUser");
			
			if(loggedInUser!=null)
			{
		
			ArrayList<User> users = networkDAO.allUsers();
			System.out.println("size of list of users in network:"+ users.size());
			map.addAttribute("networkList", users);
			//map.addAttribute("loggedInUser",user);
			
			//session.setAttribute("loggedInUser", user.getUserName());
			
			
		return("index");
			}
			else
			{
				String errorMessage = "User Not Logged In!";
				request.setAttribute("errorMessage", errorMessage);
				return ("error");
			}
		}
		return "login";
		
		
		
	}
	
	@RequestMapping(value="user/register.htm" , method=RequestMethod.GET)
	public String register(HttpServletRequest request, HttpServletResponse response)
	{
		if(request.getSession()!=null)
		{
HttpSession session = request.getSession();
			
			String loggedInUser =(String) session.getAttribute("loggedInUser");
			
			if(loggedInUser!=null)
			{
				return("index");
			}
		}
			
		
		
		return("register");	
		}


	
	
	@RequestMapping(value="/user/register.htm", method=RequestMethod.POST)
	
	public String registerUser(HttpServletRequest request, HttpServletResponse response, UserDAO userDAO) throws Exception
	{
		User user= new User();
		
		HttpSession session = request.getSession();
		//verify the captcha code here
		//captcha object
		Captcha captcha = Captcha.load(request, "exampleCaptcha");
		
		// the capthca entered byt he user
		String captchaCode = request.getParameter("captchaCode");
		
		
		System.out.println("Capthcha: " + captcha+" capthcha code: "+ captchaCode+ "trail"+request.getParameter("userName"));
		
	
		
		if(captcha.validate(captchaCode))
		{
		String userName=request.getParameter("userName");
		String password= request.getParameter("password");
		String userEmail = request.getParameter("userEmail");
		user.setUserName(userName);
		user.setPassword(password);
		user.setUserEmail(userEmail);
		user.setActivationStatus(1);
		user.setAdminStatus(0);
		
		
		
		boolean registrationSuccessful= userDAO.registerUser(user);
		if(registrationSuccessful)
		{
			Random random = new Random();
			int key1=random.nextInt(1234);
			int key2 = random.nextInt(1234);
			
			String url="http://localhost:8080/project/user/validateemail.htm?email="+userEmail+ "&key1="+ key1 + "&key2=" + key2;
			
			//storing the keys in the session
			session.setAttribute("key1",key1);
			session.setAttribute("key2",key2);
			
				
			sendConfirmationMail(userEmail, "click on the link to activate the account "+ url);
			
		return "registration-success";
		}
		else
		{
			request.setAttribute("errorMessage","Could not Register User");
			return "error";
		}
		}
		else
		{
			request.setAttribute("errorMessage","Could not Register User");
			return "error";
		}
	}
	
	
	public void sendConfirmationMail(String userEmail , String msg)
	{
		//send conformation url mail here
		
		try {
			Email email = new SimpleEmail();
			email.setHostName("smtp.googlemail.com");
			email.setSmtpPort(465);
			email.setAuthenticator(new DefaultAuthenticator("Webtools.Akash@gmail.com", "ASDFGHJKLQWERTYUIOP"));
			email.setSSLOnConnect(true);
			email.setFrom("no-reply@msis.neu.edu"); //This user email does not exist
			
			email.setSubject("Password Reminder");
			email.setMsg(msg);
			email.addTo(userEmail);
			email.send();
			
			} catch(Exception e) {
				System.out.println("Email was not sent! Error:"+e.getMessage());
			}

		}
	@RequestMapping(value = "/user/validateemail.htm", method = RequestMethod.GET)
	public String validateEmail(HttpServletRequest request, UserDAO userDao, ModelMap map) {

		// The user will be sent the following link when the use registers
		// This is the format of the email
		// http://hostname:8080/lab10/user/validateemail.htm?email=useremail&key1=<random_number>&key2=<body
		// of the email that when user registers>
		
		
		
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		int key1 = Integer.parseInt(request.getParameter("key1"));
		int key2 = Integer.parseInt(request.getParameter("key2"));
		System.out.println(session.getAttribute("key1") );
		System.out.println(session.getAttribute("key2") );
		
		
		if ((Integer)(session.getAttribute("key1")) == key1 && ((Integer)session.getAttribute("key2"))== key2) {
			try {
				
				boolean updateStatus = userDao.updateUser(email);
				if (updateStatus) {
					return "login";
				} else {

					return "error";
				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			map.addAttribute("errorMessage", "Link expired , generate new link");
			map.addAttribute("resendLink", true);
			return "error";
		}

		return "login";

	}
	@RequestMapping(value="user/resendemail.htm" , method=RequestMethod.GET)
	public void resendemail(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		String userEmail =  request.getParameter("userEmail");
		Random rand = new Random();
		int randomNum1 = rand.nextInt(1234);
		int randomNum2 = rand.nextInt(1234);
		try {
			String url="http://localhost:8080/project/user/validateemail.htm?email="+userEmail+ "&key1="+ randomNum1 + "&key2=" + randomNum2;
			session.setAttribute("key1", randomNum1);
			session.setAttribute("key2", randomNum2);
			sendConfirmationMail(userEmail,"Click on this link to activate your account : "+ url);
		} catch (Exception e) {
			System.out.println("Email cannot be sent");
		}
		
	}
	
	

	@RequestMapping(value="/user/checkAdmin.htm" , method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public User block(HttpServletRequest request , AdminDAO adminDAO)
	{
		String userName= request.getParameter("loggedInUser");
		System.out.println("in here to block user");
		User user =adminDAO.getAdmin(userName);
		return user;
		
	}
	

@RequestMapping(value="user/profile.htm" , method=RequestMethod.GET)
public String profile(HttpServletRequest request, HttpServletResponse response)
{
	if(request.getSession()!=null)
	{
HttpSession session = request.getSession();
		
		String loggedInUser =(String) session.getAttribute("loggedInUser");
		
		if(loggedInUser!=null)
		{
	
	return("userProfile");	
	}
	}
	else
	{
		String errorMessage = "User Not Logged In!";
		request.setAttribute("errorMessage", errorMessage);
		return ("error");
	}
	return ("login");
}


@RequestMapping(value="user/updateProfile.htm" , method=RequestMethod.POST)
public String updateprofile(HttpServletRequest request, HttpServletResponse response,UserDAO userDAO) throws Exception
{
	HttpSession session=request.getSession();
	
	String userloggedIn= (String)session.getAttribute("loggedInUser");
	
	User user = userDAO.getLoggedInUser(userloggedIn);
			
			
	File file = new File("C:\\Users\\Public\\ProjectUploads\\"+user.getUserName());//"C:\\Users\\akash\\Webtools\\sts\\Project\\ProjectUploads\\;
    if (!file.exists()) {
        if (file.mkdir()) {
            System.out.println("Directory is created!");
        } else {
            System.out.println("Failed to create directory!");
        }
    }
	
	ServletFileUpload sf= new ServletFileUpload(new DiskFileItemFactory());
		try {
			List<FileItem> uploadedFiles=sf.parseRequest(request);
			String path="";
			System.out.println(uploadedFiles.size()+"these many files uploaded");
			for( FileItem item: uploadedFiles)
			{
				path="C:\\Users\\Public\\ProjectUploads\\"+user.getUserName()+"\\"+ item.getName();
				System.out.println(path+"path");
				item.write(new File(path));
				
			}
			System.out.println("file Uploaded");
			userDAO.updateProfile(path,user);
			
			
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	return("userProfile");	
	}

@RequestMapping(value="/user/profileDetails.htm" , method=RequestMethod.GET, produces="application/json")
@ResponseBody
public User block(HttpServletRequest request , UserDAO userDAO)
{
	String userName= request.getParameter("userName");
	System.out.println("in here to block user");
	User user =userDAO.getLoggedInUser(userName);
	return user;
	
}


	
}


