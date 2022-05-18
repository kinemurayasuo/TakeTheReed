package com.ebook.book.vo;

import lombok.Data;

@Data
public class ReplyVO 
{
	private int replyNum;
	private String replyContent;
	private String replyDate;
	private int askNum;
	private String userId;
	private String userNm;
}
