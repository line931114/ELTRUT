package b21.spring.goods;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import b21.spring.eltrut.AbstractDAO;
@Repository("goodsDAO")

public class GoodsDAO extends AbstractDAO{

		//상품정보
		@SuppressWarnings("unchecked")
		public Map<String, Object> selectOneGoods(Map<String, Object> map) throws Exception{
			return (Map<String,Object>)selectOne("goods.selectOneGoods",map);
		}
		
}
