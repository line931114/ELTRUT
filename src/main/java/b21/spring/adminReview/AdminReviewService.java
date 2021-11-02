package b21.spring.adminReview;


import java.util.List;
import java.util.Map;


public interface AdminReviewService {

	//리뷰 목록
	List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception;

	//ID로 리뷰검색
	List<Map<String, Object>> reviewSearchMemberList(Map<String, Object> map) throws Exception;

	//제목으로 리뷰검색
	List<Map<String, Object>> reviewSearchTitleList(Map<String, Object> map) throws Exception;

	//리뷰스코어 별 검색
	List<Map<String, Object>> reviewScoreList(Map<String, Object> map) throws Exception;

	//리뷰 본문
	Map<String, Object> reviewDetail(Map<String, Object> map) throws Exception;

	//리뷰 답변상태
	List<Map<String, Object>> reviewRepState(Map<String, Object> map) throws Exception;

	//답변달기
	public void updateReviewReplyStep(Map<String, Object> map) throws Exception;

	//관리자 리뷰삭제
	public void adminReviewDelete(Map<String, Object> map) throws Exception;

	//리뷰답변 삭제
	public void reviewReplyDelete(Map<String, Object> map) throws Exception;



}
