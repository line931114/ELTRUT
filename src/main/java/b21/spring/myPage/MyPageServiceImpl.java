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

}
