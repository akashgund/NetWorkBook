package com.me.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.project.dao.PostDAO;
import com.me.project.pojo.Likers;
import com.me.project.pojo.Posts;

@Controller
public class PostController {

	
	@RequestMapping(value="/posts/addPost.htm",method=RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public boolean addPost(HttpServletRequest request,PostDAO postDAO)
	{
		String userName=request.getParameter("sender");
		String caption=request.getParameter("Post");
		String location=request.getParameter("location");
		System.out.println("in post controller");
		boolean postStatus= postDAO.addPost(userName, caption,location);
		if(postStatus)
			return true;
		else
			return false;
		
	}
	@RequestMapping(value="/posts/loadPost.htm",method=RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public ArrayList<Posts> loadPosts(HttpServletRequest request,PostDAO postDAO)
	{
		String page= request.getParameter("Page");
		System.out.println("Page"+page);
		int pNo=Integer.valueOf(page);
		ArrayList<Posts> posts =postDAO.loadPosts();
		if(posts!=null)
		{
			ArrayList<Posts> temp = new ArrayList<Posts>();
			
			int max=0;
			if(pNo*10<posts.size())
			{
				max=(pNo*10);
			}
			else
				max=posts.size();
			
			for(int i=0;i<max;i++)
			{
				temp.add(posts.get(i));
			}
			System.out.println("Returned these many posts"+max);
			return temp;
		}
		return null;
	}
	
	@RequestMapping(value="/posts/Likes.htm",method=RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public void registerLike(HttpServletRequest request,PostDAO postDAO)
	{
	int postId=	Integer.valueOf(request.getParameter("postId"));
	String userName= request.getParameter("userName");
	
	postDAO.regsiterLikes(postId,userName);
	
		
	}
	
	@RequestMapping(value="/posts/Dislikes.htm",method=RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public void registerDislike(HttpServletRequest request,PostDAO postDAO)
	{
	int postId=	Integer.valueOf(request.getParameter("postId"));
	String userName= request.getParameter("userName");
	postDAO.regsiterDislikes(postId,userName);
	
		
	}
	
	@RequestMapping(value="/posts/fetchLikes.htm",method=RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public ArrayList<Likers> fetchLike(HttpServletRequest request,PostDAO postDAO)
	{
	int postId=	Integer.valueOf(request.getParameter("postId"));
	System.out.println("postId::"+postId);
	
	
	ArrayList<Likers> likers =postDAO.fetchLikes(postId);
	
	return likers;
	
		
	}
	
	@RequestMapping(value="/posts/fetchDislikes.htm",method=RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public ArrayList<Likers> fetchDislike(HttpServletRequest request,PostDAO postDAO)
	{
	int postId=	Integer.valueOf(request.getParameter("postId"));
	System.out.println("postId::"+postId);
	
	
	ArrayList<Likers> dislikers =postDAO.fetchLikes(postId);
	System.out.println("Dislikes size"+dislikers.size());
	
	return dislikers;
	
		
	}
	
	@RequestMapping(value="/posts/getPostPath.htm",method=RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String postPath(HttpServletRequest request,PostDAO postDAO)
	{
	int postId=	Integer.valueOf(request.getParameter("postId"));
	System.out.println("postId::"+postId);
	
	String path = "";
	return path;
	
	
	

	
		
	}
	
	@RequestMapping(value="/posts/getLocation.htm",method=RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public Posts getLocation(HttpServletRequest request,PostDAO postDAO)
	{
	int postId=	Integer.valueOf(request.getParameter("postId"));
	String userName= request.getParameter("userName");
	Posts post = postDAO.getLocation(postId);
	System.out.println(post.getLocation()+" get location");
	
	if (post.getLocation()!=null)
		return post;
	
	else
	{
		return null;
	}
	}
	
	@RequestMapping(value="/posts/DeletePost.htm",method=RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public void deltePost(HttpServletRequest request,PostDAO postDAO)
	{
	int postId=	Integer.valueOf(request.getParameter("postId"));
	String userName= request.getParameter("userName");
	postDAO.deletePost(postId,userName);
	
		
	}
	
	
}
