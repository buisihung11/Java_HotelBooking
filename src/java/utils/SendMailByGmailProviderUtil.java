/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import static org.apache.struts2.ServletActionContext.getServletContext;

/**
 *
 * @author Admin
 */
public class SendMailByGmailProviderUtil {

    public static void sendTextMailTo(String sendToMail, String textMsg, String subject) throws MessagingException {
        ServletContext context = getServletContext();

        String host = context.getInitParameter("host");//or IP address  
        String port = context.getInitParameter("port");
        String userName = context.getInitParameter("userName");//from email
        String password = context.getInitParameter("password");

        //1. sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true"); //TLS

        //2.  creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            @Override
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };
        Session session = Session.getInstance(properties, auth);

        //3. Creates a new e-mail message
        Message msg = new MimeMessage(session);

        msg.setFrom(new InternetAddress(userName));
        InternetAddress[] toAddresses = {new InternetAddress(sendToMail)};
        msg.setRecipients(Message.RecipientType.TO, toAddresses);

        msg.setSubject(subject);
        msg.setSentDate(new Date());
        msg.setText(textMsg);

        //4. Send the message
        Transport.send(msg);
    }

    private void sendBookingConfirmMailWithMailtrapProvider(String userEmail, String token) throws MessagingException {
        //[NOTE] this mail will be sent on an sand box mail on mailtrap ( not go to real mail box )
        String to = userEmail;//change accordingly  
//        Gmail’s SMTP account,

        String userName = "91c28c9b77f112";//from mailtrap
        String password = "9d4d7fbf411267";

        //Get the session object  
        //1. sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", true);
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.mailtrap.io");
        properties.put("mail.smtp.port", "25");
        properties.put("mail.smtp.ssl.trust", "smtp.mailtrap.io");
        //2.  creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            @Override
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userName, password);
            }
        };

        Session session = Session.getInstance(properties, auth);

        //3. Creates a new e-mail message
        Message msg = new MimeMessage(session);

        msg.setFrom(new InternetAddress("hungbsse130615@fpt.edu.vn"));
        InternetAddress[] toAddresses = {new InternetAddress(to)};
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject("Test send mail");
        msg.setSentDate(new Date());
        msg.setText("Hello, this is example of sending email. ?token=" + token);

//        MimeMessage message = new MimeMessage(session);
//        message.setFrom(new InternetAddress(from));
//        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
        //4. Send the message
        Transport.send(msg);
        System.out.println("message sent successfully....");

    }
}
