package com.gaon.cinema.code;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

import java.util.Date;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaon.cinema.join.JoinDTO;
import com.gaon.mail.Email;

@Repository
public class CodeDAO {
	@Autowired
	private SqlSessionTemplate sql;
	
	private static Logger logger = LoggerFactory.getLogger(CodeDAO.class);
	
	public String selectStartDate(String code){
		String start = sql.selectOne("code.selectStartDate",code);
		return start;
	}
	public String selectEndDate(String code){
		String end = sql.selectOne("code.selectEndDate",code);
		return end;
	}


	public int create(CodeDTO codeDto) {
		// TODO Auto-generated method stub
		int ok =0;
		ok = sql.insert("code.insert",codeDto);
		System.out.println("코드인서트 " + ok);
		return ok;
	}
}
