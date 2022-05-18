package com.ebook.book.guard;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


@Service("loginService")
public class loginService implements UserDetailsService
{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		ArrayList<String> authList = new ArrayList<String>();
		Dao dao = sqlSession.getMapper(Dao.class);
		
		UserDetailsDto userDetailsDto = dao.selectUser(username);
		authList = dao.getAuthList(username);
		
		if (userDetailsDto == null) { //User을 찾지 못했을 경우
			throw new UsernameNotFoundException(username);
		}
		else {
			userDetailsDto.setAuthority(authList);
		}
		
		return userDetailsDto; //완전한 UserDetails 객체
	}
}
