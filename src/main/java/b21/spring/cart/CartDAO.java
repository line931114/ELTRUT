package b21.spring.cart;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import b21.spring.eltrut.AbstractDAO;

@Repository("cartDAO")
public class CartDAO extends AbstractDAO {

	// 장바구니 등록
	public void cartInsert(Map<String, Object> map) throws Exception {
		insert("cart.insertCart", map);
	}
	
	// 회원 개인의 장바구니 목록 불러오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> cartList(Map<String, Object> map) throws Exception {
		return selectList("cart.selectMyCart", map);
	}

	// 장바구니 삭제
	public void deleteMyCart(Map<String, Object> map) throws Exception {
		delete("cart.deleteMyCart", map);
	}

	// 장바구니 수정(옵션변경)
	public void updateCarts(Map<String, Object> map) throws Exception {
		update("cart.updateCarts", map);
	}

}
