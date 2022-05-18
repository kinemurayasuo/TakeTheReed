package com.ebook.book.guard;

import java.util.ArrayList;


public interface Dao 
{

	public UserDetailsDto selectUser(String username);

	public ArrayList<String> getAuthList(String username);

}
