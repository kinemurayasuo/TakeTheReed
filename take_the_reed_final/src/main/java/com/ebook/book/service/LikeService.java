package com.ebook.book.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebook.book.DAO.LikeDAO;
import com.ebook.book.vo.LikeVO;

@Service
public class LikeService {

	@Autowired
	private LikeDAO dao;
	
	// 총 검색 갯수
	public int getTotalRecordsCount(String userId, String searchType, String searchWord) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		
		return dao.getTotalRecordsCount(map);
	}
	
	// 찜목록List
	public ArrayList<LikeVO> likeList(String userId, String sort, int startRecord, int countPerPage) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("startRecord", startRecord);
		map.put("countPerpage",countPerPage);
		map.put("sort", sort);
	
		return dao.likeList(map);
	}
	
	public ArrayList<LikeVO> likeListSearch(String userId, String searchType, String searchWord, String sort,
			int startRecord, int countPerPage) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("startRecord", startRecord);
		map.put("countPerPage",countPerPage);
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		map.put("sort", sort);
	
		return dao.likeListSearch(map);
	}
}
