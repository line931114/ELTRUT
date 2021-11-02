package b21.spring.review;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import b21.spring.eltrut.AbstractDAO;
@Repository("reviewDAO")


public class ReviewDAO extends AbstractDAO{
	//상품후기
			@SuppressWarnings("unchecked")
			public List<Map<String, Object>> goodsReview(Map<String, Object> map) throws Exception{
				return (List<Map<String,Object>>)selectList("review.goodsReview",map);
			}
			
			//리뷰수정
			public void reviewModify(Map<String,Object> map) throws Exception{
				update("review.reviewModify",map);
			}
			
			//REVIEW_NUMBER,MEMBER_ID에 해당하는 리뷰 가져오기
			@SuppressWarnings("unchecked")
			public Map<String, Object> reviewSelect(Map<String, Object> map) throws Exception{
				return (Map<String,Object>)selectOne("review.reviewSelect",map);
			}
			
			//리뷰 삭제하기 MEMBER_ID,REVIEW_NUMBER 조회
			public void reviewDelete(Map<String,Object> map) throws Exception{
				delete("review.reviewDelete",map);
			}
			
			
			//상품후기를 쓸 수 있는 조건 ORDER_STATE=2,해당 MEMBER_ID 조회
			@SuppressWarnings("unchecked")
			public Map<String, Object> reviewInsertCheck(Map<String, Object> map) throws Exception{
				return (Map<String,Object>)selectOne("review.reviewInsertCheck",map);
			}
			
			
			//리뷰 등록
			public void reviewInsert(Map<String,Object> map) throws Exception{
				insert("review.reviewInsert",map);
			}
			
			
			//리뷰 REVIEW_NUMBER 시퀀스 가져오기,, 이미지넣을 때 값이 먼저필요
			@SuppressWarnings("unchecked")
			public Map<String, Object> reviewNumber(Map<String, Object> map) throws Exception{
				return (Map<String,Object>)selectOne("review.reviewNumber",map);
			}
		
			
			@SuppressWarnings("unchecked")
			public List<Map<String,Object>> goodsQna(Map<String,Object> map) throws Exception{
				return (List<Map<String,Object>>)selectList("review.goodsQna",map);
			}
			
			//QNA 삭제
			public void goodsQnaDelete(Map<String,Object> map) throws Exception{
				delete("review.goodsQnaDelete",map);
			}
			
			
			public void goodsQnaModify(Map<String,Object> map) throws Exception{
				update("review.goodsQnaModify",map);
			}
			
			//CS_NUMBER,MEMBER_ID에 해당하는 리뷰 가져오기
			@SuppressWarnings("unchecked")
			public Map<String, Object> qnaSelect(Map<String, Object> map) throws Exception{
				return (Map<String,Object>)selectOne("review.qnaSelect",map);
			}
			
			
			//QNA 등록
			public void goodsQnaInsert(Map<String,Object> map) throws Exception{
				insert("review.goodsQnaInsert",map);
			}
			
			//리뷰 CS_NUMBER 시퀀스 가져오기,, 이미지넣을 때 값이 먼저필요
			@SuppressWarnings("unchecked")
			public Map<String, Object> qnaNumber(Map<String, Object> map) throws Exception{
				return (Map<String,Object>)selectOne("review.qnaNumber",map);
			}
			
			
}
