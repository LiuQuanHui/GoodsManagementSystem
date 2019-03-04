package liu.code.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import liu.code.dao.UserDao;
import liu.code.entity.User;
import liu.code.service.IUserService;
@Service
public class UserService implements IUserService{
	@Autowired
	private UserDao userDao;
	public Integer addUser(User user) {
	
		return userDao.addUser(user);
	}
	public User findUser(User user) {
		
		return userDao.findUser(user);
	}
	public List<User> findAllUser() {
		
		return userDao.findAllUser();
	}
	public void updateUser(User user) {
		userDao.updateUser(user);
	}
	
	
}
