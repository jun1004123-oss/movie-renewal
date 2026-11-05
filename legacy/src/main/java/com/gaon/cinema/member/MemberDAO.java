package com.gaon.cinema.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaon.cinema.join.JoinDAO;
import com.gaon.cinema.join.JoinDTO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate temp;
	private static Logger logger = LoggerFactory.getLogger(MemberDAO.class);
	
	public int potinSub(String id,int point){
		MemberDTO dto = new MemberDTO();
		int ok=0;
		dto.setUserid(id);
		dto.setPoint(point);
		ok = temp.update("member.potinSub",dto);
		return ok;
	}
	
	public MemberDTO dbmember(MemberDTO dto){
		dto = temp.selectOne("member.member",dto);
		return dto;
	}
	
	public void dbEdit(MemberDTO dto){
		temp.update("member.edit",dto);
	};

	public int dbDelete(MemberDTO dto) {
		int ok = temp.delete("member.delete", dto);
		return ok;
	}

	public int idSerch(MemberDTO dto) {
		int count = temp.selectOne("member.searchidCount", dto);
		return count;
	}

	public int pwSerch(String id, String name, String email) {
		int count=4;
		try {
		MemberDTO dto = temp.selectOne("member.searchpwCount", id);
		if(dto == null){
			count = 0;
		}else if(!dto.getName().equals(name)){
			count = 1; //1= 이름틀렸을때
		} else if(!dto.getEmail().equals(email)){
			count = 2; //2= 이메일틀렸을때
		}else if(dto.getUserid().equals(id) && dto.getName().equals(name) && dto.getEmail().equals(email)){
			count = 3; //모두 맞을때
		}
		
		}catch(Exception ex){}
		return count;
	}

	public MemberDTO idSelect(MemberDTO dto) {
		dto = temp.selectOne("member.idSelect", dto);
		return dto;
	}
	public MemberDTO pwSelect(MemberDTO dto) {
		dto = temp.selectOne("member.pwSelect", dto);
		return dto;
	}
}
