package com.ebook.book.vo;
import lombok.Data;

@Data
public class BookVO {

	private int bookNum; 		// 책번호      // 회원ID
	private String bookName;    // 책이름
	private String bookWriter;	// 책 저자
	private String bookCon;		// 책내용
	private int bookCk;			// 조회 수
	private String bookCate;	// 카테고리
	private int bookEnd;		// 완독 수
	private int bookImg;		// 책 이미지 
	private double bookStarAvg;	// 책 별점 평균
	private Integer bookStar;		// 책 별점
	private int bookStarCk;		// 별점 체크
	private String userId;		// 유저 아이디

	
	private String originalFilename1; // 책 표지
	private String savedFilename1; // 저장한 책표지 파일 이름
	private String originalFilename2; // 책 내용
	private String savedFilename2; // 저장한 책 내용 파일 이름
}
