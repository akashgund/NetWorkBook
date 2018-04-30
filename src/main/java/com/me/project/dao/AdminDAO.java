package com.me.project.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.me.project.pojo.Event;
import com.me.project.pojo.Posts;
import com.me.project.pojo.User;

public class AdminDAO extends DAO{
	
	
	public List<User> allUsers()
	{
		try {
		
		Criteria cr = getSession().createCriteria(User.class);
		List<User> users =cr.list();
		return users;
		}
		catch(HibernateException h)
		{
			System.out.println("error in retrieving usrs" +h.getMessage());
		}
		return null;
		
	}

	
	
	public List<Posts> allPosts()
	{
		
		Criteria cr = getSession().createCriteria(Posts.class);
		List<Posts> posts = cr.list();
		return posts;
		
		
	}
	
	
	public List<Event> allEvents()
	{
		Criteria cr = getSession().createCriteria(Event.class);
		List<Event> events = cr.list();
		return events;
	}
	
	
	
	public void  block(String userName)
	{
		try {
		Query q= getSession().createQuery( "from User where userName=:user");
		q.setString("user", userName);
		User user = (User)q.uniqueResult();
		
		user.setActivationStatus(0);
		begin();
		getSession().save(user);
		commit();
		
		
		}
		catch(HibernateException h)
		{
			System.out.println("exception occured in blocking the user"+h.getMessage());
			
		}
		
		
	}
	
	
	
	
	public void  unblock(String userName)
	{
		try {
		Query q= getSession().createQuery( "from User where userName=:user");
		q.setString("user", userName);
		User user = (User)q.uniqueResult();
		
		user.setActivationStatus(1);
		begin();
		getSession().save(user);
		commit();
		
		
		}
		catch(HibernateException h)
		{
			System.out.println("exception occured in unblocking the user"+h.getMessage());
			
		}
		
		
	}
	
	
	
	public void  makeAdmin(String userName)
	{
		try {
		Query q= getSession().createQuery( "from User where userName=:user");
		q.setString("user", userName);
		User user = (User)q.uniqueResult();
		
		user.setAdminStatus(1);;
		begin();
		getSession().save(user);
		commit();
		
		
		}
		catch(HibernateException h)
		{
			System.out.println("exception occured in unblocking the user"+h.getMessage());
			
		}
		
		
	}
	
	
	
	public void  removeAdmin(String userName)
	{
		try {
		Query q= getSession().createQuery( "from User where userName=:user");
		q.setString("user", userName);
		User user = (User)q.uniqueResult();
		
		user.setAdminStatus(0);;
		begin();
		getSession().save(user);
		commit();
		
		
		}
		catch(HibernateException h)
		{
			System.out.println("exception occured in unblocking the user"+h.getMessage());
			
		}
		
		
	}
	
	
	
	public void removePost(String postId)
	{
		try {
			Query q= getSession().createQuery( "from Posts where postId=:postId");
			q.setString("postId", postId);
			Posts post= (Posts)q.uniqueResult();
			
			
			begin();
			getSession().delete(post);
			commit();
			
			
			}
			catch(HibernateException h)
			{
				System.out.println("exception occured in unblocking the user"+h.getMessage());
				
			}
		
	}
	
	public void removeEvent(String eventId)
	{
		try {
			Query q= getSession().createQuery( "from Event where eventId=:eventId");
			q.setString("eventId",eventId);
			Event event= (Event)q.uniqueResult();
			
			
			begin();
			getSession().delete(event);
			commit();
			
			
			}
			catch(HibernateException h)
			{
				System.out.println("exception occured in Deleting Event"+h.getMessage());
				
			}
	}
	
	
	
	public User getAdmin(String userName)
	{
		try {
		Query q= getSession().createQuery( "from User where userName=:user");
		q.setString("user", userName);
		User user = (User)q.uniqueResult();
		return user;
		}
		catch(HibernateException h)
		{
			System.out.println("exception occured in Deleting Event"+h.getMessage());
			
		}
		return null;
	}
		
}
