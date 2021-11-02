package b21.spring.adminReview;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import b21.spring.adminReview.AdminReviewDAO;
import b21.spring.eltrut.GoodsImageUtils;

@Service("adminReviewService")
public class AdminReviewServiceImpl implements AdminReviewService{
	

		@Resource(name = "adminReviewDAO")
		private AdminReviewDAO adminReviewDAO;
		
		@Resource(name = "goodsImageUtils")
		private GoodsImageUtils goodsImageUtils;

		//리뷰 목록보기
		@Override
		public List<Map<String, Object>> reviewList(Map<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			return adminReviewDAO.reviewList(map);
		}

		//id로 리뷰 검색
		@Override
		public List<Map<String, Object>> reviewSearchMemberList(Map<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			return adminReviewDAO.reviewSearchMemberList(map);
		}
		
		//제목으로 리뷰검색
		@Override
		public List<Map<String, Object>> reviewSearchTitleList(Map<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			return adminReviewDAO.reviewSearchTitleList(map);
		}

		//스코어로 리뷰검색
		@Override
		public List<Map<String, Object>> reviewScoreList(Map<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			return adminReviewDAO.reviewScoreList(map);
		}

		//리뷰본문보기
		@Override
		public Map<String, Object> reviewDetail(Map<String, Object> map) throws Exception {
			// TODO Auto-generated method stub
			return adminReviewDAO.reviewDetail(map);
		}

		//리뷰 답변상태
		@Override
		public List<Map<String, Object>> reviewRepState(Map<String, Object> map) throws Exception {
			return adminReviewDAO.reviewRepState(map);
		}

		//리뷰 답변달기
		@Override
		public void updateReviewReplyStep(Map<String, Object> map) throws Exception {
			adminReviewDAO.updateReviewReplyStep(map);
			
		}

		//관리자 리뷰 삭제
		@Override
		public void adminReviewDelete(Map<String, Object> map) throws Exception {
			Map<String, Object> image = new HashMap<String, Object>();
			image = adminReviewDAO.reviewDetail(map);
			goodsImageUtils.reviewImageDelete(image);
			adminReviewDAO.adminReviewDelete(map);
			
		}

		//관리자 리뷰답변 삭제
		@Override
		public void reviewReplyDelete(Map<String, Object> map) throws Exception {
			adminReviewDAO.reviewReplyDelete(map);
			
		}

		
		
		
	}