package com.ebook.book.vo;

import lombok.Data;

@Data
public class LikeVO {

	private String userId;  // ID
	private int likeChk; 	// 찜 여부
	private int bookNum; 	// 책 번호
	private String bookName; // 책 이름
	private String savedFilename1; // 책 표지
	private int bookCk; // 책 조회수
	private int bookStar; // 책 평점
	private int bookStarAvg; // 책 평점
}
