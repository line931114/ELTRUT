package b21.spring.adminGoods;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminGoodsService {

	// Goods 목록
		public List<Map<String, Object>> adminGoodsList(Map<String, Object> map) throws Exception;
		
		
		// 상품 검색(상품 이름)
		public List<Map<String, Object>> adminGoodsSearch0(String isSearch);
		// 상품 검색(상품 번호)
		public List<Map<String, Object>> adminGoodsSearch1(String isSearch);
		// 상품 검색(카테고리 검색)
		public List<Map<String, Object>> adminGoodsSearch2(String isSearch);
		// 상품 검색(재고가 0인 상품)
		public List<Map<String, Object>> adminGoodsSearch3(String isSearch);
		// 상품 정렬(판매량순)
		public List<Map<String, Object>> adminGoodsSearch4(String isSearch);
		// 상품 정렬(조회순)
		public List<Map<String, Object>> adminGoodsSearch5(String isSearch);
	
		// 전체 상품 수
		public Integer goodsCount() throws Exception;

		// 상품 등록
		public void insertAdminGoods(Map<String, Object> map, HttpServletRequest request) throws Exception;

		// 상품 이미지 정보
		public Map<String, Object> modifyGoodsFormImage(Map<String, Object> map) throws Exception;

		// 상품 정보 수정
		public void modifyGoods(Map<String, Object> map, HttpServletRequest request) throws Exception;

		// 상품 수정 폼으로 이동
		public Map<String, Object> modifyGoodsForm(Map<String, Object> map) throws Exception;

		// 상품 삭제
		public void deleteGoods(Map<String, Object> map) throws Exception;
		
		//주문 취소시 상품 수량 복구
		public void addAmount(Map<String, Object> map) throws Exception;
		
		public List<Map<String, Object>> TotalSales(Map<String, Object> map) throws Exception;
		
		public List<Map<String, Object>> CategorySales(Map<String, Object> map) throws Exception;
		
		public List<Map<String, Object>> DateSales(Map<String, Object> map) throws Exception;
	
}
