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

	//마이페이지-구매내역보기-상품 교환,환불,취소
	public void orderCancel(Map<String,Object>map)throws Exception;

	Map<String,Object> orderExchange(Map<String,Object>map)throws Exception;

	
	//마이페이지-구매내역보기-환불,교환할 때 cancle테이블 insert 취소문의?
	public void cancel(Map<String,Object>map)throws Exception;
	
	
	//마이페이지- 내 문의사항
	List<Map<String,Object>> enquiryCheck(Map<String,Object>map)throws Exception;

	//마이페이지-내문의사항-반품교환문의 삭제하기
	public void enquiryDelete(Map<String,Object>map)throws Exception;
	
	//마이페이지-내문의사항-수정
	public void enquiryModify(Map<String,Object>map)throws Exception;
		
	//마이페이지-내문의사항 확인하기 cancel_number
	Map<String,Object> enquiryModifyForm(Map<String,Object>map)throws Exception;

	
	List<Map<String,Object>> qnaCheck(Map<String,Object>map)throws Exception;

	//마이페이지-내문의사항-QNA 삭제하기
	public void qnaDelete(Map<String,Object>map)throws Exception;
		
	
	//마이페이지-내문의사항-QNA 수정
	public void qnaModify(Map<String,Object>map)throws Exception;
	
	
	Map<String,Object> qnaModifyForm(Map<String,Object>map)throws Exception;

	
}
