package com.ebook.book.vo;

import lombok.Data;

@Data
public class ReadVO {
	
	private int bookNum;
	private String userId;
	private String bookName;
	private String bookWriter;
	private String savedFilename1;
	private int bookCk;
	private int bookStar;
	private String bookIndate;
}
