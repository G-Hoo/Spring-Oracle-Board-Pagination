package com.board.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.board.web.domain.BoardUser;
import com.board.web.service.GetService;
import com.board.web.service.PostService;

@RestController
public class PermissionController {
	@Autowired GetService getService;
	@Autowired PostService postService;
	
	@RequestMapping(value = "/user/login", method = RequestMethod.POST, consumes = "application/json")
	public @ResponseBody Map<?, ?> login(@RequestBody Map<String, String> paramMap) throws Exception {
		System.out.println("login Entered");
		Map<String, Object> map = new HashMap<>();
		BoardUser user = new BoardUser();
		map.put("id", paramMap.get("userId"));
		for (BoardUser boardUser : getService.getAllUser(map)) {
			if(boardUser.getId().equals(map.get("id"))){
				user = getService.getUser(map).get(0);
				break;
			}
		}
		if(user.getPass().equals(paramMap.get("pass"))){
			map.put("success", "1");
			map.put("user", user);
		}
		return map;
	}
	
	@RequestMapping(value = "/user/register", method = RequestMethod.POST, consumes = "application/json")
	public @ResponseBody Map<?, ?> register(@RequestBody Map<String, String> paramMap) throws Exception {
		System.out.println("회원가입 Entered");
		Map<String, Object> map = new HashMap<>();
		map.put("id", paramMap.get("userId"));
		map.put("pass", paramMap.get("pass"));
		map.put("phone", paramMap.get("pass"));
		map.put("gender", "M");
		map.put("age", paramMap.get("age"));
		if(postService.register(map)==1){
			System.out.println("회원가입성공");
			map.put("success", "1");
		} else {
			System.out.println("회원가입실패");
			map.clear();
		}
		return map;
	}
}
