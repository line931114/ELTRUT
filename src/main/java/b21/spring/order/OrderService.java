package b21.spring.order;

import java.util.List;
import java.util.Map;

public interface OrderService {
	
	Map<String, Object> orderMember(Map<String, Object> map) throws Exception;
	
	Map<String, Object> orderGoods(Map<String, Object> map) throws Exception;
	
	public Object createDeliveryList(Map<String, Object> map) throws Exception;
	
	public Object createOrderList(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectOrderList(Map<String, Object> map) throws Exception;
}
