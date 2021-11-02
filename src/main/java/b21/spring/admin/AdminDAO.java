package b21.spring.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import b21.spring.eltrut.AbstractDAO;
@Repository("adminDAO")
public class AdminDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> allCancelList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("adminOrderCancel.allCancelList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> updateCancelList(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("adminOrderCancel.updatecancle", map);
	}
	
}
