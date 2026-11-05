package com.gaon.cinema.store;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDAO {
	@Autowired
	private SqlSessionTemplate sql;
	private static Logger logger = LoggerFactory.getLogger(StoreDAO.class);

	public List<StoreDTO> dbStoreSelectAll(){
		List<StoreDTO> list = sql.selectList("store.select");
		return list;
	}
	public StoreDTO dbStoreDetail(int storeId){
		StoreDTO dto = sql.selectOne("store.detail",storeId);
		return dto;
	}
}
