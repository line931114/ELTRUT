package b21.spring.review;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import b21.spring.review.ReviewDAO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{

	
	@Resource(name="reviewDAO")
	private ReviewDAO reviewDAO;
	
	@Override
	public List<Map<String, Object>> goodsReview(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.goodsReview(map);
	}


	@Override
	public void reviewModify(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		reviewDAO.reviewModify(map);
	}


	@Override
	public Map<String, Object> reviewSelect(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.reviewSelect(map);
	}


	@Override
	public void reviewDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		reviewDAO.reviewDelete(map);
	}


	@Override
	public Map<String, Object> reviewInsertCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.reviewInsertCheck(map);
	}
	@Override
	public Map<String, Object> reviewNumber(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.reviewNumber(map);
	}


	@Override
	public void reviewInsert(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		reviewDAO.reviewInsert(map);
	}


	@Override
	public List<Map<String, Object>> goodsQna(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.goodsQna(map);
	}


	@Override
	public void goodsQnaDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		reviewDAO.goodsQnaDelete(map);
	}


	@Override
	public void goodsQnaModify(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		reviewDAO.goodsQnaModify(map);
	}


	@Override
	public Map<String, Object> qnaSelect(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.qnaSelect(map);
	}


	@Override
	public void goodsQnaInsert(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		reviewDAO.goodsQnaInsert(map);
	}


	@Override
	public Map<String, Object> qnaNumber(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.qnaNumber(map);
	}
	
}
