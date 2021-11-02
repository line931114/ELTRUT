package b21.spring.adminReview;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import b21.spring.eltrut.AbstractDAO;


@Repository("adminReviewDAO")
public class AdminReviewDAO extends AbstractDAO {

	//리뷰 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("admin.reviewList", map);
	}

	//리뷰 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> reviewDetail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("admin.selectReviewDetail", map);
	}

	//리뷰 id로 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewSearchMemberList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("admin.reviewSearchMemberList", map);
	}

	//리뷰 제목으로 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewSearchTitleList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("admin.reviewSearchTitleList", map);
	}

	//리뷰 별점으로 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewScoreList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("admin.reviewScoreList", map);
	}

	//리뷰 답변상태
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reviewRepState(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("admin.reviewRepState", map);
	}

	
	//리뷰 답변 등록
	@SuppressWarnings("unchecked")
	public void updateReviewReplyStep(Map<String, Object> map) {
		update("admin.updateReviewReplyStep", map);
	}

	//관리자 리뷰 삭제
	@SuppressWarnings("unchecked")
	public void adminReviewDelete(Map<String, Object> map) {
		delete("admin.adminReviewDelete", map);
	}

	//관리자 리뷰 답변삭제
	@SuppressWarnings("unchecked")
	public void reviewReplyDelete(Map<String, Object> map) {
		delete("admin.reviewReplyDelete", map);
		
	}


}
