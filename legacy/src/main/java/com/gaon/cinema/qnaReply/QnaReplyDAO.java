package com.gaon.cinema.qnaReply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gaon.cinema.qna.QnaDTO;

@Repository
public class QnaReplyDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	/* 댓글 목록 가져오기 */
	public List<QnaReplyDTO> dbSelectQnaReply(int qna_id) {
		List<QnaReplyDTO> list = temp.selectList("qnaReply.selectQnaReply", qna_id);
		return list;
	}
	
	/* 댓글 등록 */
	public void dbAddQnaReply(QnaReplyDTO dto) {
		temp.insert("qnaReply.addQnaReply", dto);
	}//dbAddQnaReply end
	
	/* 댓글 수정 */
	public void dbEditQnaReply(QnaReplyDTO dto){
		temp.update("qnaReply.editQnaReply", dto);
	}//dbEditQnaReply end

	
	/* 댓글 삭제 */
	public void dbDeleteQnaReply(QnaReplyDTO dto) {
		temp.delete("qnaReply.deleteQnaReply", dto);
	}//dbreplydelete end
	
}//class QnaReplyDAO end
