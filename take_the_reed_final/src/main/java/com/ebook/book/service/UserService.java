package com.ebook.book.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebook.book.DAO.UserDAO;
import com.ebook.book.vo.ReadVO;
import com.ebook.book.vo.UserVO;


@Service
public class UserService {

	@Autowired
	private UserDAO dao;

	// 회원가입
	public boolean join(String userId, String userName, String userPw, String userNm, String userTel, String userEmail) {
		UserVO user = new UserVO();
		user.setUserId(userId);
		user.setUserName(userName);
		user.setUserPw(userPw);
		user.setUserNm(userNm);
		user.setUserTel(userTel);
		user.setUserEmail(userEmail);
		
		int cnt = dao.join(user);
		if(cnt > 0) return true;
		else	return false;
	}

	// ID 유효성 검사 
	public String idChk(String idChk) {
		return dao.idChk(idChk);
	}
	
	// 닉네 유효성 검사 
	public String nmChk(String nmChk) {
		return dao.nmChk(nmChk);
	}
	
	// 로그인 시도 
	public String selectUserNm(String userId, String userPw) {
		UserVO user = new UserVO();
		user.setUserId(userId);
		user.setUserPw(userPw);
		
		return dao.selectUserNm(user);
	}
	
	// 마이 리스트 페이지 이동(조회) 
	public ArrayList<UserVO> getUserList(String userId) {
		return dao.getUserList(userId);
	}

	// 정보수정
	public boolean userUpdate(String userId, String userPw, String userNm, String userTel, String userEmail) {
		UserVO updateUser = new UserVO();
		updateUser.setUserId(userId);
		updateUser.setUserPw(userPw);
		updateUser.setUserNm(userNm);
		updateUser.setUserTel(userTel);
		updateUser.setUserEmail(userEmail);
		
		return dao.userUpdate(updateUser) > 0;
	}

	// 새로운 비밀번호 수정
	public boolean updatePw(String userId, String userPw) {
		UserVO updateUser = new UserVO();
		updateUser.setUserId(userId);
		updateUser.setUserPw(userPw);
		
		return dao.updatePw(updateUser) > 0;
	}
    
	// 과거 내가 본 책리스트 조회
	public ArrayList<ReadVO> getPastBook(String userId) {
		return dao.getPastBook(userId);
	}
   
	// 소셜로그인 시 기존의 아이디 이름 닉네임 전화번호 있는지 확인 
	public String userSelect(UserVO user) {
		return dao.userSelect(user);
	}

	// 소셜로그인 아이디 이름 닉네임 전화번호 저장
	public boolean userNaverLogin(UserVO user) {
		return dao.userNaverLogin(user) > 0;
	}

	// 마이리스트 페이지 이동(소셜로그인)
	public ArrayList<UserVO> getUserList1(String userNm) {
		return dao.getUserList1(userNm);
	}

	// social로그인 default값 1로 변경시도
	public boolean updateNaverLogin(String userId) {
		UserVO updateUser = new UserVO();
		updateUser.setUserId(userId);
		
		return dao.updateNaverLogin(updateUser) > 0;
	}

	public ArrayList<UserVO> findId(String userName) 
	{
		return dao.findId(userName);
	}
	
	// 비밀번호 찾기 인증
		public UserVO pwFindChk(String userId, String userEmail) {
			UserVO pwFindChk = new UserVO();
			pwFindChk.setUserId(userId);
			pwFindChk.setUserEmail(userEmail);
			
			return dao.pwFindChk(pwFindChk);
		}
		
		public boolean deleteUser(String userId) {

			return dao.deleteUser(userId) > 0;
		}
		
		public UserVO subChk(String userId) {
			UserVO user = new UserVO();
			user.setUserId(userId);
			return dao.subChk(userId) ;
		}

		public boolean updatesubChk(String userId) {
			UserVO user = new UserVO();
			user.setUserId(userId);
			return dao.updatesubChk(userId) > 0;
		}
}
