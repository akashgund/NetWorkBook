package com.me.project.dao;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.me.project.pojo.User;

public class UserDAO extends DAO{

	
	public User getUser(String user, String password )
	{
		try
		{
		begin();
		Query q = getSession().createQuery("from User where userName= :user and password = :password");
		q.setString("user", user);
		q.setString("password", password);			
		User userFound = (User) q.uniqueResult();
		if(userFound!=null && userFound.getActivationStatus()!=0)
		return userFound;
		}
		catch(Exception e)
		{
			rollback();
			System.out.println("Error in retrieving user with user name ="+ user);
			System.out.println(e.getMessage());
			
		}
		
		return null;
	}
	
	public User getLoggedInUser(String userName)
	{
		try
		{
		begin();
		Query q = getSession().createQuery("from User where userName= :user");
		q.setString("user", userName);
				
		User userFound = (User) q.uniqueResult();
		if(userFound!=null && userFound.getActivationStatus()!=0)
		return userFound;
		}
		catch(Exception e)
		{
			rollback();
			System.out.println("Error in retrieving user with user name ="+ userName);
			System.out.println(e.getMessage());
			
		}
		
		return null;
		
	}
	
	public boolean registerUser(User user)
	{
		try
		{
			begin();
			getSession().save(user);
			commit();
			return true;
			
		}
		catch(Exception e)
		{
			rollback();
			
			System.out.println("Could not register the user");
			System.out.println("Error"+e.getMessage());
		}
		
		
		return false;
		
				
	}
	public boolean updateUser(String email) throws Exception {
		try {
			begin();
			System.out.println("inside DAO");
			Query q = getSession().createQuery("from User where userEmail = :useremail");
			q.setString("useremail", email);
			User user = (User) q.uniqueResult();
			if(user!=null){
				user.setActivationStatus(1);
				getSession().update(user);
				commit();
				return true;
			}else{
				return false;
			}

		} catch (HibernateException e) {
			rollback();
			throw new Exception("Exception while creating user: " + e.getMessage());
		}
	
	}
	
	public void updateProfile(String path, User user)
	{
		try
		{
		
		user.setProfilePic(path);
		begin();
		getSession().save(user);
		commit();
		}
		catch (HibernateException e) {
			rollback();
			System.out.println("Exception while adding profile pic:" + e.getMessage());
		}
		
	}
	
	
}
