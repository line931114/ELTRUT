package b21.spring.cart;

import java.util.List;
import java.util.Map;

public interface CartService {
		
		// 장바구니 담기
		public void cartInsert(Map<String, Object> map) throws Exception;

		// 회원 장바구니 목록
		public List<Map<String, Object>> cartList(Map<String, Object> map) throws Exception;
		
		// 장바구니 삭제
		public void deleteMyCart(Map<String, Object> map) throws Exception;

		// 장바구니 수정(옵션변경)
		public void updateCarts(Map<String, Object> map) throws Exception;

	}

