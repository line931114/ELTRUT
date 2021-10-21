package b21.spring.myPage;

import java.util.List;
import java.util.Map;




public interface MyPageService {

	//회원정보조회
	Map<String,Object> memberInfo(Map<String,Object>map)throws Exception;
	
	//회원정보수정
	Map<String,Object> memberUpdate(Map<String,Object>map)throws Exception;
	
	//회원탈퇴
	Map<String,Object> memberDelete(Map<String,Object>map)throws Exception;
	
	
	//마이페이지-구매내역보기
	List<Map<String,Object>> orderInfo(Map<String,Object>map)throws Exception;



}
