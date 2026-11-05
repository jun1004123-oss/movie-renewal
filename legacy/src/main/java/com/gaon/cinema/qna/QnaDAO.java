package com.gaon.cinema.qna;

import com.gaon.cinema.qna.QnaDTO;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAO {
	
	@Autowired
	private SqlSessionTemplate temp;
	
	/* 검색된 게시글 리스트 출력 */
	public List<QnaDTO> dbSelect(QnaDTO dto){
		List<QnaDTO> list=temp.selectList("qna.selectAll", dto);
		return list;
	}//dbSelect end
	
	/* 선택한 게시글 출력  */
	public QnaDTO dbDetail(int qna_id) {
		QnaDTO detail = temp.selectOne("qna.detail", qna_id);
		return detail;
	}//dbDetail end
	
	/* 모든 페이지 카운터 */
	public int dbCountAll() {
		int cnt = temp.selectOne("countAll");
		return cnt;
	}//dbcountAll
	
	/* 검색 페이지 카운터 */
	public int dbCountSearch(QnaDTO dto) {
		int cnt = temp.selectOne("qna.countSearch", dto);
		return cnt;
	}
	
	/* 데이타 입력 */
	public void dbInsert(QnaDTO dto) {
		temp.insert("qna.insert", dto);
	}
	
	/* 선택한 데이터 수정 */
	public void dbEdit(QnaDTO dto){
		temp.update("qna.edit", dto);
	}//dbEdit end
	
	/* 선택한 게시글을 누를 경우 조회수 1 증가 */
	public void dbAddCount(int qna_id) {
		temp.update("qna.addCount", qna_id);
	}
	
	/* 선택한 데이터 삭제 */
	public void dbDelete(QnaDTO dto){
	  temp.delete("qna.delete", dto);
	}//dbDelete end
}//QnaDAO class END
	



