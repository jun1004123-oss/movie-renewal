package com.gaon.cinema.join;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JoinDAO {
	@Autowired
	private SqlSessionTemplate temp;
	private static Logger logger = LoggerFactory.getLogger(JoinDAO.class);
	
	public int dbjoin(JoinDTO dto){
		int ok;
		ok=temp.insert("join.add",dto);
		
		return ok;
	}

	public int idSearch(String id) {
		int count;
		count = temp.selectOne("join.search",id);
		return count;
	}
}
