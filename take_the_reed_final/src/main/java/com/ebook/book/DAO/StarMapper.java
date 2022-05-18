package com.ebook.book.DAO;

import com.ebook.book.vo.StarVO;

public interface StarMapper 
{
	public double getStarAverage(int bookNum);
	
	public int updateStar(StarVO star);
}
