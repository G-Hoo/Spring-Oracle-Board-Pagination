package com.board.web.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.web.mapper.Mapper;

@Service
public class PostService {
	@Autowired
	Mapper mapper;
	public int register(Map<?,?> paramMap) throws Exception {
		IGetService service = (map) -> mapper.register(map);
		return (int) service.execute(paramMap);
	}
	
	public int write(Map<?,?> paramMap) throws Exception {
		IGetService service = (map) -> mapper.write(map);
		return (int) service.execute(paramMap);
	}
}
