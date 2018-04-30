package com.me.project.dao;

import java.util.ArrayList;
import java.util.Date;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.me.project.pojo.Message;
import com.me.project.pojo.User;

public class MessageDAO extends DAO {
	
	
	public ArrayList<Message> fetchMessages(String senderName, String receiverName)
	{
		try
		{
		begin();
		Query queryforSender=getSession().createQuery("from User where userName=:sender");
		queryforSender.setString("sender", senderName);
		User sender=(User)queryforSender.uniqueResult();
		Query queryforReceiver = getSession().createQuery("from User where userName=:receiver");
		queryforReceiver.setString("receiver", receiverName);
		User receiver=(User)queryforReceiver.uniqueResult();
		
		int senderId=sender.getUserId();
		int receiverId=receiver.getUserId();
		
		System.out.println("Fetching chat");
		System.out.println(senderId+" with "+receiverId);
		Query queryforMessages = getSession().createQuery("from Message where (senderID=:senderId and receiverID=:receiverId) or (senderID=:rev_senderId and receiverID=:rev_receiverId)");
		queryforMessages.setString("senderId", String.valueOf(senderId));
		queryforMessages.setString("receiverId", String.valueOf(receiverId));
		queryforMessages.setString("rev_senderId", String.valueOf(receiverId));
		queryforMessages.setString("rev_receiverId", String.valueOf(senderId));
		ArrayList<Message> messageRetrived= (ArrayList<Message>)queryforMessages.list();
		return messageRetrived;
		
		}
		catch(HibernateException e)
		{
			System.out.println("could not retreive messages" + e.getMessage());
			rollback();
		}
	
		
		
		return null;///null if no message were found;
	}
	
	public ArrayList<Message> fetchChat(String senderName, String receiverName)
	{
		try
		{
		begin();
		}
		catch(HibernateException e)
		{
			
		}
		return null;
	}
	
	
	public void sendMessage(String senderName, String receiverName, String messageString)
	{
		try
		{
		begin();
		Query queryToFindSender = getSession().createQuery("from User where userName=:sender");
		queryToFindSender.setString("sender", senderName);
		Query queryToFindReceiver=getSession().createQuery("from User where userName=:receiver");
		queryToFindReceiver.setString("receiver", receiverName);
		
		
		User sender= (User) queryToFindSender.uniqueResult();
		User receiver= (User) queryToFindReceiver.uniqueResult();
		int senderId=sender.getUserId();
		int receiverId=receiver.getUserId();
		System.out.println("SenderId"+senderId);
		System.out.println("receiverId"+receiverId);
		
		commit();
		begin();
		Message message= new Message();
		Date date= new Date();
		message.setMessage(messageString);
		message.setReceiverID(receiverId);
		message.setSenderID(senderId);
		message.setTimestamp(date);
		getSession().save(message);
		
		commit();
	}
		catch(HibernateException e)
		{
			System.out.println("could not post message to DB "+ e);
		}

}
}
