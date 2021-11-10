package b21.spring.login;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service("loginService")
public class LoginServiceImpl implements LoginService{

	@Resource(name="loginDAO")
	private LoginDAO loginDAO;
	@Override
	public Map<String, Object> login(Map<String, Object> map) throws Exception {
		return loginDAO.selectId(map);
	}
	@Override
	public Map<String, Object> findId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findId(map);
		
	}
	@Override
	public Map<String, Object> findPw(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findPw(map);
	}
	@Override
	public Map<String, Object> findFail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findFail(map);
	}
	@Override
	public Map<String, Object> findFail0(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findFail0(map);
	}

	@Override
	public Map<String, Object> kakaoLogin(String user_email) throws Exception {
		return loginDAO.selectKakao(user_email);
	}

	@Override
    public int checkMember(String user_email) throws Exception {
        return loginDAO.checkMember(user_email);
    }
	
}
