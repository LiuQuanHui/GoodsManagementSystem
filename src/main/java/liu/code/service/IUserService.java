package liu.code.service;

import java.util.List;

import liu.code.entity.User;

public interface IUserService {
	/*
	 * 新增用户
	 */
	Integer addUser(User user);
	/*
	 * 
	 */
	User findUser(User user);
	/*
	 * 查询所有用户
	 */
	List<User> findAllUser();
	/*
	 * 修改用户信息
	 */
	void updateUser(User user);
}
