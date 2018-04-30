package com.me.project.dao;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.me.project.pojo.Dislikers;
import com.me.project.pojo.Likers;
import com.me.project.pojo.Posts;
import com.me.project.pojo.User;

public class PostDAO extends DAO{

	
	public boolean addPost(String userName, String caption, String location)
	{
		begin();
		
		Query queryToFindUser =getSession().createQuery("from User where userName=:user");
		queryToFindUser.setString("user", userName);
		User user = (User)queryToFindUser.uniqueResult();
		System.out.println("User found:"+user.getUserName());
		
		commit();
		if(user!=null)
		{
			begin();
		Posts post= new Posts();
		post.setCaption(caption);
		post.setDownvotes(0);
		post.setUpvotes(0);
		System.out.println("Stteing Location:"+location);
		if(location.length()>0)
		post.setLocation(location);
		else
			post.setLocation(null);
		post.setPostingUserId(user.getUserId());
		Date date= new Date();
		post.setTimestamp(date);
		System.out.println("posting user UserName"+userName);
		post.setUserName(userName);
		
		getSession().save(post);
		
		System.out.println("Post addded");
		commit();
		return true;
		
		}
		
		return false;
	}
	
	public ArrayList<Posts> loadPosts()
	{
begin();
		
		Query queryToLoadPosts =getSession().createQuery("from Posts");

		ArrayList<Posts> posts =(ArrayList) queryToLoadPosts.list() ;
		System.out.println("Posts found ="+ posts.size());
		
		
		commit();
		if(posts!=null)
		{
			return posts;
		}
		return null;
		
	}
	public void deletePost(int postId, String userName)
	{
		try
		{
			begin();
			System.out.println("gonna delete Post");
		
				Query queryToLikePosts =getSession().createQuery("from Posts where id=:postId");
				queryToLikePosts.setString("postId", String.valueOf(postId));
				Posts post = (Posts)queryToLikePosts.uniqueResult();
				getSession().delete(post);
				commit();
		}
		catch(HibernateException h)
		{
			System.out.println("Hibernate Exception occured  while deleting post "+ h.getMessage());
			
		}
		
	}
	
	
	public void regsiterLikes(int postId, String userName)
	{
		
begin();
		
try
{
		Query queryToLikePosts =getSession().createQuery("from Posts where id=:postId");
		queryToLikePosts.setString("postId", String.valueOf(postId));
		Posts post = (Posts)queryToLikePosts.uniqueResult();
		int x=post.getUpvotes();x++;
		System.out.println(" this is to register likes : " + post.getId() +" likes: "+x);
		post.setUpvotes(x);
		getSession().update(post);
		
		Likers liker= new Likers();
		Query querytochk = getSession().createQuery("from Likers where postId=:postID and userName=:UserName");
		querytochk.setString("postID", String.valueOf(postId));
		querytochk.setString("UserName", userName);
		
		List<Likers> likers =querytochk.list();
		if(likers.size()==0)
{
		liker.setPostId(postId);
		liker.setUserName(userName);
		getSession().save(liker);
	}
		
		commit();
}
catch(HibernateException h)
{
	System.out.println("Hibernate Exception occured "+ h.getMessage());
	
}
catch(Exception e)
{
	System.out.println("Exception occured in registerLike" +e.getMessage());
}
		

	}
	
	public void regsiterDislikes(int postId,String userName)
	{
		try
		{
			
		
begin();
		
		Query queryToLikePosts =getSession().createQuery("from Posts where id=:postId");
		queryToLikePosts.setString("postId", String.valueOf(postId));
		Posts post = (Posts)queryToLikePosts.uniqueResult();
		int x=post.getDownvotes();x++;
		post.setDownvotes(x);
		getSession().update(post);
		
			Dislikers disliker= new Dislikers();
			Query querytochk = getSession().createQuery("from Disliker where postId=:postID and userName=:UserName");
			querytochk.setString("postID", String.valueOf(postId));
			querytochk.setString("UserName", userName);
			List<Dislikers> dislikers =querytochk.list();
			if(dislikers.size()==0)
	{
		
			disliker.setPostId(postId);
			disliker.setUserName(userName);
		getSession().save(disliker);
	}
		commit();
		}
		catch(HibernateException h)
		{
			System.out.println("Hibernate Exception occured "+ h.getMessage());
			
		}
		catch(Exception e)
		{
			System.out.println("Exception occured in registerLike" +e.getMessage());
		}
			

	}
		
	
	
	public ArrayList<Likers> fetchLikes(int postId)
	
	{
		begin();
		Query queryListOfLikers = getSession().createQuery("from Likers where postId=:post");
		queryListOfLikers.setString("post",String.valueOf(postId));
		ArrayList<Likers> likers= (ArrayList)queryListOfLikers.list();
		for(Likers l: likers)
		{
			System.out.println(l.getUserName());
		}
		return likers;
		
		
	}
	
public ArrayList<Likers> fetchDislikes(int postId)
	
	{
		begin();
		Query queryListOfLikers = getSession().createQuery("from Dislikers where postId=:post");
		queryListOfLikers.setString("post",String.valueOf(postId));
		ArrayList<Likers> likers= (ArrayList)queryListOfLikers.list();
		for(Likers l: likers)
		{
			System.out.println(l.getUserName());
		}
		return likers;
		
		
	}

public Posts getLocation(int postId)
{
	begin();
	Query queryLocation = getSession().createQuery("from Posts where postId=:post");
	queryLocation.setString("post",String.valueOf( postId));
	
	Posts post = (Posts)queryLocation.uniqueResult();
	String location = post.getLocation();
	if(location!=null)
	{
	location=location.substring(1, location.length()-1);
	

	post.setLocation(location);
	}
	else
		post.setLocation(null);
	return post;
	
	
}
	
	
	
}
