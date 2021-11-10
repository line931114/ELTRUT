package b21.spring.join;

import java.util.Map;

import org.springframework.stereotype.Repository;

import b21.spring.eltrut.AbstractDAO;


@Repository("joinDAO")
public class JoinDAO extends AbstractDAO{

	
	public void insertMember(Map<String, Object> map) throws Exception{
		insert("member.insertMember",map);
	}
	
	public int checkId(String mem_id) throws Exception {
		return (Integer) selectOne("member.checkId", mem_id);
	}
	
	
	
}
