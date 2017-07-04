package com.board.web.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.web.domain.Article;
import com.board.web.domain.BoardUser;
import com.board.web.mapper.Mapper;

@Service
public class GetService {
	@Autowired
	Mapper mapper;
	private static final Logger logger = LoggerFactory.getLogger(GetService.class);
	public List<Article> getArticleList(Map<?,?> paramMap) throws Exception {
		IGetService service = (map) -> mapper.getArticleList(map);
		return (List<Article>) service.execute(paramMap);
	}
	
	public List<BoardUser> getUser(Map<?,?> paramMap) throws Exception {
		IGetService service = (map) -> mapper.getUser(map);
		return (List<BoardUser>) service.execute(paramMap);
	}
	
	public List<BoardUser> getAllUser(Map<?,?> paramMap) throws Exception {
		IGetService service = (map) -> mapper.getUser(map);
		return (List<BoardUser>) service.execute(paramMap);
	}
	
	public int count(Map<?,?> paramMap) throws Exception {
		IGetService service = (map) -> mapper.count(map);
		return (int) service.execute(paramMap);
	}
}
