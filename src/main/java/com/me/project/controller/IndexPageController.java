package com.me.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.project.dao.NetworkDAO;
import com.me.project.pojo.User;

@Controller
//@RequestMapping(value="/user/index.htm")
public class IndexPageController {
	
	//@RequestMapping(value="/user/index.htm", method=RequestMethod.GET)
	public String indexPage(HttpServletRequest request,HttpServletResponse response,NetworkDAO networkDAO,ModelMap map )
	{
		if(request.getSession()!=null)
		{
HttpSession session = request.getSession();
			
			String loggedInUser =(String) session.getAttribute("loggedInUser");
			
			if(loggedInUser!=null)
			{
		System.out.println("in indexPage controller to refresh index");
		ArrayList<User> users = networkDAO.allUsers();
		map.addAttribute("networkList", users);
		System.out.println(request.getSession().getAttribute("loggedInUser"));
		return "index";
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
	
	

}
