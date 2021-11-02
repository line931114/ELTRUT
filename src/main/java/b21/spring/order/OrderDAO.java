package b21.spring.order;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import b21.spring.eltrut.AbstractDAO;

@Repository("orderDAO")
public class OrderDAO extends AbstractDAO {
	
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> orderMember(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("goods.orderMember", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> orderGoods(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("goods.orderGoods", map);
	}
	
	public Object createDeliveryList(Map<String, Object> map) throws Exception {
		return  insert("goods.createDeliveryList", map);
	}
	
	public Object createOrderList(Map<String, Object> map) throws Exception {
		return  insert("goods.createOrderList", map);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOrderList2(Map<String, Object> map) throws Exception {
		return selectList("member.selectOrderList", map);
	}
	
}
