package com.me.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.project.dao.MessageDAO;
import com.me.project.pojo.Message;

@Controller

public class MessageController {
	
	@RequestMapping(value = "/messages/sendMessages.htm", method = RequestMethod.GET , produces = "application/json")
	@ResponseBody
	public ArrayList<Message> addMessage(HttpServletRequest request,MessageDAO messageDAO)
	{
		// message here
		String messageString= request.getParameter("message");
		
		System.out.println("MESSAGE SENT:" +messageString);
		String senderName = request.getParameter("sender");
		String receiverName=request.getParameter("receiver");
		Message message = new Message();
		System.out.println("messageSender"+senderName+"receiverName"+receiverName);
		messageDAO.sendMessage(senderName,receiverName,messageString);
		ArrayList<Message> messages= messageDAO.fetchMessages(senderName, receiverName);
		System.out.println("Message list:"+ messages.size());
		ArrayList<Message> response=new ArrayList<Message>();
		for(int i=messages.size()-1;i>=0;i--)
			
		{
			response.add(messages.get(i));
			
		}
		return messages;
		
		
		
	}
	
	@RequestMapping(value = "/messages/fetchMessages.htm", method = RequestMethod.GET , produces = "application/json")
	@ResponseBody
	public ArrayList<Message> fetchMessages(HttpServletRequest request,MessageDAO messageDAO)
	{
		System.out.println("in message controller to fetch messages");
		String senderName=request.getParameter("sender");
		String receiverName=request.getParameter("receiver");
		System.out.println("senderName"+senderName);
		ArrayList<Message> messages= messageDAO.fetchMessages(senderName, receiverName);
		System.out.println("message thread" + messages.size());
		if(messages!=null)
			
		{
			return messages;
		}
		else
		{
			System.out.println("returns from here");
			request.setAttribute("errorMessage", "No messages Found");
		return null;
		}
	}

}
