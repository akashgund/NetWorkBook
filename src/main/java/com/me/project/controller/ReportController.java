package com.me.project.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.me.project.dao.PostDAO;
import com.me.project.dao.UserDAO;
import com.me.project.pojo.Posts;
import com.me.project.pojo.User;
import com.me.project.reports.PdfReportView;



@Controller
@RequestMapping("/admin/report.htm")
public class ReportController {
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView createReport(PostDAO postDAO,HttpServletRequest request, UserDAO userDAO)
	{

		HttpSession session = request.getSession();
		String loggedInUser =(String) session.getAttribute("loggedInUser");
		User user= userDAO.getLoggedInUser(loggedInUser);
		
		if(user!=null)
		{
		if(user.getAdminStatus()==1)
		{
		
		//will be passed to the View Page
		Map<String, Posts> model = new HashMap<String, Posts>();
		//model.put("user", user);
		List<Posts> posts = postDAO.loadPosts();
		//model.put("posts", posts);
		int i=0;
		for(Posts p: posts)
		{
			model.put("post"+i,p);
			System.out.println(model.get("post"+i));
			i++;
		}
		
		return new ModelAndView(new PdfReportView(), model);
	}
		}
		return new ModelAndView("login");

}
}
