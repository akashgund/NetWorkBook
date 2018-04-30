package com.me.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.project.dao.ActivityDAO;
import com.me.project.dao.EventDAO;
import com.me.project.dao.NetworkDAO;
import com.me.project.pojo.Event;
import com.me.project.pojo.Posts;
import com.me.project.pojo.User;

@Controller
public class activityController {
	@RequestMapping(value="/activity/activityHome.htm",method=RequestMethod.GET)
	public String activity(HttpServletRequest request , NetworkDAO networkDAO , ModelMap map)
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
			
			return "activity";
			}
			else
			{
				String errorMessage = "User Not Logged In!";
				request.setAttribute("errorMessage", errorMessage);
				return ("error");
			}
		}
		else 
			return "login";
	}
	
	@RequestMapping(value="/activity/loadEvents.htm",method=RequestMethod.GET)
	
	public String  loadEventsPage(HttpServletRequest request,ActivityDAO activityDAO)
	{
		
		
		if(request.getSession()!=null)
		{
HttpSession session = request.getSession();
			
			String loggedInUser =(String) session.getAttribute("loggedInUser");
			
			if(loggedInUser!=null)
			{
			
			return "activity-Events";
			}
			else
			{
				String errorMessage = "User Not Logged In!";
				request.setAttribute("errorMessage", errorMessage);
				return ("error");
			}
			
		}
		else 
			return "login";
	}
	

	@RequestMapping(value="/activity/loadPosts.htm",method=RequestMethod.GET)
	
	public String  loadPostssPage(HttpServletRequest request,ActivityDAO activityDAO)
	{
		
		
		if(request.getSession()!=null)
		{
HttpSession session = request.getSession();
			
			String loggedInUser =(String) session.getAttribute("loggedInUser");
			
			if(loggedInUser!=null)
			{
			
			
			return "activity-Posts";
			}
			else
			{
				String errorMessage = "User Not Logged In!";
				request.setAttribute("errorMessage", errorMessage);
				return ("error");
			}
			
		}
		else 
			return "login";
	}
	
	
	
	
	@RequestMapping(value="/activity/Events.htm",method=RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Event> loadEvents(HttpServletRequest request,ActivityDAO activityDAO)
	{
		
		// retreive all events here and send it back to ajax call;
		HttpSession session = request.getSession();
		String userName = (String)session.getAttribute("loggedInUser");
		
		
		List<Event> allEvents = activityDAO.loadEvents(userName);
		
		
		System.out.println("returning all events for display");
		
		return allEvents;
	}
	
	
	@RequestMapping(value="/activity/Posts.htm", method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public List<Posts> loadPosts(HttpServletRequest request,ActivityDAO activityDAO)
	
	{
		HttpSession session = request.getSession();
		String userName = (String)session.getAttribute("loggedInUser");
		
		
		List<Posts> allPosts = activityDAO.loadPosts(userName);
		
		
		System.out.println("returning all reviewed posts");
		
		return allPosts;
		
	}
	
	
	
	

}
