package Daos;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

import Pojos.User;

public class ConnectionDao {
	public Session openSession() {
		Configuration configure = new AnnotationConfiguration().configure("hibernate.cfg.xml");// config load
		SessionFactory sf = configure.buildSessionFactory();// pool of session/connection will be created
		Session session = sf.openSession();// will get one connection
		return session;
	}
	public List<User> fetchUsersList() {
		Session session = openSession();// will get one connection
		Query query = session.createQuery("from User");
		List<User> list = query.list();
		session.close();
		return list;
	}
}
