package com.me.project.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import com.me.project.pojo.Dislikers;
import com.me.project.pojo.Event;
import com.me.project.pojo.Likers;
import com.me.project.pojo.Posts;
import com.me.project.pojo.User;

public class ActivityDAO extends DAO {
	

	public List<Event> loadEvents(String userName )
	
	{
		
		
		Criteria crUser = getSession().createCriteria(User.class);
		crUser.add(Restrictions.eq("userName",userName));
		User user = (User) crUser.uniqueResult();
		
		int userId =user.getUserId();
		
		
		Criteria criteria = getSession().createCriteria(Event.class);
		
		List<Event> events = criteria.list();
		List<Event> interested = new ArrayList();
		
		for(Event e: events)
		{
			
		List<User> visitorList= e.getVisitor();
		for(User u : visitorList)
		{
			if(u.getUserName().equalsIgnoreCase(userName))
			{
				interested.add(e);
			}
		}
		
		}
		/// query to find all the events user in visiting;
		
		
		
		return interested;
	}
	
	
	public List<Posts> loadPosts(String userName)
	{
		
		Criteria crUser = getSession().createCriteria(User.class);
		crUser.add(Restrictions.eq("userName",userName));
		User user = (User) crUser.uniqueResult();
		
		int userId =user.getUserId();
		
		Criteria postCriteria = getSession().createCriteria(Posts.class);
		
		List<Posts> posts= postCriteria.list();
		List<Posts> reviewed = new ArrayList();
		for(Posts p : posts)
		{
			Query querytochk = getSession().createQuery("from Likers where postId=:postID and userName=:UserName");
			querytochk.setString("postID", String.valueOf(p.getId()));
			querytochk.setString("UserName", userName);
			
			List<Likers> likers =querytochk.list();
			if(likers.size()==0)
	{
				reviewed.add(p);
				
	}
		}
		
		for(Posts p:posts) {
			
			
			Query querytochk = getSession().createQuery("from Disliker where postId=:postID and userName=:UserName");
			querytochk.setString("postID", String.valueOf(p.getId()));
			querytochk.setString("UserName", userName);
			List<Dislikers> dislikers =querytochk.list();
			if(dislikers.size()==0)
	{
				
				reviewed.add(p);
	}
	}
		
		return reviewed;
		}
		
	
	

}
