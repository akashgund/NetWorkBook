package com.me.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.project.dao.EventDAO;
import com.me.project.dao.NetworkDAO;
import com.me.project.pojo.Event;
import com.me.project.pojo.User;

@Controller
public class EventController {
	
	
	@RequestMapping(value="/event/eventHome.htm", method=RequestMethod.GET)
	public String eventHome(HttpServletRequest request, NetworkDAO networkDAO,ModelMap map)
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
		return "event";
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
	
	

	@RequestMapping(value="/posts/addEvent.htm",method=RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public void addEvent(HttpServletRequest request, EventDAO eventDAO)
	{
		
		// add parameter to event form and post the details here;
		
		String userName=request.getParameter("sender");
		String caption=request.getParameter("Caption");
		String location=request.getParameter("location");
		System.out.println("sending data to add event from controller");
		
		boolean success = eventDAO.addEvent(userName, caption, location);
		// make provision to return to error page if 
		
		
		
	}
	
	@RequestMapping(value="/event/loadEvents.htm",method=RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public ArrayList<Event> loadEvents(HttpServletRequest request, EventDAO eventDAO)
	{
		
		// retreive all events here and send it back to ajax call;
		
		ArrayList<Event> allEvents = eventDAO.loadEvents();
		
		
		System.out.println("returning all events for display");
		
		return allEvents;
	}
	
	
	
	@RequestMapping(value="/event/getLocation.htm",method=RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public Event getLocation(HttpServletRequest request, EventDAO eventDAO)
	{
		
		// add parameter to event form and post the details here;
		
		String eventId= request.getParameter("eventId");
		System.out.println("sending data to add event from controller to get location");
		
		Event event = eventDAO.getLocation(eventId);
		// make provision to return to error page if 
		
		return event;
		
	}
	@RequestMapping(value="/event/Likes.htm",method=RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public void registerLikes(HttpServletRequest request, EventDAO eventDAO)
	{
		String eventId= request.getParameter("eventId");
		System.out.println("sending data to add event from controller for adding likes");
		
		eventDAO.registerLikes(eventId);
	}
	
	
	
	@RequestMapping(value="/event/Visitor.htm",method=RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public void registerVisitor(HttpServletRequest request, EventDAO eventDAO)
	{
		String eventId= request.getParameter("eventId");
		String userName = request.getParameter("userName");
		System.out.println("sending data to add event from controller for adding visitor and visitor number");
		
		eventDAO.registerVisitor(eventId, userName);
	}
	
	@RequestMapping(value="/event/VisitorList.htm",method=RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<User> registeredVisitors(HttpServletRequest request, EventDAO eventDAO)
	{
		String eventId= request.getParameter("eventId");
		
		List<User> visitorList = eventDAO.registeredVisitors(eventId);
		System.out.println("returning registered Users");
		
		return visitorList;
	}
	

}
/*
 * Notification logic:
 * 
*/
