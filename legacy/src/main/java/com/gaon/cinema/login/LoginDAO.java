package com.gaon.cinema.login;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {
	@Autowired
	private SqlSessionTemplate sst;
	private static final Logger logger = LoggerFactory.getLogger(LoginDAO.class);
	
	public LoginDTO Select(String id, String pw){
		LoginDTO dto = new LoginDTO();
		dto.setUSERID(id);
		dto.setUSERPW(pw);
		dto = sst.selectOne("login.select",dto);
		return dto;
	}//end
	public LoginDTO Select(String id){
		LoginDTO dto = new LoginDTO();
		dto.setUSERID(id);
		dto = sst.selectOne("login.select2",dto);
		return dto;
	}//end


	public int loginSerch(String id, String pw) {
		int count = 0;
		try {
			LoginDTO IDPW = sst.selectOne("login.count", id);
			if(IDPW.getUSERID().equals(id) && !IDPW.getUSERPW().equals(pw)){
				count = 1;
			}else if(IDPW.getUSERID().equals(id) && IDPW.getUSERPW().equals(pw)){
				count = 2;
			}
		} catch (Exception e) {	}
		return count;
	}
	
}//BoardDAO class END




