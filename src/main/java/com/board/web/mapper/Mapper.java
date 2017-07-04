package com.board.web.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.board.web.domain.Article;
import com.board.web.domain.BoardUser;

@Repository
public interface Mapper {
	/*CREATE*/
	public int register(Map<?,?> map) throws Exception;
	public int write(Map<?,?> map) throws Exception;
	
	/*READ*/
	public List<Article> getArticleList(Map<?,?> map) throws Exception;
	public List<BoardUser> getUser(Map<?,?> map) throws Exception;
	public List<BoardUser> getAllUser(Map<?,?> map) throws Exception;
	public int count(Map<?,?> map) throws Exception;
}