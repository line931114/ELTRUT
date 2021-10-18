package b21.spring.login;

import java.util.Map;

public interface LoginService {

	Map<String,Object>login(Map<String,Object>map)throws Exception;
	
	Map<String,Object> findId(Map<String,Object>map)throws Exception;
	
	Map<String,Object> findPw(Map<String,Object>map)throws Exception;
}
