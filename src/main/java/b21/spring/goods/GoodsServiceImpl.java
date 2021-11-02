package b21.spring.goods;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{

	@Resource(name="goodsDAO")
	private GoodsDAO goodsDAO;

	
	@Override
	public Map<String, Object> selectOneGoods(Map<String, Object> map) throws Exception {
		return goodsDAO.selectOneGoods(map);
	}


	
	
}
