package controllers;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Daos.ConnectionDao;
import Pojos.User;

@Controller
public class HelloController {
	
	/*static SessionFactory getSf() {
		Configuration configure = new AnnotationConfiguration().configure("hibernate.cfg.xml");// config load
		SessionFactory sf = configure.buildSessionFactory();// pool of session/connection will be created
		return sf;
	}*/
	@Autowired
	ConnectionDao dao;

	@RequestMapping(value = "registerController", method = RequestMethod.POST)
	public String saveDetails(@RequestParam("name") String name, @RequestParam("mobile") String mobile,
			@RequestParam("email") String email, @RequestParam("city") String city,
			@RequestParam("password") String password, Model model) {
		System.out.println("Entered into Registration page Controller");
		Session session = dao.openSession();// will get one connection
		User user = new User();
		user.setUserName(name);
		user.setUserMobile(mobile);
		user.setUserEmail(email);
		user.setUserCity(city);
		user.setUserPassword(password);
		model.addAttribute("name", name);
		session.save(user);// saving the user by using session
		session.beginTransaction().commit();// this transaction will permanently stores in DB
		session.close();
		return "Login";
	}

	@RequestMapping(value = "loginController", method = RequestMethod.GET)
	public String loginDetails(@RequestParam("email") String email, @RequestParam("password") String password,
			Model model) {
		System.out.println("Entered into Login page Controller");
		if (email != null & password != null) {
			Session session = dao.openSession();// will get one connection
			Query query = session.createQuery("from User where userEmail=:email and userPassword=:password");
			query.setParameter("email", email);
			query.setParameter("password", password);
			List<User> list = query.list();
			session.close();
			for (User user : list) {
				if (user.getUserEmail().equals(email) && user.getUserPassword().equals(password)) {
					model.addAttribute("msg", "Welcome " + user.getUserName());
					return "Home";
				} else {
					model.addAttribute("error", "Invalid User Details");
					return "Login";
				}
			}
		} else {
			model.addAttribute("error", "Invalid User Details");
			return "Login";
		}
		model.addAttribute("error", "Invalid User Details");
		return "Login";
	}
	
	List<User> list = null;
	@RequestMapping(value = "homeController", method = RequestMethod.POST)
	public String userDetails(Model model) {
		System.out.println("Entered into Home page Controller");
		/*Session session = dao.openSession();// will get one connection
		Query query = session.createQuery("from User");
		list = query.list();
		session.close();*/
		model.addAttribute("UserDetails", dao.fetchUsersList());
		return "UserDetails";
	}
	
	@RequestMapping(value = "deleteUser", method = RequestMethod.POST)
	public String deleteUser(@RequestParam("userEmail") String mail, Model model) {
		System.out.println("Entered into Delete Controller");
		Session session = dao.openSession();// will get one connection
		session.beginTransaction();
		Query deleteQuery = session.createQuery("delete from User where userEmail=:mail");
		deleteQuery.setParameter("mail", mail);
		deleteQuery.executeUpdate();
		session.getTransaction().commit();
		System.out.println("After deleting Retrieving the details from DB");		
		/*Query query = session.createQuery("from User");
		list = query.list();
		session.close();*/
		model.addAttribute("UserDetails", dao.fetchUsersList());
		return "UserDetails";
	}
	
	@RequestMapping(value = "editUser", method = RequestMethod.POST)
	public String editUser(@RequestParam("userEmail") String mail,User user, Model model) {
		System.out.println("Entered into Edit Controller");
		Session session = dao.openSession();// will get one connection
		Query editQuery = session.createQuery("from User where userEmail=?");
		editQuery.setParameter(0, mail);
		list = editQuery.list();
		session.close();
		model.addAttribute("UserDetails", list.get(0));
		return "UpdateUser";	
	}
	
	@RequestMapping(value = "updateUser", method = RequestMethod.POST)
	public String updateUser(User user, Model model) {
		System.out.println("Entered into Update Controller");
		Session session = dao.openSession();// will get one connection
		System.out.println(user.getUserName());
		session.update(user);
		session.beginTransaction().commit();
		System.out.println("After Updating Retrieving the details from DB");		
		/*Query retrieveQuery = session.createQuery("from User");
		list = retrieveQuery.list();*/
		model.addAttribute("UserDetails", dao.fetchUsersList());
		session.close();
		return "UserDetails";	
	}
	
	@RequestMapping(value = "sortUser")
	public String sortUser(Model model) {
		System.out.println("After Sorting Retrieving the details from DB");
		model.addAttribute("SortUserDetails", dao.sortUsersList());
		return "SortUser";	
	}
	
}