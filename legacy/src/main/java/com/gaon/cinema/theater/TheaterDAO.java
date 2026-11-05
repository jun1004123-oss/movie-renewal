package com.gaon.cinema.theater;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TheaterDAO {
	
	@Autowired
	private SqlSessionTemplate temp;
	
	/* 도시 목록 가져오기 */
	public List<TheaterDTO> dbSelectCname() {
		List<TheaterDTO> list = temp.selectList("theater.selectCname");
		return list;
	}
	
	/* 지역 목록 가져오기 */
	public List<TheaterDTO> dbSelectLname(String cname) {
		List<TheaterDTO> list = temp.selectList("theater.selectLname", cname);
		return list;
	}
	
	/* 전체 영화관 소개 가져오기 */
	public List<TheaterDTO> dbSelectIntroAll() {
		List<TheaterDTO> list = temp.selectList("theater.selectIntroAll");
		return list;
	}
	
	/* 도시로 영화관 소개 가져오기 */
	public List<TheaterDTO> dbSelectIntroByCname(String cname) {
		List<TheaterDTO> list = temp.selectList("theater.selectIntroByCname", cname);
		return list;
	}
	
	/* 지역으로 영화관 소개 가져오기 */
	public List<TheaterDTO> dbSelectIntroByLname(String lname) {
		List<TheaterDTO> list = temp.selectList("theater.selectIntroByLname", lname);
		return list;
	}
}
