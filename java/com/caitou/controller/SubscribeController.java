package com.caitou.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.caitou.bean.User;
import com.caitou.entity.ResultDTO;
import com.caitou.service.FocusService;
import com.caitou.service.UserService;

@Controller
public class SubscribeController {

	@Resource
	UserService userService;

	@Resource
	FocusService focusService;

	@RequestMapping(value = "subscribe")
	public String goToSubscribe(String userName, HttpServletRequest request,
			HttpSession session) {
		String userNameInSession = (String) session
				.getAttribute("userNameInSession");
		User user = userService.selectByUserName(userName);
		List<Integer> intList = focusService
				.selectFocusUserIdByUserName(userNameInSession);
		List<User> userList = new ArrayList<>();
		for (int i = 0; i < intList.size(); i++) {
			User user2 = userService.selectByUserId(intList.get(i));
			if (user2 != null) {
				if (userNameInSession != null) {
					user2.setIsFocused(focusService.isFocused(user2.getId(),
							userNameInSession));
				}
				userList.add(user2);
			}
		}
		request.setAttribute("user", user);
		request.setAttribute("userList", userList);
		return "subscribe";
	}

	@ResponseBody
	@RequestMapping(value = "getUserFocus.do", produces = "application/json")
	public ResultDTO getUserFocus(String userName, HttpSession session) {
		ResultDTO result = new ResultDTO();
		String userNameInSession = (String) session
				.getAttribute("userNameInSession");
		List<Integer> intList = focusService
				.selectFocusUserIdByUserName(userNameInSession);
		List<User> userList = new ArrayList<>();
		for (int i = 0; i < intList.size(); i++) {
			User user = userService.selectByUserId(intList.get(i));
			if (user != null) {
				if (userNameInSession != null) {
					user.setIsFocused(focusService.isFocused(user.getId(),
							userNameInSession));
				}
				userList.add(user);
			}
		}
		result.setUserList(userList);
		result.setSuccess(true);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "getUserFans.do", produces = "application/json")
	public ResultDTO getUserFans(String userName, HttpSession session) {
		ResultDTO result = new ResultDTO();
		String userNameInSession = (String) session
				.getAttribute("userNameInSession");
		User user = userService.selectByUserName(userName);
		List<String> stringList = focusService.selectUserNameByFocusUserId(user
				.getId());
		List<User> userList = new ArrayList<>();
		for (int i = 0; i < stringList.size(); i++) {
			user = userService.selectByUserName(stringList.get(i));
			if (user != null) {
				if (userNameInSession != null) {
					user.setIsFocused(focusService.isFocused(user.getId(),
							userNameInSession));
				}
				userList.add(user);
			}
		}
		result.setUserList(userList);
		result.setSuccess(true);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "addFocus.do", produces = "application/json")
	public ResultDTO addFocus(String focusUserId, HttpSession session) {
		ResultDTO result = new ResultDTO();
		String userNameInSession = (String) session
				.getAttribute("userNameInSession");
		if (focusUserId != null && userNameInSession != null) {
			focusService.insertFocus(focusUserId, userNameInSession);
			result.setSuccess(true);
		} else {
			result.setSuccess(false);
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "removeFocus.do", produces = "application/json")
	public ResultDTO removeFocus(String focusUserId, HttpSession session) {
		ResultDTO result = new ResultDTO();
		String userNameInSession = (String) session
				.getAttribute("userNameInSession");
		if (focusUserId != null && userNameInSession != null) {
			focusService.deleteById(focusUserId, userNameInSession);
			result.setSuccess(true);
		} else {
			result.setSuccess(false);
		}
		return result;
	}
}
