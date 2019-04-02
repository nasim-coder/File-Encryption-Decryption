/**
 * 
 */
package dao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import beans.Users;

/**
 * @author NasimAhmadKhan
 *
 */
public class Userdao {
	// To register new user
	public String register(String fname, String lname, String email, String mobile, String gender, String password) {
	String s=null;
	Users user = new Users();
	try {
	user.setFname(fname);
	user.setLname(lname);
	user.setEmail(email);
	user.setMobile(mobile);
	user.setGender(gender);
	user.setPassword(password);
	
	
	Configuration cfg = new Configuration();
	cfg.configure("resources/hibernate.cfg.xml");
	SessionFactory sf = cfg.buildSessionFactory();
	Session session = sf.openSession();
	s=(String) session.save(user);
	session.beginTransaction().commit();
	session.close();

	
	}
	catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	System.out.println("Data Entered successfully");
	return s;
  }
	// This method will authenticate the user when logging in
	public Users authenticate(String email, String password)
	{
		Users user=null;
		try {
		Configuration cfg=new Configuration();
		cfg.configure("resources/hibernate.cfg.xml");
		SessionFactory sf=cfg.buildSessionFactory();
		Session session=sf.openSession();
		Transaction t=session.beginTransaction();
		Query<?> query=session.createQuery("from Users where email=:e and password=:p");
		query.setParameter("e",email);
		query.setParameter("p",password);
		List<?> list=query.list();
		Iterator<?> itr=list.iterator();
		   if(itr.hasNext())
		     {
			user=(Users) itr.next();
		     } 
		System.out.println("This is user "+user);
		    }
		catch (Exception e) 
		{
			// TODO: handle exception
			e.printStackTrace();
			e.getMessage();
		}
		return user;
	}

	public int UpdatePassword(String password, String email) {
		// TODO Auto-generated method stub
		int i=-1;
		Configuration cfg=new Configuration();
		cfg.configure("resources/hibernate.cfg.xml");
		SessionFactory sf=cfg.buildSessionFactory();
		Session session=sf.openSession();
		Transaction t=session.beginTransaction();
		Query query=session.createQuery("update Users set password=:p where email=:e");
		query.setParameter("p",password);
		query.setParameter("e",email);		
		i=query.executeUpdate();
		t.commit();
		return i;
	}
	
	public Users forgot(String email)
	{
		Users user=null;
		try {
		Configuration cfg=new Configuration();
		cfg.configure("resources/hibernate.cfg.xml");
		SessionFactory sf=cfg.buildSessionFactory();
		Session session=sf.openSession();
		Transaction t=session.beginTransaction();
		Query<?> query=session.createQuery("from Users where email=:e");
		query.setParameter("e",email);
		List<?> list=query.list();
		Iterator<?> itr=list.iterator();
		   if(itr.hasNext())
		     {
			user=(Users) itr.next();
		     }
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return user; 
	}
}
