package b21.spring.join;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface JoinService {

	void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	int checkId(String mem_id) throws Exception;
		
}
