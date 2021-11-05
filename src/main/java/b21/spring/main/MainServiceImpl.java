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

	@Override
	public List<Map<String, Object>> adminGoodsList(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> adminGoodsList = mainDAO.adminGoodsList(map);
		return adminGoodsList;
	}
	
	// 상품 검색(카테고리 검색)
		@Override
		public List<Map<String, Object>> adminGoodsSearch2(String isSearch) {
			List<Map<String, Object>> adminGoodsList = mainDAO.adminGoodsSearch2(isSearch);
			return adminGoodsList;
		}
	
}
