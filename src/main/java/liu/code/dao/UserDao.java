package liu.code.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import liu.code.entity.User;
public interface UserDao {
	/*
	 * 注册用户
	 */
	Integer addUser(User user);
	/*
	 * 查询用户
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
