package com.ebook.book.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import com.ebook.book.vo.ReadVO;
import com.ebook.book.vo.UserVO;

public interface UserMapper {

	int join(UserVO user);  // 회원가입

	String idChk(String idChk); // ID 유효성 검사
	
	String nmChk(String nmChk); // 닉네임 유효성 검사
	
	String selectUserNm(UserVO user);  // 로그인 시도 
	
	ArrayList<UserVO> getUserList(String userId); // 마이 리스트 페이지 이동(조회) 

	int userUpdate(UserVO updateUser); // 정보수정

	int updatePw(UserVO updateUser); // 새로운 비밀번호 수정
	
	
	//ArrayList<SocialVO> getSocialList(String socialNm); // 소셜로그인 마이 리스트 페이지
	
	ArrayList<ReadVO> getPastBook(String userId); // 과거 내가 본 책리스트 조회

	String userSelect(UserVO user); // 소셜로그인 기존정보 존재하는지 확인

	int userNaverLogin(UserVO user); // 소셜로그인 새로운 data입력

	ArrayList<UserVO> getUserList1(String userNm); // 마이리스트 페이지 이동(소셜로그인)

	int updateNaverLogin(UserVO updateUser); // social로그인 default값 1로 변경시도

	ArrayList<UserVO> findId(String userName);
	
	int updateSubEndAdd(HashMap<String, Object> map); // 구독 만료 날짜 갱신
	
	String chkSub(String userId); // 구독 여부 체크
	
	int updateSubEndSet(String userId); // 구독 만료 날짜 오늘로 변경
	
	UserVO pwFindChk(UserVO pwFindChk); // 비밀번호찾기 인증

	int deleteUser(String userId);

	UserVO subChk(String userId);

	int updatesubChk(String userId);
}
