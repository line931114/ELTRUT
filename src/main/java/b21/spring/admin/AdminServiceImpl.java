package b21.spring.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;



@Service("AdminServicea")
public class AdminServiceImpl implements AdminService{

	@Resource(name = "adminDAO")
	private AdminDAO adminDAO;

	@Override
	public List<Map<String, Object>> allCancelList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.allCancelList(map);
	}

	@Override
	public Map<String, Object> updateCancelList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.updateCancelList(map);
	}

	

	
}
