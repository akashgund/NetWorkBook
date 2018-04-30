package com.me.project.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.me.project.dao.UserDAO;
import com.me.project.pojo.User;

@Controller
public class ImageController {

	/*
	 * public void uploadImage(HttpServletResponse response, HttpServletRequest request, UserDAO udao) {
		System.out.println("inside image cont");
		Users user = null;
		try {
			user = udao.getUser(Integer.parseInt(request.getParameter("userid")));
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		try {
			Path file = Paths.get("C:\\Users\\Dell\\Desktop\\imageswt\\" + user.getPhotoFile());
			byte[] data = Files.readAllBytes(file);
			System.out.println(file);
			response.getOutputStream().write(data);
			response.getOutputStream().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	 */
	
	@RequestMapping(value = "/user/profilePic.htm", method = RequestMethod.GET)
	public void getImage(HttpServletResponse response, HttpServletRequest request, UserDAO userDAO)
	{
		String userName= request.getParameter("userName");
		User user= userDAO.getLoggedInUser(userName);
		if(user!=null)
		{
			if(user.getActivationStatus()==1 & user.getUserName()!=null)
		
			{

		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		
		String path=user.getProfilePic();
		if(path!=null)
		{
			Path file = Paths.get(path);
			byte[] data;
			try {
				data = Files.readAllBytes(file);
				System.out.println(file);
				response.getOutputStream().write(data);
				response.getOutputStream().close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
			}
		}
		
		
		
		
	}
	
}
