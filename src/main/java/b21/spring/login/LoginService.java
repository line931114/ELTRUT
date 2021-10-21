package b21.spring.login;

import java.util.Map;

public interface LoginService {

	Map<String,Object>login(Map<String,Object>map)throws Exception;
	
	Map<String,Object> findId(Map<String,Object>map)throws Exception;
	
	Map<String,Object> findPw(Map<String,Object>map)throws Exception;
	
	
	//비밀번호찾기 실패
	Map<String,Object> findFail(Map<String,Object>map)throws Exception;
	
	
	//아이디찾기실패
	Map<String,Object> findFail0(Map<String,Object>map)throws Exception;
}
