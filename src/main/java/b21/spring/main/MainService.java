package b21.spring.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MainService {

	List<Map<String,Object>>goodsList(Map<String,Object>map)throws Exception;
	
	List<Map<String,Object>>search(Map<String,Object>map, HttpServletRequest request)throws Exception;
	
	Map<String,Object>  header_baskets(Map<String,Object>map) throws Exception;
		
	public List<Map<String, Object>> adminGoodsList(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> adminGoodsSearch2(String isSearch);
}
