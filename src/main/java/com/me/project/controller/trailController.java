package com.me.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.me.project.dao.NetworkDAO;
import com.me.project.pojo.User;

@Controller
public class trailController {

	@RequestMapping(value="/user/index.htm", method=RequestMethod.GET)
	public String indexPage(HttpServletRequest request,HttpServletResponse response,NetworkDAO networkDAO,ModelMap map )
	{
		System.out.println("in indexPage controller to refresh index");
		ArrayList<User> users = networkDAO.allUsers();
		map.addAttribute("networkList", users);
		System.out.println(request.getSession().getAttribute("loggedInUser"));
		return "index";
	}
}
