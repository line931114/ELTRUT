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

	
}
