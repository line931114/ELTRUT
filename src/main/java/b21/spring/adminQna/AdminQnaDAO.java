package b21.spring.adminQna;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import b21.spring.eltrut.AbstractDAO;

@Repository("adminQnaDAO")
public class AdminQnaDAO extends AbstractDAO {

	// Q&A 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("admin.qnaList", map);
	}
	
	// Q&A 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> qnaDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("admin.selectQnaDetail", map);
	}
	
	// 관리자 페이지 답변달기
	public void updateReplyStep(Map<String, Object> map) throws Exception {
		update("admin.insertQnaReply", map);
	}
	
	// 관리자 Q&A 강제 삭제
	public void adminQnaDelete(Map<String, Object> map) throws Exception {
		delete("admin.qnaDelete", map);
	}
	
	// 답변 삭제
	public void qnaReplyDelete(Map<String, Object> map) throws Exception {
		delete("admin.qnaReplyDelete", map);
	}
	
	// 제목 & 카테고리 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaTitleList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("admin.qnaTitleList", map);
	}
		
	// 아이디 & 카테고리 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaCategoryList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("admin.qnaCategoryList", map);
	}
		
	// 아이디 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaSearchMemberList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("admin.qnaSearchMemberList", map);
	}
		
	// 제목 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaSearchTitleList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("admin.qnaSearchTitleList", map);
	}
		
	// 답변 상태 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaRepState(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("admin.qnaRepState", map);
	}
}