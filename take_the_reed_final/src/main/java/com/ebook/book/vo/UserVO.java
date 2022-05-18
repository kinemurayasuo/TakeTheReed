package com.ebook.book.vo;

import lombok.Data;

@Data
public class UserVO {

	private String userId;   // 회원ID  (3~10자리)
	private String userName; // 회원 이름
	private String userPw;	 // 비밀번호  (6~16자리)
	private String userNm;	 // 회원 닉네임
	private String userTel;  // 전화 번호
	private String userEmail;// 유저 이메일
	private int isSocialUser;// 소셜로그인여부(0:일반로그인, 1:소셜로그인)
	private String subEnd;
}