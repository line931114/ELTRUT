package b21.spring.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

public interface AdminService {
	public List<Map<String, Object>> allCancelList(Map<String, Object> map) throws Exception;
	
	public Map<String, Object> updateCancelList(Map<String, Object> map) throws Exception;
}
