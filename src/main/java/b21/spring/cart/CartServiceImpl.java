package b21.spring.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("cartService")
public class CartServiceImpl implements CartService {

	@Resource(name = "cartDAO")
	private CartDAO cartDAO;

	// 장바구니 등록
	public void cartInsert(Map<String, Object> map) throws Exception {

			cartDAO.cartInsert(map);
		}
	// 회원 장바구니 목록
	@Override
	public List<Map<String, Object>> cartList(Map<String, Object> map) throws Exception {
		return cartDAO.cartList(map);
	}

	// 장바구니 삭제
	@Override
	public void deleteMyCart(Map<String, Object> map) throws Exception {
		cartDAO.deleteMyCart(map);
	}

	@Override
	public void updateCarts(Map<String, Object> map) throws Exception {
		cartDAO.updateCarts(map);
	}

}
