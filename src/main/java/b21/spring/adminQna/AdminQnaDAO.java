package b21.spring.adminQna;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import b21.spring.eltrut.AbstractDAO;

@Repository("AdminQnaDAO")
public class AdminQnaDAO extends AbstractDAO{

	//QNA 목록가져오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> AdminQnaList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("admin.qnaList", map);
	}

	//QNA 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> AdminQnaDetail(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("admin.selectQnaDetail", map);
	}

	// 관리자 페이지 답변달기
	public void insertQnaReply(Map<String, Object> map) throws Exception {
		update("admin.insertQnaReply", map);
		}
		
}
