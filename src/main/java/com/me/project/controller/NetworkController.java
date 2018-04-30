package com.me.project.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.project.dao.NetworkDAO;
import com.me.project.pojo.User;

@Controller
@RequestMapping(value="../network/users.htm")
public class NetworkController {
	
	/*
	 * @RequestMapping(value = "/api/v1/getAdminHouses", method = RequestMethod.GET, produces = "application/json")
@ResponseBody
	 */
	@RequestMapping(value = "../network/users.htm", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public ArrayList<User> printUsers(NetworkDAO networkDAO)
	{
		ArrayList<User> users = networkDAO.allUsers();
		
		if(users.size()>0)
		{
			String result = "";
			for(int i =0;i<users.size();i++){
			
					result +=users.get(i).getUserName().toLowerCase()+",";
				
			}
			
			return users;
		}
		return null;
	}

}
