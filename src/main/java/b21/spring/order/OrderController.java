package b21.spring.order;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import b21.spring.cart.CartService;
import b21.spring.eltrut.CommandMap;

@Controller
public class OrderController {
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	@Resource(name = "cartService")
	private CartService cartService;

	//상세보기에서 바로구매
	@RequestMapping(value = "order")
	public ModelAndView orderFormLoginAop(CommandMap commandMap, HttpServletRequest request) throws Exception {
		//회원구매 AND 비회원구매
		
		HttpSession session = request.getSession();
		
		
		//바로구매시작
		System.out.println("바로 구매 넘어오는 값들 :" +commandMap.getMap());
		ModelAndView mv = new ModelAndView("order");

		commandMap.put("GOODS_NUMBER", commandMap.get("GOODS_NUMBER"));

		System.out.println(commandMap.get("GOODS_NUMBER"));
		
		//주문자정보뽑아주기 회원,비회원 구분//
		if (session.getAttribute("MEMBER_ID") != null) {
			System.out.println("회원 바로 구매 시작");
			
			commandMap.put("MEMBER_ID", session.getAttribute("MEMBER_ID"));
			System.out.println("MEMBER_ID :"  +session.getAttribute("MEMBER_ID"));
			
			//회원정보
			Map<String, Object> orderMember = orderService.orderMember(commandMap.getMap());

			mv.addObject("orderMember", orderMember);
			
		
			
			

		}
		//주문자정보뽑아주기 끝//
		
		//주문상품정보뽑아주기 회원,비회원 동일//
		String[] goods_number = request.getParameterValues("GOODS_NUMBER"); 
		String[] ea = request.getParameterValues("EA");
		String[] cart_number = request.getParameterValues("CART_NUMBER");
		List<Map<String, Object>> goods = new ArrayList<Map<String, Object>>();
		

		
		for (int i = 0; i < goods_number.length; i++) {

			System.out.println("EA[" + i + "] = " + ea[i]);
			commandMap.put("GOODS_NUMBER", goods_number[i]);
			commandMap.put("EA", ea[i]);
			commandMap.put("CART_NUMBER", cart_number[i]);
			System.out.println("CommandMap!! :" +commandMap.getMap());
			Map<String, Object> orderGoods = orderService.orderGoods(commandMap.getMap());

			System.out.println("orderGoods : " + orderGoods);

			orderGoods.put("EA", ea[i]);

			goods.add(orderGoods);

			System.out.println("goods : " + goods);

		}
	    mv.addObject("CART_NUMBER", commandMap.get("CART_NUMBER"));
		mv.addObject("goods_number", goods_number);
		mv.addObject("EA", ea);

		System.out.println("굿즈사이즈" + goods.size());

		mv.addObject("goods", goods);
		
		int sum=0;
		
		for(Map<String,Object> index: goods) {
			sum+=Integer.valueOf(index.get("TOTALPRICE").toString());;
			
		}
		mv.addObject("sum", sum);
		return mv;
	}
	
 @RequestMapping(value = "orderDetail")
 public ModelAndView orderDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {

    ModelAndView mv = new ModelAndView("orderDetail");

    HttpSession session = request.getSession();
    System.out.println("commandMap!! :"+commandMap.getMap());
    
    
    System.out.println("receiverPhone :"+commandMap.get("RECEIVER_PHONE"));
    commandMap.put("RECEIVER_PHONE", commandMap.get("RECEIVER_PHONE"));
    
    commandMap.put("GOODS_NUMBER", commandMap.get("GOODS_NUMBER"));

	System.out.println(commandMap.get("GOODS_NUMBER"));

    if (session.getAttribute("MEMBER_ID") != null) {

       commandMap.put("MEMBER_ID", session.getAttribute("MEMBER_ID"));

       System.out.println(session.getAttribute("MEMBER_ID"));

       Map<String, Object> orderMember = orderService.orderMember(commandMap.getMap());

       mv.addObject("orderMember", orderMember);

    }

    List<Map<String, Object>> goods = new ArrayList<Map<String, Object>>();

    String[] ea = request.getParameterValues("EA");
    String[] goods_number = request.getParameterValues("GOODS_NUMBER");
	String[] cart_number = request.getParameterValues("CART_NUMBER");
    for (int i = 0; i < goods_number.length; i++) {

       commandMap.put("EA", ea[i]);
       commandMap.put("GOODS_NUMBER", goods_number[i]);
       commandMap.put("CART_NUMBER", cart_number[i]);
       Map<String, Object> orderGoods = orderService.orderGoods(commandMap.getMap());
       
       orderGoods.put("EA", ea[i]);

       goods.add(orderGoods);

       System.out.println("goods : " + goods);

       mv.addObject("EA", ea[i]);
       mv.addObject("GOODS_NUMBER", goods_number[i]);

       System.out.println("EA : " + ea[i]);
       System.out.println("GOODS_NUMBER : " + goods_number[i]);
    }
    
    mv.addObject("goods", goods);
     //회원이든 비회원이던 동일
    mv.addObject("RECEIVER_NAME", commandMap.get("RECEIVER_NAME"));
    mv.addObject("RECEIVER_ZIPCODE", commandMap.get("RECEIVER_ZIPCODE"));
    mv.addObject("RECEIVER_ADDRESS1", commandMap.get("RECEIVER_ADDRESS1"));
    mv.addObject("RECEIVER_ADDRESS2", commandMap.get("RECEIVER_ADDRESS2"));
    mv.addObject("RECEIVER_PHONE", commandMap.get("RECEIVER_PHONE"));
    mv.addObject("DELIVERY_MESSAGE", commandMap.get("DELIVERY_MESSAGE"));
    mv.addObject("CHECK", commandMap.get("check"));
    mv.addObject("CART_NUMBER", commandMap.get("CART_NUMBER"));
    
    return mv;
 }
 

	@RequestMapping(value = "orderEnd")
	public ModelAndView orderEnd(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		
		System.out.println("1확인"+commandMap.getMap());

	    commandMap.put("MEMBER_ID", session.getAttribute("MEMBER_ID"));

		Map<String, Object> orderMember = orderService.orderMember(commandMap.getMap());

		System.out.println(orderMember);

		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();

		for (int i = 0; i < 5; i++) {
			temp.append((int) ((rnd.nextInt(26)) + 65));
		}

		List<Map<String, Object>> goods = new ArrayList<Map<String, Object>>();

		String[] ea = request.getParameterValues("EA");
		String[] goods_total = request.getParameterValues("goods_total");
		System.out.println("굿스토탈 " + goods_total[0]);
		String[] goods_number = request.getParameterValues("GOODS_NUMBER");
		String[] cart_number = request.getParameterValues("CART_NUMBER");
		
		int total = 0;

		for (int i = 0; i < goods_number.length; i++) {

			commandMap.put("EA", ea[i]);
			commandMap.put("GOODS_NUMBER", goods_number[i]);

			Map<String, Object> orderGoods = orderService.orderGoods(commandMap.getMap());

			orderGoods.put("EA", ea[i]);

			goods.add(orderGoods);
			mv.addObject("goods", goods);
			System.out.println("goods : " + goods);

			total += Integer.parseInt(goods_total[i]);
		}

		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String date = sdf.format(d);

		String ORDER_NUMBER = (date + temp);

		System.out.println(ORDER_NUMBER);

		commandMap.put("ORDER_NUMBER", ORDER_NUMBER);
		if (session.getAttribute("MEMBER_ID") != null) {

			commandMap.put("BUYER_ZIPCODE", orderMember.get("MEMBER_ZIPCODE"));
			commandMap.put("BUYER_ADDRESS1", orderMember.get("MEMBER_ADDRESS1"));
			commandMap.put("BUYER_ADDRESS2", orderMember.get("MEMBER_ADDRESS2"));
			commandMap.put("BUYER_NAME", orderMember.get("MEMBER_NAME"));
			commandMap.put("BUYER_EMAIL", orderMember.get("MEMBER_EMAIL"));
			commandMap.put("BUYER_NUMBER", orderMember.get("MEMBER_PHONE"));

		}
		System.out.println("2확인"+commandMap.getMap());

		if (request.getParameter("DELIVERY_MESSAGE").isEmpty()) {
			commandMap.put("DELIVERY_MESSAGE", " ");
		}
		

		commandMap.put("GOODS_NUMBER", commandMap.get("GOODS_NUMBER"));
		commandMap.put("RECEIVER_NAME", commandMap.get("RECEIVER_NAME"));
		commandMap.put("RECEIVER_ZIPCODE", commandMap.get("RECEIVER_ZIPCODE"));
		commandMap.put("RECEIVER_ADDRESS1", commandMap.get("RECEIVER_ADDRESS1"));
		commandMap.put("RECEIVER_ADDRESS2", commandMap.get("RECEIVER_ADDRESS2"));
		commandMap.put("DELIVERY_MESSAGE", commandMap.get("DELIVERY_MESSAGE"));
		commandMap.put("RECEIVER_NUMBER", commandMap.get("RECEIVER_PHONE"));
	
		System.out.println("3확인"+commandMap.getMap());

		orderService.createDeliveryList(commandMap.getMap());

		for (int i = 0; i < goods_number.length; i++) {

			commandMap.put("ORDER_AMOUNT", ea[i]);
			commandMap.put("ORDER_TOTAL_PRICE", goods_total[i]);
			commandMap.put("GOODS_NUMBER", goods_number[i]);
			commandMap.put("CART_NUMBER", cart_number[i]);


			System.out.println("GOODS_NUMBER : " + commandMap.get("GOODS_NUMBER"));
			System.out.println("ORDER_AMOUNT : " + commandMap.get("ORDER_AMOUNT"));
			System.out.println("ORDER_NUMBER : " + commandMap.get("ORDER_NUMBER"));
			System.out.println("모가안나옵니까~ " + commandMap.getMap());
			
			cartService.deleteMyCart(commandMap.getMap());
			orderService.createOrderList(commandMap.getMap());
			System.out.println(i+"번 돌았음");

		}
		mv.addObject("ORDER_NUMBER", ORDER_NUMBER);
		mv.addObject("BUYER_NUMBER", commandMap.get("BUYER_NUMBER"));
		mv.addObject("BUYER_NAME", commandMap.get("BUYER_NAME"));
		mv.addObject("ORDER_TOTAL_PRICE", commandMap.get("ORDER_TOTAL_PRICE"));
		mv.addObject("RECEIVER_NAME", commandMap.get("RECEIVER_NAME"));
		mv.addObject("RECEIVER_ZIPCODE", commandMap.get("RECEIVER_ZIPCODE"));
		mv.addObject("RECEIVER_ADDRESS1", commandMap.get("RECEIVER_ADDRESS1"));
		mv.addObject("RECEIVER_ADDRESS2", commandMap.get("RECEIVER_ADDRESS2"));
		mv.addObject("DELIVERY_MESSAGE", commandMap.get("DELIVERY_MESSAGE"));
		mv.addObject("RECEIVER_PHONE", commandMap.get("RECEIVER_NUMBER"));
		
		
		mv.setViewName("orderEnd");

		return mv;
	}
	
	
	@RequestMapping("/orderPay")
	public ModelAndView orderPay() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("order/orderPay");
		return mv;
	}

}
