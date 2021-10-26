package b21.spring.myPage;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import b21.spring.eltrut.AbstractDAO;

@Repository("myPageDAO")
public class MyPageDAO extends AbstractDAO{

	
	@SuppressWarnings("unchecked")
	public Map<String,Object> memberInfo(Map<String,Object> map) throws Exception{
		return (Map<String,Object>)selectOne("myPage.info",map);
	}
	@SuppressWarnings("unchecked")
	public Map<String,Object> memberUpdate(Map<String,Object> map) throws Exception{
		return (Map<String,Object>)selectOne("myPage.memberUpdate",map);
	}
	@SuppressWarnings("unchecked")
	public Map<String,Object> memberDelete(Map<String,Object> map) throws Exception{
		return (Map<String,Object>)selectOne("myPage.memberDelete",map);
	}
	
	//여기서부터 구매내역
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> orderInfo(Map<String,Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("myPage.orderInfo",map);
	}
	@SuppressWarnings("unchecked")
	public Map<String,Object> orderExchange(Map<String,Object> map) throws Exception{
		return (Map<String,Object>)selectOne("myPage.orderExchange",map);
	}
	
	public void orderCancle(Map<String,Object> map) throws Exception{
		delete("myPage.orderCancle",map);
	}
	public void cancel(Map<String,Object> map) throws Exception{
		insert("myPage.cancel",map);
	}
	
	//마이페이지->내문의사항->반품,교환
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> enquiryCheck(Map<String,Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("myPage.enquiryCheck",map);
	}
	

	public void enquiryDelete(Map<String,Object> map) throws Exception{
		delete("myPage.enquiryDelete",map);
	}
	
	
	public void enquiryModify(Map<String,Object> map) throws Exception{
		update("myPage.enquiryModify",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> enquiryModifyForm(Map<String,Object> map) throws Exception{
		return (Map<String,Object>)selectOne("myPage.enquiryModifyForm",map);
	}
	
	
	
	//마이페이지->내문의사항->QNA
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> qnaCheck(Map<String,Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("myPage.qnaCheck",map);
	}

	public void qnaDelete(Map<String,Object> map) throws Exception{
		delete("myPage.qnaDelete",map);
	}
	
	public void qnaModify(Map<String,Object> map) throws Exception{
		update("myPage.qnaModify",map);
	}
	
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> qnaModifyForm(Map<String,Object> map) throws Exception{
		return (Map<String,Object>)selectOne("myPage.qnaModifyForm",map);
	}
	
	
}
