package b21.spring.login;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import b21.spring.eltrut.CommandMap;

@Controller
public class LoginController {

	@Resource(name="loginService")
	private LoginService loginService;
	
	@RequestMapping(value="/loginForm")
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("loginForm");
		return mav;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	   public ModelAndView loginComplete(CommandMap commandMap, HttpServletRequest request) throws Exception {
	      ModelAndView mv = new ModelAndView();
	      
	      
	      HttpSession session = request.getSession();
	      
	      System.out.println("아이디" + commandMap.get("MEMBER_ID"));
	      
	      Map<String, Object> chk = loginService.login(commandMap.getMap());
	      if (chk == null) {	//아이디 값이 없으면
	         mv.setViewName("loginForm");
	         mv.addObject("message", "해당 아이디가 없습니다.");
	         return mv;
	      } else {	//아이디 값이 있으면
	    	  								//비밀번호 1 = DB에 저장된 해당 아이디 비밀번호,		비밀번호 2 = 로그인시 회원이 입력한 비밀번호 
	         System.out.println("비밀번호 1 : " + chk.get("MEMBER_PASSWORD") + "\n비밀번호 2 : " + commandMap.get("MEMBER_PASSWORD"));
	         			//멤버 비밀번호가 입력한 비밀번호 값이 같으면
	         if (String.valueOf(chk.get("MEMBER_PASSWORD")).equals(commandMap.get("MEMBER_PASSWORD"))) {
	            session.setAttribute("MEMBER_ID", commandMap.get("MEMBER_ID"));	//세션에 아이디를 넣어라
	            mv.addObject("MEMBER", chk);	//
	            mv.setViewName("redirect:/main");
	            session.setAttribute("MEMBER_NAME", chk.get("MEMBER_NAME"));
	            session.setAttribute("MEMBER_NUMBER", chk.get("MEMBER_NUMBER"));
	            session.setAttribute("MEMBER_PHONE", chk.get("MEMBER_PHONE"));
	            session.setAttribute("MEMBER_EMAIL", chk.get("MEMBER_EMAIL"));
	            session.setAttribute("MEMBER_ADMIN", chk.get("MEMBER_ADMIN"));

	            return mv;
	        
	         } else {	//비밀번호 틀렸을때
		        	mv.setViewName("loginForm");
		            mv.addObject("message", "비밀번호를 확인해 주세요.");
		            return mv;
		         }
	      }
	}
	               
	   @RequestMapping(value = "/logout")		//로그아웃
	   public ModelAndView logout(HttpServletRequest request, CommandMap commandMap) {
	      HttpSession session = request.getSession(false);
	      if (session != null)
	         session.invalidate();
	      ModelAndView mv = new ModelAndView();
	      mv.setViewName("redirect:/main");
	      return mv;
	   }
	}