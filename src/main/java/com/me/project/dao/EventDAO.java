package com.me.project.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;

import com.me.project.pojo.Event;
import com.me.project.pojo.User;

public class EventDAO extends DAO {
	
	
	
	public boolean addEvent(String sender, String caption, String location)
	{
		System.out.println("In add Event ");
		System.out.println("Event Poster"+ sender);
		System.out.println("caption"+caption);
		System.out.println("location"+location);
		
begin();
		
		Query queryToFindUser =getSession().createQuery("from User where userName=:user");
		queryToFindUser.setString("user", sender);
		User user = (User)queryToFindUser.uniqueResult();
		System.out.println("User found:"+user.getUserName());
		
		commit();
		if(user!=null)
		{
		try
		{
	begin();
	Event event= new Event();
	event.setCaption(caption);
	event.setUpvotes(0);
	event.setVisitors(0);
	event.setOwnerUserId(user.getUserId());
	event.setOwnerName(user.getUserName());
	event.setLocation(location);
	getSession().save(event);
	System.out.println("Added event successfully");
	commit();
		}catch(HibernateException e)
		{
			System.out.println("Could not add event"+ e.getMessage());
			
			return false;
		}
		}
	
		
		
		return false;
	}
	
	
	public ArrayList<Event> loadEvents()
	{
		Criteria criteria = getSession().createCriteria(Event.class);
		ArrayList<Event> events =(ArrayList<Event>) criteria.list();
		
		return events;
	}
	
	
	public Event getLocation(String inp)
	{
		int eventId= Integer.valueOf(inp);
		Criteria cr= getSession().createCriteria(Event.class);
		cr.add(Restrictions.eq("eventId", eventId));
		Event event = (Event)cr.uniqueResult();
		String location=event.getLocation();
		location= location.substring(1, location.length()-1);
		event.setLocation(location);
		System.out.println(location);
		return event;
	}
	
	
	
	public void registerLikes(String inp)
	{
		begin();
		int eventId= Integer.valueOf(inp);
		Criteria cr= getSession().createCriteria(Event.class);
		cr.add(Restrictions.eq("eventId", eventId));
		Event event = (Event)cr.uniqueResult();
		int likes= event.getUpvotes();
		event.setUpvotes(likes+1);
		
		getSession().save(event);
		System.out.println("Like registered");
		
		commit();
	}
	
	
	public void registerVisitor(String inp, String userName)
	{
		begin();
		try {
		int eventId= Integer.valueOf(inp);
		Criteria cr= getSession().createCriteria(Event.class);
		cr.add(Restrictions.eq("eventId", eventId));
		Event event = (Event)cr.uniqueResult();
		int visitors= event.getVisitors();
		event.setVisitors(visitors+1);
		
		Criteria crUser = getSession().createCriteria(User.class);
		crUser.add(Restrictions.eq("userName",userName));
		User user = (User) crUser.uniqueResult();
		
		List<User> visitorList =event.getVisitor();
		int x=0;
		for(User u: visitorList)
		{
			if(u.getUserName().equalsIgnoreCase(userName))
				x=1;
		}
		if(x==0)
		visitorList.add(user);
		
		event.setVisitor((ArrayList<User>)visitorList);
		getSession().save(event);
		System.out.println("visitor incremented now adding to arrayList registered");
		}
		catch(HibernateException e)
		{
			System.out.println("could not add data for registerVisitor"+e.getMessage());
		}
		catch(Exception e1)
		{
			System.out.println("Exception in adding visitor");
		}
		commit();
	}
	
	public List<User> registeredVisitors(String inp)
	{
		System.out.print("In function to get registerred Visitors");
		begin();
		try {
		int eventId= Integer.valueOf(inp);
		Criteria cr= getSession().createCriteria(Event.class);
		cr.add(Restrictions.eq("eventId", eventId));
		Event event = (Event)cr.uniqueResult();
		System.out.println(event.getEventId()+"List for this event passed");
		//Query  query = getSession().createQuery("from user)
	List<User> visitorList= event.getVisitor();
		
		for(User u: visitorList)
		{
			System.out.println(u.getUserName());
		}
		
		System.out.println("These many visitors registered:"+visitorList.size());
		commit();
		return visitorList;
		}
		catch(HibernateException h)
		{
			System.out.println("Hibernate Exception occured" + h.getMessage());
		}
		catch(Exception e)
		{
			System.out.println("Unexpected exception Occured"+e.getMessage());
		}
		
		return null;
		
	}

}
