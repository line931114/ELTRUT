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
}
