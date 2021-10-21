package b21.spring.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service("MainService")
public class MainServiceImpl implements MainService{

	@Resource(name="mainDAO")
	private MainDAO mainDAO;

	@Override
	public List<Map<String, Object>> goodsList(Map<String, Object> map) throws Exception {
		return mainDAO.selectGoods(map);
	}

	@Override
	public List<Map<String, Object>> search(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		 return mainDAO.search(map);
	}

	@Override
	public Map<String,Object>  header_baskets(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		return mainDAO.header_baskets(map);
	}

	
	
	
	
}
