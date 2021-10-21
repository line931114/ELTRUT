package b21.spring.myPage;

import java.util.List;
import java.util.Map;




public interface MyPageService {

	//회원정보조회
	Map<String,Object> memberInfo(Map<String,Object>map)throws Exception;
	
	//회원정보수정
	Map<String,Object> memberUpdate(Map<String,Object>map)throws Exception;
}
