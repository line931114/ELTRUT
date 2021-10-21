package b21.spring.main;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import b21.spring.eltrut.AbstractDAO;
@Repository("mainDAO")
public class MainDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String,Object>>selectGoods(Map<String,Object>map)throws Exception{
		return (List<Map<String,Object>>)selectList("goods.GoodsList",map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>>search(Map<String,Object>map)throws Exception{
		return (List<Map<String,Object>>)selectList("goods.search",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> header_baskets(Map<String,Object>map)throws Exception{
		
		
		return (Map<String,Object>) selectOne("member.header_basket",map);
	}
	
	
}
