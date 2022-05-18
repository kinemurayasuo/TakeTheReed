package com.ebook.book.vo;

import lombok.Data;

@Data
public class AskVO 
{
	int askNum;
	String askTitle;
	String askCon;
	String userId;
	String askTime;
	String userNm;
	// 검색 필터
//	String type;			//검색 타입
//	String keyword;			//검색 내용
}
