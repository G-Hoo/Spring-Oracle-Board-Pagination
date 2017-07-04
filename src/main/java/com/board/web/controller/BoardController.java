package com.board.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.board.web.domain.Article;
import com.board.web.service.GetService;
import com.board.web.service.PostService;
import com.board.web.util.Util;

@RestController
public class BoardController {
	@Autowired GetService getService;
	@Autowired PostService postService;
	
	@RequestMapping(value = "/board/pagination/{pageNo}", method = RequestMethod.POST, consumes = "application/json")
	public @ResponseBody Map<?, ?> board(@PathVariable String pageNo, @RequestBody Map<String, String> paramMap) throws Exception {
		System.out.println("board Entered");
		System.out.println("pageNo :   " + pageNo);
		Map<String, Object> map = new HashMap<>();
		map.put("group", "Article");
		int pageNumber = Integer.parseInt(paramMap.get("pageNo"));
		int theNumberOfRows = getService.count(map);
		System.out.println("theNumberOfRows:    " + theNumberOfRows);
		int pagesPerOneBlock = 5, rowsPerOnePage = 5, 
				theNumberOfPages = (theNumberOfRows % rowsPerOnePage == 0) ? theNumberOfRows / rowsPerOnePage
						: theNumberOfRows / rowsPerOnePage + 1,
				startPage = pageNumber - ((pageNumber - 1) % pagesPerOneBlock),
				endPage = ((startPage + rowsPerOnePage - 1) < theNumberOfPages) ? startPage + pagesPerOneBlock - 1
						: theNumberOfPages,
				startRow = (pageNumber - 1) * rowsPerOnePage + 1, endRow = pageNumber * rowsPerOnePage,
				prevBlock = startPage - pagesPerOneBlock, nextBlock = startPage + pagesPerOneBlock;
		System.out.println("startRow:  " + startRow);
		System.out.println("endRow:   " + endRow);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<Article> list = getService.getArticleList(map);
		map.put("list", list);
		map.put("theNumberOfRows", theNumberOfRows);
		map.put("nextBlock", nextBlock);
		map.put("prevBlock", prevBlock);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("pageNumber", pageNumber);
		map.put("theNumberOfPages", theNumberOfPages);
		map.put("result", "SUCCESS");
		return map;
	}
	
	@RequestMapping(value = "/board/write", method = RequestMethod.POST, consumes = "application/json")
	public @ResponseBody Map<?, ?> write(@RequestBody Map<String, String> paramMap) throws Exception {
		System.out.println("write Entered");
		Map<String, Object> map = new HashMap<>();
		System.out.println(paramMap.get("title"));
		System.out.println(paramMap.get("content"));
		map.put("id", "ahri");
		map.put("title", paramMap.get("title"));
		map.put("content", paramMap.get("content"));
		map.put("regdate", Util.nowDate());
		if(postService.write(map)==1){
			map.clear();
			map.put("success", "1");
		} else {
			map.clear();
		}
		return map;
	}
	
	
}
