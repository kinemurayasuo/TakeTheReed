package com.ebook.book.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebook.book.DAO.CheckoutDAO;

@Service
public class CheckoutService {
	
	@Autowired
	private CheckoutDAO dao;
	
	//구독 만료일 갱신
	public String sub(HashMap<String, Object> map) {
		int result = dao.sub(map);
		String path;
		
		if (result == 0) {
			path = "redirect:/checkout/checkout";
		} else {
			path = "redirect:/";
		}
		
		return path;
	}
	
	public boolean chkSub(String userId) {
		String result = dao.chkSub(userId);
		boolean a;
		
		// 리절트가 유저아이디 일때 = 구독 중
		if (userId.equals(result)) {
			a = true;
		}
		// else 구독 중이 아님
		else {
			a = false;
		}
		return a;
	}

	public boolean updateSubEndSet(String userId) {
		
		return dao.updateSubEndSet(userId) > 0;
		
	}
	
	public String jpSub(HashMap<String, Object> map) {
		int result = dao.sub(map);
		String path;
		
		if (result == 0) {
			path = "redirect:/jp/checkout/checkout";
		} else {
			path = "redirect:/jp";
		}
		
		return path;
	}
}
