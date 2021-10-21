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
	@SuppressWarnings("unchecked")
	public Map<String,Object> findFail(Map<String,Object>map) throws Exception{
		return (Map<String,Object>)selectOne("member.findPw_fail",map);
	}
	@SuppressWarnings("unchecked")
	public Map<String,Object> findFail0(Map<String,Object>map) throws Exception{
		return (Map<String,Object>)selectOne("member.findId_fail",map);
	}
	
	
}
