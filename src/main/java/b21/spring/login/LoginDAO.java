package b21.spring.login;

import java.util.Map;

import org.springframework.stereotype.Repository;

import b21.spring.eltrut.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String,Object> selectId(Map<String,Object>map) throws Exception{
		return (Map<String,Object>)selectOne("member.login",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> findId(Map<String,Object>map) throws Exception{
		return (Map<String,Object>)selectOne("member.findId",map);
	}
	@SuppressWarnings("unchecked")
	public Map<String,Object> findPw(Map<String,Object>map) throws Exception{
		return (Map<String,Object>)selectOne("member.findPw",map);
	}
	
	
}
