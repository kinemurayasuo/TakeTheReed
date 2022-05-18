package com.ebook.book.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import com.ebook.book.vo.LikeVO;

public interface LikeMapper {

	int getTotalRecordsCount(HashMap<String, Object> map); // 총 갯수
	
	ArrayList<LikeVO> likeList(HashMap<String, Object> map); // 내 서재 리스트

	ArrayList<LikeVO> likeListSearch(HashMap<String, Object> map);

}
