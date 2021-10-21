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
}
