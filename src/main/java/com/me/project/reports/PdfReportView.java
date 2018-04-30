package com.me.project.reports;


import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Document;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;
import com.me.project.dao.PostDAO;
import com.me.project.pojo.Posts;


public class PdfReportView extends AbstractPdfView {

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document pdfdoc, PdfWriter pdfwriter,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//model was added to the scope by the Controller
		//User user = (User) model.get("user");
		System.out.println(model.size()+"posts");
		int i=0;
		//Collection<Posts> l =(Collection<Posts>)model.values();
		HashMap<String, Posts> m = new HashMap<String, Posts>();
		//m.putAll(model);
		 for (Map.Entry<String,Object> entry : model.entrySet())
		 {
			 System.out.println(entry.getValue().getClass().toString()+"trail Print");
			
			 if(entry.getValue().getClass().toString().equalsIgnoreCase("class com.me.project.pojo.Posts"))
			 {
			 	Posts p=(Posts)entry.getValue();
			 	System.out.println(p.getCaption());
			 	pdfdoc.add(new Paragraph("UserName: "+ p.getUserName() +" \nCaption " + p.getCaption() + " \nLikes:  "+ p.getUpvotes() +"\nDilikes: " +p.getDownvotes()));
			 }
		 }// +
		//pdfdoc.add(new Paragraph("Student Name: " + user.getFname() + " " + user.getLname()));
	}

}
