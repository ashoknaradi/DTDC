package Daos;

import java.util.List;
import java.util.Set;
import java.util.TreeSet;

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
		Session session = openSession();
		Query query = session.createQuery("from User");
		List<User> list = query.list();
		session.close();
		return list;
	}

	public Set<User> sortUsersList() {
		Session session = openSession();
		Query query = session.createQuery("from User");
		List<User> list = query.list();
		Set<User> studentSet = new TreeSet<User>(new UserComprator());
		studentSet.addAll(list);
		session.close();
		return studentSet;
	}
}
