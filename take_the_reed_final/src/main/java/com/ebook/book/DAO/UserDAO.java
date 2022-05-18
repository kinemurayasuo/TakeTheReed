package com.ebook.book.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ebook.book.vo.ReadVO;
import com.ebook.book.vo.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSession session;

	// 회원가입
	public int join(UserVO user) {
		int cnt=0;
		UserMapper mapper = null;
		try {
			mapper =session.getMapper(UserMapper.class);
			cnt = mapper.join(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	// ID 유효성 검사 
	public String idChk(String idChk) {
		String result = null; 
		UserMapper mapper = null; 
		try {
			mapper = session.getMapper(UserMapper.class);
			result = mapper.idChk(idChk);  
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 닉네임 유효성 검사 
	public String nmChk(String nmChk) {
		String result = null; 
		UserMapper mapper = null; 
		try {
			mapper = session.getMapper(UserMapper.class);
			result = mapper.nmChk(nmChk);  
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 로그인 시도 
	public String selectUserNm(UserVO user) {
		String result = null;
		UserMapper mapper = null;
		try {
			mapper =session.getMapper(UserMapper.class);
			result =mapper.selectUserNm(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 마이페이지 리스트 페이지 이동(조회) 
	public ArrayList<UserVO> getUserList(String userId) {
		ArrayList<UserVO> result = null;
		UserMapper mapper = null;
		
		try {
			mapper = session.getMapper(UserMapper.class);
			result = mapper.getUserList(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 정보수정
	public int userUpdate(UserVO updateUser) {
		int result = 0;
		UserMapper mapper = null;
		
		try
		{
			mapper = session.getMapper(UserMapper.class);
			result = mapper.userUpdate(updateUser);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}

	// 새로운 비밀번호 수정
	public int updatePw(UserVO updateUser) {
		int result = 0;
		UserMapper mapper = null;
		
		try
		{
			mapper = session.getMapper(UserMapper.class);
			result = mapper.updatePw(updateUser);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}

	// 과거 내가 본 책리스트 조회
	public ArrayList<ReadVO> getPastBook(String userId) {
		ArrayList<ReadVO> result = null;
		UserMapper mapper = null;
		
		try {
			mapper = session.getMapper(UserMapper.class);
			result = mapper.getPastBook(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 소셜 로그인 기존의정보 있는지 확인
	public String userSelect(UserVO user) {
		String result = null;
		UserMapper mapper = null;
		
		try {
			mapper = session.getMapper(UserMapper.class); 
			result = mapper.userSelect(user);  
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 소셜로그인
	public int userNaverLogin(UserVO user) {
		int result = 0;
		UserMapper mapper = null;
		
		try
		{
			mapper = session.getMapper(UserMapper.class);
			result = mapper.userNaverLogin(user);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 마이리스트 페이지 이동(소셜로그인)
	public ArrayList<UserVO> getUserList1(String userNm) {
		ArrayList<UserVO> result = null;
		UserMapper mapper = null;
		
		try {
			mapper = session.getMapper(UserMapper.class);
			result = mapper.getUserList1(userNm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// social로그인 default값 1로 변경시도
	public int updateNaverLogin(UserVO updateUser) {
		int result = 0;
		UserMapper mapper = null;
		
		try
		{
			mapper = session.getMapper(UserMapper.class);
			result = mapper.updateNaverLogin(updateUser);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}

	public ArrayList<UserVO> findId(String userName) 
	{
		ArrayList<UserVO> result = null;
		UserMapper mapper = null;
		
		try
		{
			mapper = session.getMapper(UserMapper.class);
			result = mapper.findId(userName);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	public UserVO pwFindChk(UserVO pwFindChk) {
		UserVO result = null;
		UserMapper mapper = null;
		try {
			mapper = session.getMapper(UserMapper.class);
			result = mapper.pwFindChk(pwFindChk);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int deleteUser(String userId) {
		int result = 0;
		UserMapper mapper = null;
		
		try {
			mapper = session.getMapper(UserMapper.class);
			result = mapper.deleteUser(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public UserVO subChk(String userId) {
		UserVO result = null;
		UserMapper mapper = null;
		try {
			mapper = session.getMapper(UserMapper.class);
			result = mapper.subChk(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int updatesubChk(String userId) {
		int result = 0;
		UserMapper mapper = null;
		
		try {
			mapper = session.getMapper(UserMapper.class);
			result = mapper.updatesubChk(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
