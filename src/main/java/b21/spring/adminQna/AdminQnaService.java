package b21.spring.adminQna;


import java.util.List;
import java.util.Map;

public interface AdminQnaService {

	// QNA 목록
	public List<Map<String, Object>> adminQnaList(Map<String, Object> map) throws Exception;

	// QNA 상세보기
	public Map<String, Object> adminQnaDetail(Map<String, Object> map) throws Exception;

	// QNA 답변달기
	public void insertQnaReply(Map<String, Object> map) throws Exception;
	

}
