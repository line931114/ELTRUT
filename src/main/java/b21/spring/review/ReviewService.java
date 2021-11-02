package b21.spring.review;

import java.util.List;
import java.util.Map;

public interface ReviewService {
	public List<Map<String, Object>> goodsReview(Map<String, Object> map) throws Exception;

	public void reviewModify(Map<String,Object>map)throws Exception;
	
	public Map<String, Object> reviewSelect(Map<String, Object> map) throws Exception;
	
	public void reviewDelete(Map<String,Object>map)throws Exception;
	
	
	public Map<String, Object> reviewInsertCheck(Map<String, Object> map) throws Exception;
	
	
	public Map<String, Object> reviewNumber(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> qnaNumber(Map<String, Object> map) throws Exception;
	
	
	public void reviewInsert(Map<String,Object>map)throws Exception;
	
	
	public List<Map<String, Object>> goodsQna(Map<String, Object> map) throws Exception;

	public void goodsQnaDelete(Map<String,Object>map)throws Exception;

	public void goodsQnaModify(Map<String,Object>map)throws Exception;
	
	public void goodsQnaInsert(Map<String,Object>map)throws Exception;
	
	public Map<String, Object> qnaSelect(Map<String, Object> map) throws Exception;
	
}
