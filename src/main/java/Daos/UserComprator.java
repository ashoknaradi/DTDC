package Daos;

import java.util.Comparator;

import Pojos.User;

public class UserComprator implements Comparator<User> {
	@Override
	public int compare(User o1, User o2) {		
		if (o1.getUserName().compareTo(o2.getUserName()) != 0) {
			return o1.getUserName().compareTo(o2.getUserName());
		} else if (o1.getUserMobile().compareTo(o2.getUserMobile()) != 0) {
			return o1.getUserMobile().compareTo(o2.getUserMobile());
		} else if (o1.getUserEmail().compareTo(o2.getUserEmail()) != 0) {
			return o1.getUserEmail().compareTo(o2.getUserEmail());
		}
		return o1.getUserCity().compareTo(o2.getUserCity());
	}
}
