package com.ebook.book.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ebook.book.vo.LikeVO;

@Repository
public class LikeDAO {

	@Autowired
	private SqlSession session;

	// 총 갯수
	public int getTotalRecordsCount(HashMap<String, Object> map) {
		int result =0;
		LikeMapper mapper = null;
	
		try {
			mapper = session.getMapper(LikeMapper.class);
			result = mapper.getTotalRecordsCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	return result;
	}
	
	// 내 서재 리스트
	public ArrayList<LikeVO> likeList(HashMap<String, Object> map) {
		ArrayList<LikeVO> result = null;
		LikeMapper mapper = null;
		
		try {
			mapper = session.getMapper(LikeMapper.class);
			result = mapper.likeList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<LikeVO> likeListSearch(HashMap<String, Object> map) {
		ArrayList<LikeVO> result = null;
		LikeMapper mapper = null;
		
		try {
			mapper = session.getMapper(LikeMapper.class);
			result = mapper.likeListSearch(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
