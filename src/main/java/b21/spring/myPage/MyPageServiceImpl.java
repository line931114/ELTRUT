package b21.spring.myPage;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service("myPageService")
public class MyPageServiceImpl implements MyPageService{

	@Resource(name="myPageDAO")
	private MyPageDAO myPageDAO;
	
	@Override
	public Map<String,Object> memberInfo(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myPageDAO.memberInfo(map);
	}
	public Map<String,Object> memberUpdate(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myPageDAO.memberUpdate(map);
	}
	@Override
	public Map<String, Object> memberDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myPageDAO.memberDelete(map);
	}
	@Override
	public List<Map<String,Object>> orderInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myPageDAO.orderInfo(map);
	}
	
	
	@Override
	public void orderCancel(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		 myPageDAO.orderCancle(map);
	}
	public Map<String, Object> orderExchange(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myPageDAO.orderExchange(map);
	}
	@Override
	public void cancel(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		myPageDAO.cancel(map);
	}
	@Override
	public List<Map<String, Object>> enquiryCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myPageDAO.enquiryCheck(map);
	}
	@Override
	public void enquiryDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		myPageDAO.enquiryDelete(map);
	}
	public void enquiryModify(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		myPageDAO.enquiryModify(map);
	}
	
	
	@Override
	public Map<String, Object> enquiryModifyForm(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myPageDAO.enquiryModifyForm(map);
	}
	@Override
	public List<Map<String, Object>> qnaCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myPageDAO.qnaCheck(map);
	}
	@Override
	public void qnaDelete(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		myPageDAO.qnaDelete(map);
	}
	@Override
	public void qnaModify(Map<String, Object> map) throws Exception {
		myPageDAO.qnaModify(map);
		
	}
	@Override
	public Map<String, Object> qnaModifyForm(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myPageDAO.qnaModifyForm(map);
	}

}
