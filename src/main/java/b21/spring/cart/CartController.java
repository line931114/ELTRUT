package b21.spring.cart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import b21.spring.eltrut.CommandMap;

@Controller
public class CartController {

	@Resource(name = "cartService")
	private CartService cartService;
	
	List<Map<String, Object>> cartSession = new ArrayList<Map<String, Object>>();

	// 장바구니 담기
	@SuppressWarnings("unused")
	@RequestMapping(value = "/cart/cartIn")
	public ModelAndView cartIn(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/cartList");
		HttpSession session = request.getSession();

		if (session.getAttribute("MEMBER_ID") != null) { // 회원 장바구니 등록
			commandMap.put("GOODS_NUMBER", commandMap.get("GOODS_NUMBER"));
			commandMap.put("MEMBER_ID", session.getAttribute("MEMBER_ID"));
			System.out.println(commandMap.getMap());
			cartService.cartInsert(commandMap.getMap());
		} else { // 비회원 장바구니 등록
			
			mv.addObject("message", "상품 구매는 로그인후 이용가능합니다.");
			mv.setViewName("redirect:/loginForm");
			return mv;
				}
		return mv;
	}

	// 장바구니 리스트 불러오기
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/cartList")
	public ModelAndView cartList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		List<Map<String, Object>> cartList = new ArrayList<Map<String, Object>>();
		HttpSession session = request.getSession();

		if (session.getAttribute("MEMBER_ID") != null) {
			commandMap.put("MEMBER_ID", session.getAttribute("MEMBER_ID"));
			cartList = cartService.cartList(commandMap.getMap());
			System.out.println(cartList);
		} else {
			 mv.addObject("message", "회원정보가 없습니다. 로그인후 이용해주세요."); 
			mv.setViewName("cart/cartList");
			return mv;
			}
		mv.addObject("message", request.getParameter("message"));
		mv.addObject("cartList", cartList);
		mv.setViewName("cartList");
		return mv;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/optionModify")
	public ModelAndView optionModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(commandMap.getMap());
		mv.setViewName("redirect:/cartList");
		HttpSession session = request.getSession();
		List<Map<String, Object>> cartSession = new ArrayList<Map<String, Object>>();
		Map<String, Object> cartMap = new HashMap<String, Object>();
		String[] CART_NUMBER = request.getParameterValues("CART_NUMBER");
		String[] CART_AMOUNT = request.getParameterValues("CART_AMOUNT");
			
		if (session.getAttribute("MEMBER_ID") != null) {
			for (int i = 0; i < CART_NUMBER.length; i++) {

				cartMap.put("CART_NUMBER", CART_NUMBER[i]);
				cartMap.put("CART_AMOUNT", CART_AMOUNT[i]);
			System.out.println(cartMap);
			if(Integer.parseInt(commandMap.get("GOODS_AMOUNT").toString())>Integer.parseInt(cartMap.get("CART_AMOUNT").toString())){
				
				cartService.updateCarts(cartMap);
			}else {
				mv.addObject("message", "변경수량이 상품수량보다 많습니다.");
				return mv;
			}
			}
		}else {
			mv.addObject("message", "회원정보가 없습니다. 로그인후 이용해주세요.");
			return mv;
		} 

		return mv;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/cartDelete")
	public ModelAndView cartDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/cartList");
		HttpSession session = request.getSession();
		List<Map<String, Object>> cartSession = new ArrayList<Map<String, Object>>();
		Map<String, Object> cartMap = new HashMap<String, Object>();
		
		if (session.getAttribute("MEMBER_ID") != null) {// 회원 장바구니 삭제
	            cartMap = new HashMap<String, Object>();
	            cartMap.put("MEMBER_ID", session.getAttribute("MEMBER_ID"));
	            cartMap.put("CART_NUMBER", commandMap.get("CART_NUMBER"));
	            cartService.deleteMyCart(cartMap);
	         } else { // 비회원 장바구니 삭제
			mv.addObject("message", "회원정보가 없습니다. 로그인후 이용해주세요.");
			return mv;
		}

	
		return mv;
	
}
}
	