package b21.spring.adminQna;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import b21.spring.adminQna.AdminQnaDAO;

@Service("AdminQnaService")
public class AdminQnaServiceImpl implements AdminQnaService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AdminQnaDAO")
	private AdminQnaDAO AdminQnaDAO;
	
	//QNA 목록보기
	@Override
	public List<Map<String, Object>> adminQnaList(Map<String, Object> map) throws Exception {
		return AdminQnaDAO.AdminQnaList(map);
		
	}

	//QNA 상세보기
	@Override
	public Map<String, Object> adminQnaDetail(Map<String, Object> map) throws Exception {
		return AdminQnaDAO.AdminQnaDetail(map);
	}

	// 관리자 페이지 QNA 답변달기
	@Override
	public void insertQnaReply(Map<String, Object> map) throws Exception {
		AdminQnaDAO.insertQnaReply(map);
	}
	
	
}
