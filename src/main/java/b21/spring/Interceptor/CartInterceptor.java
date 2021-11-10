package b21.spring.Interceptor;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sun.tools.javac.launcher.Main;

import b21.spring.eltrut.CommandMap;
//HandlerInterceptorAdapter 추상클래스 상속
// preHandle(), postHandler() 오버라이딩
import b21.spring.main.MainService;

public class CartInterceptor extends HandlerInterceptorAdapter {
	@Resource(name="MainService")
    private MainService mainService;
	 private static final Logger logger
     = LoggerFactory.getLogger(CartInterceptor.class);
//    메인 액션이 실행되기 전
    public boolean afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler) 
                    throws Exception {
    	System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
        //세션 객체 생성
        HttpSession session=request.getSession();
        //세션이 없으면(로그인이 안됬으)
        if(session.getAttribute("userid") == null) {
            //장바구니에서 로그인안되게..
            response.sendRedirect(request.getContextPath()
                    +"/cartlist?message=nologin");
            return false; //메인 액션으로 가지 않음
        } else {
            return true; //메인 액션으로 이동(매핑된 url)
        }
    }
    //메인 액션이 실행된 후
//    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//            ModelAndView modelAndView, CommandMap commandMap) throws Exception {
//        super.postHandle(request, response, handler, modelAndView);
//        String MEMBER_ID=(String) request.getAttribute("MEMBER_ID");
//      
//		Map<String,Object> header_basket=mainService.header_baskets(commandMap.getMap());
//		  commandMap.put("MEMBER_ID", MEMBER_ID);
//		  modelAndView.addObject("basket",header_basket);
//		  System.out.printf(header_basket+MEMBER_ID);
//		  System.out.println("ffffffffffffffffffffffffffffffffffffffff");
//		  return;
//    }
    
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
    	// 장바구니 수량을 띄워주는것,,,,,
    	ModelAndView mv = new ModelAndView();
    	CommandMap commandMap = new CommandMap();
    	HttpSession session = request.getSession();
    	if(session.getAttribute("MEMBER_ID") == null) {
    		return super.preHandle(request, response, handler);
    	} else {
    		
    	 commandMap.put("MEMBER_ID", session.getAttribute("MEMBER_ID"));
    	 
 		Map<String,Object> header_basket=mainService.header_baskets(commandMap.getMap());
 			
 		  request.setAttribute("header_basket", header_basket);
 		  
 		    	return super.preHandle(request, response, handler);
    	}
}
}
