package com.me.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.project.dao.AdminDAO;
import com.me.project.dao.UserDAO;
import com.me.project.pojo.Event;
import com.me.project.pojo.Posts;
import com.me.project.pojo.User;

@Controller
public class AdminController {
	
	
	@RequestMapping(value="/admin/posts.htm" , method=RequestMethod.GET)
	
	public String allPosts(HttpServletRequest request , AdminDAO adminDAO, UserDAO userDAO)
	
	{
		
		HttpSession session = request.getSession();
		String loggedInUser =(String) session.getAttribute("loggedInUser");
		User user= userDAO.getLoggedInUser(loggedInUser);
		
		if(user!=null)
		{
		if(user.getAdminStatus()==1)
		{
			return "admin-posts";
		}
		}
		
		
		else
		{
			String error = "Not Permitted to Access";
			request.setAttribute("errorMessage", error);
			return ("error");
		}
		return ("login");
			
	}
	
	
@RequestMapping(value="/admin/home.htm" , method=RequestMethod.GET)
	
	public String adminPanel(HttpServletRequest request , AdminDAO adminDAO, UserDAO userDAO)
	{
	HttpSession session = request.getSession();
	String loggedInUser =(String) session.getAttribute("loggedInUser");
	User user= userDAO.getLoggedInUser(loggedInUser);
	if(user!=null)
	{
	
	if(user.getAdminStatus()==1)
	{
		return "admin-panel";
	}
	}
	else
	{
		String error = "Not Permitted to Access";
		request.setAttribute("errorMessage", error);
		return ("error");
	}
	return ("login");
	
	}
	
	
	@RequestMapping(value="/admin/fetchEvents.htm" , method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public List<Event> allEvents(HttpServletRequest request , AdminDAO adminDAO)
	{
		List<Event> events = adminDAO.allEvents();
		return events;
	}
	
	
	
	
	
	@RequestMapping(value="/admin/users.htm" , method=RequestMethod.GET)
	public String userView(HttpServletRequest request , AdminDAO adminDAO, UserDAO userDAO)
	{
		HttpSession session = request.getSession();
		String loggedInUser =(String) session.getAttribute("loggedInUser");
		User user= userDAO.getLoggedInUser(loggedInUser);
		if(user!=null)
		{
		if(user.getAdminStatus()==1)
		{
		return "admin-userView";
		}
		}
		else
		{
			String error = "Not Permitted to Access";
			request.setAttribute("errorMessage", error);
			return ("error");
		}
		return "login";
		
	}
	
	@RequestMapping(value="/admin/events.htm" , method=RequestMethod.GET)
	public String events(HttpServletRequest request , AdminDAO adminDAO,UserDAO userDAO)
	{
		HttpSession session = request.getSession();
		String loggedInUser =(String) session.getAttribute("loggedInUser");
		User user= userDAO.getLoggedInUser(loggedInUser);
		
		if(user!=null)
		{
		if(user.getAdminStatus()==1)
		{
		
		return "admin-eventView";
		}
		}
		else
		{
			String error = "Not Permitted to Access";
			request.setAttribute("errorMessage", error);
			return ("error");
		}
		return ("login");
	}
	
	@RequestMapping(value="/admin/fetchUser.htm" , method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public List<User> allUsers(HttpServletRequest request , AdminDAO adminDAO)
	{
		System.out.println("in here in admin controller ");
		List<User> users= adminDAO.allUsers();
		System.out.println("size of user List"+users.size());
		return users;
	}
	
	@RequestMapping(value="/admin/Block.htm" , method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public void block(HttpServletRequest request , AdminDAO adminDAO)
	{
		String userName= request.getParameter("userName");
		System.out.println("in here to block user");
		adminDAO.block(userName);
		
	}
	
	
	@RequestMapping(value="/admin/unBlock.htm" , method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public void unblock(HttpServletRequest request , AdminDAO adminDAO)
	{
		String userName= request.getParameter("userName");
		System.out.println("in here to block user");
		adminDAO.unblock(userName);
		
	}
	
	

	@RequestMapping(value="/admin/makeAdmin.htm" , method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public void makeAdmin(HttpServletRequest request , AdminDAO adminDAO)
	{
		String userName= request.getParameter("userName");
		System.out.println("in here to block user");
		adminDAO.makeAdmin(userName);
		
	}
	
	
	@RequestMapping(value="/admin/removeAdmin.htm" , method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public void removeAdmin(HttpServletRequest request , AdminDAO adminDAO)
	{
		String userName= request.getParameter("userName");
		System.out.println("in here to block user");
		adminDAO.removeAdmin(userName);
		
	}
	
	@RequestMapping(value="/admin/fetchPosts.htm" , method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public List<Posts> fetchPosts(HttpServletRequest request , AdminDAO adminDAO)
	{
		List<Posts> posts = adminDAO.allPosts();
		return posts;
		
	}
	
	
	@RequestMapping(value="/admin/removePost.htm" , method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public void removePost(HttpServletRequest request , AdminDAO adminDAO)
	{
		String postId= request.getParameter("postId");
		System.out.println("in here to block user");
		adminDAO.removePost(postId);
		
	}
	
	@RequestMapping(value="/admin/removeEvents.htm" , method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public void removeEvents(HttpServletRequest request , AdminDAO adminDAO)
	{
		String eventId = request.getParameter("eventId");
		
adminDAO.removeEvent(eventId);
	
	}
	
	
	
	

}
