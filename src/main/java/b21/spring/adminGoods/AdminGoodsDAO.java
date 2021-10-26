package b21.spring.adminGoods;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;

import b21.spring.eltrut.AbstractDAO;


@Repository("adminGoodsDAO")
public class AdminGoodsDAO extends AbstractDAO {

	// 상품 리스트
	   @SuppressWarnings("unchecked")
	   public List<Map<String, Object>> adminGoodsList(Map<String, Object> map) throws Exception {
	      return (List<Map<String, Object>>) selectList("admin.selectAdminGoodsList", map);
	   }

	// 전체 상품수
	   public int goodsCount() throws Exception {
	      return (Integer) selectOne("admin.countAdminGoods");
	   }

	   // 상품 검색(상품 이름)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminGoodsSearch0(String isSearch) {
		return (List<Map<String, Object>>) selectList("admin.adminGoodsSearch0", isSearch);
	}
	 // 상품 검색(상품 번호)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminGoodsSearch1(String isSearch) {
		return (List<Map<String, Object>>) selectList("admin.adminGoodsSearch1", isSearch);
	}
	 // 상품 검색(카테고리 검색)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminGoodsSearch2(String isSearch) {
		return (List<Map<String, Object>>) selectList("admin.adminGoodsSearch2", isSearch);
	}
	//상품 검색 재고0상태
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminGoodsSearch3(String isSearch) {
		return (List<Map<String, Object>>) selectList("admin.adminGoodsSearch3", isSearch);
	}
	//상품 검색 판매량순
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminGoodsSearch4(String isSearch) {
		return (List<Map<String, Object>>) selectList("admin.adminGoodsSearch4", isSearch);
	}
	//상품 검색 최신순
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminGoodsSearch5(String isSearch) {
		return (List<Map<String, Object>>) selectList("admin.adminGoodsSearch5", isSearch);
	}

	// 상품 등록
	   public void insertAdminGoods(Map<String, Object> map) throws Exception {
	      insert("admin.insertAdminGoods", map);
	   }
	   
		
		//이미지 등록 
		public void insertGoodsImage(Map<String, Object> map) throws
		  Exception { insert("admin.insertAdminGoodsImage", map); }
		
		  //썸네일 이미지 등록 
		  public void insertGoodsThumnail(Map<String, Object> map) throws
		  Exception { update("admin.insertAdminGoodsThumbnail", map); }
		  
		  //이미지 등록 
		  public void insertGoodsThumnail1(Map<String, Object> map) throws
		  Exception { update("admin.insertAdminGoodsThumbnail1", map); }
		  
		  public void insertGoodsThumnail2(Map<String, Object> map) throws
		  Exception { update("admin.insertAdminGoodsThumbnail2", map); }
		  
		  
		  // 상품 세분화 등록 public void insertGoodsKind(Map<String, Object> map) throws
		  //Exception { insert("admin.insertAdminGoodsCategory", map); }
		 

	   
	   //상품 수정폼으로 이동 (WITH ORIGINAL DATA)
	   @SuppressWarnings("unchecked")
	   public Map<String, Object> modifyGoodsForm(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("admin.selectOneGoods", map);
	}

	   
	   //상품 이미지 수정
	   public void modifyGoodsImage(Map<String, Object> map) throws Exception {
		      update("admin.modifyGoodsImage", map);
		   }

	   
	   //상품 이미지 정보
	   @SuppressWarnings("unchecked")
	   public Map<String, Object> modifyGoodsFormImage(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("admin.selectOneGoodsImage", map);
	}

	   //상품 수정
	public void modifyGoods(Map<String, Object> map) throws Exception {
		update("admin.modifyGoods", map);
		
	}
	
		//상품 종류 수정
	public void modifyGoodsKind(Map<String, Object> map) throws Exception {
		update("admin.modifyGoodsCategory", map);
		
	}
	
		//상품 종류 삭제
	public void deleteGoodsKind(Map<String, Object> map) {
		delete("admin.deleteGoodsCategory", map);
		
	}
	
		// 상품 본문이미지(상세보기) 삭제
	public void deleteGoodsImage(Map<String, Object> map) throws Exception {
		   delete("adminGoods.deleteGoodsDetailImage", map);
		
	}

	// 상품 삭제
	   public void deleteGoods(Map<String, Object> map) throws Exception {
	      delete("admin.deleteAdminGoods", map);
	   }

	   // 주문취소시 상품 수량 복구
	   public void addAmount(Map<String, Object> map) throws Exception {
	      update("admin.addAmount", map);
	   }
	}
	
		