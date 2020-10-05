package com.bug;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Password {
	public String send(String email,String logid,String pass)
	{
		String msg="",msg1="your Login id="+logid+"and password="+pass;
		Properties props = new Properties();
		  props.put("mail.smtp.host", "smtp.gmail.com");
		  props.put("mail.smtp.socketFactory.port", "465");
		  props.put("mail.smtp.socketFactory.class",
		            "javax.net.ssl.SSLSocketFactory");
		  props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.port", "465");

		  Session session = Session.getDefaultInstance(props,
		   new javax.mail.Authenticator() {
		   protected PasswordAuthentication getPasswordAuthentication() {
		   return new PasswordAuthentication("ajitkumardas02@gmail.com","9778499205");//change accordingly
		   }
		  });

		  //compose message
		  try {
		   MimeMessage message = new MimeMessage(session);
		   message.setFrom(new InternetAddress("ajitkumardas02@gmail.com"));//change accordingly
		   message.addRecipient(Message.RecipientType.TO,new InternetAddress(email));
		   message.setSubject("Bug Tracking Password Recovery");
		   message.setText(msg1);

		   //send message
		   Transport.send(message);

		   msg="message sent successfully";

		  } catch (MessagingException e) {throw new RuntimeException(e);}

		return msg;
	
		
	}
}
