package com.me.project.dao;

import java.util.ArrayList;

import org.hibernate.Query;

import com.me.project.pojo.User;
/*
 * 
 * @RequestMapping(value = "/api/v1/getAdminHouses", method = RequestMethod.GET, produces = "application/json")
@ResponseBody
 */

public class NetworkDAO extends DAO {
	
	
	
	public ArrayList<User> allUsers()
	{
		Query query= getSession().createQuery("from User");
		ArrayList<User> users = (ArrayList) query.list();

		if(users.size()>0)
		{
			
			System.out.println("Returning all users");
			
			return users;
		}
		else
		{
			return null;
		}
		
		
	}

}
