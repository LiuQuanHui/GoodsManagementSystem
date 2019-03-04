package liu.code.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.Collection;
import java.util.Enumeration;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.AsyncContext;
import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpUpgradeHandler;
import javax.servlet.http.Part;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.sun.org.apache.regexp.internal.recompile;

import liu.code.entity.User;
import liu.code.service.IUserService;
import net.sf.json.JSONObject;

@Controller
public class UserController {
	/*
	 * 新增用户
	 */
	@Autowired
	private IUserService userService;

	public static HttpSession getSession() {
		HttpSession session = null;
		session = getRequest().getSession();
		return session;
	}

	public static HttpServletRequest getRequest() {
		ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		return attrs.getRequest();
	}

	@RequestMapping("/user")
	public String addUser(User user, Model model) {
		userService.addUser(user);
		return "redirect:/home";
	}

	/*
	 * 验证用户登录
	 */
	@RequestMapping("/findUser")
	public String findUser(@Param("telephone") String telephone, @Param("password") String password,Model model) {
		User user = new User(telephone, password);
		if (userService.findUser(user) != null) {
			User user2 = userService.findUser(user);
			getSession().setAttribute("user", user2);
			return "redirect:/home";
		}else {
			model.addAttribute("msg", "*账号密码错误,或用户不存在,请确认！");
		}
		return "login";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	/*
	 * 查询所有用户信息
	 */
	@RequestMapping("/users")
	@ResponseBody
	public List<User> findAllUser() {
		return userService.findAllUser();
	}

	/*
	 * 查询用户信息
	 */
	@RequestMapping("/updateUserById/")
	@ResponseBody
	public User updateUserById(@Param("id") int id) {
		User user = new User();
		user.setUid(id);
		return userService.findUser(user);
	}

	/*
	 * 更新用户信息
	 */
	@RequestMapping("/updateUser/")
	public String updateUser(User user) {
		userService.updateUser(user);
		return "home";
	}

	@RequestMapping("/logout")
	public String logout() {
		getSession().invalidate();
		return "redirect:/login";
	}
}
