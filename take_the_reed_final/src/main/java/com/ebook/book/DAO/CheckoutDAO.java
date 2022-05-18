package com.ebook.book.DAO;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CheckoutDAO {
	
	@Autowired
	private SqlSession session;

	public int sub(HashMap<String, Object> map) {
		int result = 0;
		UserMapper mapper = null;
		
		try {
			mapper = session.getMapper(UserMapper.class);
			System.out.printf("addDate: %s", map.get("addDate"));
			result = mapper.updateSubEndAdd(map);
			System.out.println("아쎄이");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public String chkSub(String userId) {
		String result = "";
		UserMapper mapper = null;
		
		try {
			mapper = session.getMapper(UserMapper.class);
			result = mapper.chkSub(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	public int updateSubEndSet(String userId) {
		int result = 0;
		UserMapper mapper = null;

		try {
			mapper = session.getMapper(UserMapper.class);
			result = mapper.updateSubEndSet(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
