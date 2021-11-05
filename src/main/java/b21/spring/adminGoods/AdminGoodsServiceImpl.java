package b21.spring.adminGoods;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import b21.spring.adminGoods.AdminGoodsDAO;
import b21.spring.eltrut.GoodsImageUtils;

@Service("adminGoodsService")
public class AdminGoodsServiceImpl implements AdminGoodsService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "adminGoodsDAO")
	private AdminGoodsDAO AdminGoodsDAO;

	@Resource(name = "goodsImageUtils")
	private GoodsImageUtils goodsImageUtils;

	// Goods 목록보기
	@Override
	public List<Map<String, Object>> adminGoodsList(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> adminGoodsList = AdminGoodsDAO.adminGoodsList(map);
		return adminGoodsList;
	}

	// 상품 검색(상품명)
	@Override
	public List<Map<String, Object>> adminGoodsSearch0(String isSearch) {
		List<Map<String, Object>> adminGoodsList = AdminGoodsDAO.adminGoodsSearch0(isSearch);
		return adminGoodsList;
	}

	// 상품 검색(상품 번호)
	@Override
	public List<Map<String, Object>> adminGoodsSearch1(String isSearch) {
		List<Map<String, Object>> adminGoodsList = AdminGoodsDAO.adminGoodsSearch1(isSearch);
		return adminGoodsList;
	}

	// 상품 검색(카테고리 검색)
	@Override
	public List<Map<String, Object>> adminGoodsSearch2(String isSearch) {
		List<Map<String, Object>> adminGoodsList = AdminGoodsDAO.adminGoodsSearch2(isSearch);
		return adminGoodsList;
	}

	// 상품 검색(재고가 0인 상품)
	@Override
	public List<Map<String, Object>> adminGoodsSearch3(String isSearch) {
		List<Map<String, Object>> adminGoodsList = AdminGoodsDAO.adminGoodsSearch3(isSearch);
		return adminGoodsList;
	}

	// 상품 정렬(판매량순)
	@Override
	public List<Map<String, Object>> adminGoodsSearch4(String isSearch) {
		List<Map<String, Object>> adminGoodsList = AdminGoodsDAO.adminGoodsSearch4(isSearch);
		return adminGoodsList;
	}

	// 상품 정렬(조회순)
	@Override
	public List<Map<String, Object>> adminGoodsSearch5(String isSearch) {
		List<Map<String, Object>> adminGoodsList = AdminGoodsDAO.adminGoodsSearch5(isSearch);
		return adminGoodsList;
	}

	// 전체 상품 수
	@SuppressWarnings("removal")
	@Override
	public Integer goodsCount() throws Exception {
		return new Integer(AdminGoodsDAO.goodsCount());
	}

	// 상품 등록

	@SuppressWarnings("unchecked")
	@Override
	public void insertAdminGoods(Map<String, Object> map, HttpServletRequest request) throws Exception {

		AdminGoodsDAO.insertAdminGoods(map);

		map = goodsImageUtils.goodsThumbnail(map, request);
		AdminGoodsDAO.insertGoodsThumnail(map);

		map = goodsImageUtils.parseInsertFileInfo1(map, request);
		AdminGoodsDAO.insertGoodsThumnail1(map);

		map = goodsImageUtils.parseInsertFileInfo2(map, request);
		AdminGoodsDAO.insertGoodsThumnail2(map);

		/*
		 * String[] color = request.getParameterValues("GOODS_COLOR"); String[] size =
		 * request.getParameterValues("GOODS_SIZE"); String[] amount =
		 * request.getParameterValues("GOODS_AMOUNT");
		 * 
		 * for (int i = 0; i < color.length; i++) { map.put("GOODS_COLOR", color[i]);
		 * map.put("GOODS_SIZE", size[i]); map.put("GOODS_AMOUNT", amount[i]);
		 * AdminGoodsDAO.insertGoodsKind(map); }
		 */

		/*
		 * List<Map<String, Object>> goodsImageList =
		 * goodsImageUtils.parseInsertFileInfo(map, request);
		 * 
		 * if (goodsImageList.size() > 0) { for (int i = 0; i < goodsImageList.size();
		 * i++) { AdminGoodsDAO.insertGoodsImage(goodsImageList.get(i)); } }
		 */
	}

	// 상품 수정폼으로 이동
	@Override
	public Map<String, Object> modifyGoodsForm(Map<String, Object> map) throws Exception {
		Map<String, Object> goodsDetail = AdminGoodsDAO.modifyGoodsForm(map);
		return goodsDetail;
	}

	// 수정 폼 이동할때 상품 이미지 같이 가져오기
	@Override
	public Map<String, Object> modifyGoodsFormImage(Map<String, Object> map) throws Exception {
		Map<String, Object> goodsImage = AdminGoodsDAO.modifyGoodsFormImage(map);
		return goodsImage;
	}

	// 상품 수정
	@Override
	public void modifyGoods(Map<String, Object> map, HttpServletRequest request) throws Exception {

		// 상품 기본정보 수정

		AdminGoodsDAO.modifyGoods(map);

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

		// 상품 썸네일 수정
		if (multipartHttpServletRequest.getFile("GOODS_THUMBNAIL").getSize() > 0) {
			map = goodsImageUtils.goodsThumbnail(map, request);
			AdminGoodsDAO.insertGoodsThumnail(map);
		}

		map = goodsImageUtils.parseInsertFileInfo1(map, request);
		AdminGoodsDAO.insertGoodsThumnail1(map);

		map = goodsImageUtils.parseInsertFileInfo2(map, request);
		AdminGoodsDAO.insertGoodsThumnail2(map);

		
		
		/*
		 * // 상품 종류 수정(기존거 수정/삭제) if
		 * (request.getParameterValues("ORG_GOODS_KIND_NUMBER") != null) {
		 * 
		 * String[] ORG_GOODS_KIND_NUMBER =
		 * request.getParameterValues("ORG_GOODS_KIND_NUMBER"); List<String> orgList =
		 * new ArrayList<String>();
		 * 
		 * for (String a : ORG_GOODS_KIND_NUMBER) { orgList.add(a); }
		 * 
		 * String[] ORG_COLOR = null; String[] ORG_SIZE = null;
		 * 
		 * if (request.getParameterValues("ORG_GOODS_COLOR") != null) { ORG_COLOR =
		 * request.getParameterValues("ORG_GOODS_COLOR"); ORG_SIZE =
		 * request.getParameterValues("ORG_GOODS_SIZE"); }
		 * 
		 * // 상품 종류 정보 수정 for (int i = 0; i < orgList.size(); i++) { if
		 * (map.get(orgList.get(i)) != null) { map.put("GOODS_KIND_NUMBER",
		 * orgList.get(i)); map.put("MD_GOODS_COLOR", ORG_COLOR[i]);
		 * map.put("MD_GOODS_SIZE", ORG_SIZE[i]); String ADD = "addAmount_" +
		 * orgList.get(i);
		 * 
		 * if (map.get(ADD).toString().length() > 0) { map.put("addAmount",
		 * map.get(ADD)); } else { int cc = 0; map.put("addAmount", cc); }
		 * AdminGoodsDAO.modifyGoodsKind(map); } else { map.put("GOODS_KIND_NUMBER",
		 * orgList.get(i)); AdminGoodsDAO.deleteGoodsKind(map); } } }
		 * 
		 * // 새로 입력된 상품 종류 등록 if (request.getParameterValues("GOODS_COLOR") != null) {
		 * String[] color = request.getParameterValues("GOODS_COLOR"); String[] size =
		 * request.getParameterValues("GOODS_SIZE"); String[] amount =
		 * request.getParameterValues("GOODS_AMOUNT");
		 * 
		 * for (int i = 0; i < color.length; i++) { map.put("GOODS_NUMBER",
		 * map.get("GOODS_NUMBER")); map.put("GOODS_COLOR", color[i]);
		 * map.put("GOODS_SIZE", size[i]); map.put("GOODS_AMOUNT", amount[i]);
		 * AdminGoodsDAO.insertGoodsKind(map); } }
		 */
		// 상품 이미지 수정, 삭제
		System.out.println("이미지 : " + map.get("ORIGINAL_IMAGE"));

		if (map.get("ORIGINAL_IMAGE") != null) {
			List<Map<String, Object>> goodsImageList = goodsImageUtils.parseUpdateImages(map, request);

			if (goodsImageList.size() > 0) {
				for (int i = 0; i < goodsImageList.size(); i++) {
					AdminGoodsDAO.modifyGoodsImage(goodsImageList.get(i));
				}
			}

			String[] ORIGINAL_IMAGE = request.getParameterValues("ORIGINAL_IMAGE");
			Map<String, Object> deleteImage = new HashMap<String, Object>();

			for (String b : ORIGINAL_IMAGE) {
				if (map.get(b) == null) {
					deleteImage.put("GOODS_IMAGE_2", b);
					AdminGoodsDAO.deleteGoodsImage(deleteImage);
				}
			}
		}

		// 새로 입력된 이미지 등록
		List<MultipartFile> IMAGES = multipartHttpServletRequest.getFiles("GOODS_IMAGE_2");

		System.out.println("MAP이미지1 : " + multipartHttpServletRequest.getFile("GOODS_IMAGE_2"));
		System.out.println("MAP이미지 : " + multipartHttpServletRequest.getFiles("GOODS_IMAGE_2"));
		System.out.println("SIZE : " + IMAGES.size());

		/*
		 * if (IMAGES.size() > 0) { List<Map<String, Object>> goodsImageList =
		 * goodsImageUtils.parseInsertFileInfo(map, request);
		 * 
		 * System.out.println("goodsImageList : " + goodsImageList);
		 * System.out.println("mapImage : " + map.get("GOODS_IMAGE_2"));
		 * 
		 * for (int i = 0; i < goodsImageList.size(); i++) {
		 * AdminGoodsDAO.insertGoodsImage(goodsImageList.get(i));} }
		 */

	}

	// 상품 삭제
	@Override
	public void deleteGoods(Map<String, Object> map) throws Exception {
		/*
		 * List<Map<String, Object>> listMap = new ArrayList<Map<String, Object>>();
		 * 
		 * listMap = AdminGoodsDAO.modifyGoodsForm(map);
		 * goodsImageUtils.parseDeleteThumbnail(listMap.get(0));
		 * 
		 * listMap = AdminGoodsDAO.modifyGoodsFormImage(map);
		 * 
		 * for (int i = 0; i < listMap.size(); i++)
		 * goodsImageUtils.parseDeleteImages(listMap.get(i));
		 */

		AdminGoodsDAO.deleteGoods(map);
	}

	// 주문 취소시 상품 수량 복구
	@Override
	public void addAmount(Map<String, Object> map) throws Exception {
		AdminGoodsDAO.addAmount(map);
	}

	@Override
	public List<Map<String, Object>> TotalSales(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminGoodsDAO.totalsales(map);
	}
	@Override
	public List<Map<String, Object>> CategorySales(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminGoodsDAO.categorysales(map);
	}
	
	public List<Map<String, Object>> DateSales(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return AdminGoodsDAO.datesales(map);
	}
}
