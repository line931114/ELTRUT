package b21.spring.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("mainService")
public class MainServiceImpl implements MainService{

	@Resource(name="mainDAO")
	private MainDAO mainDAO;

	@Override
	public List<Map<String, Object>> goodsList(Map<String, Object> map) throws Exception {
		return mainDAO.selectGoods(map);
	}
	
	
}
