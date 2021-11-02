package b21.spring.myPage;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.SysexMessage;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import b21.spring.eltrut.CommandMap;

@Controller
public class MyPageController {

	@Resource(name="myPageService")
	private MyPageService myPageService;
	
	
	@RequestMapping(value="/myPage")
	public ModelAndView myPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPage");
		return mav;
	}
	
	@RequestMapping(value="/memberInfo")
	public ModelAndView memberInfo(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		mav.addObject("MEMBER_ID",MEMBER_ID);
		commandMap.put("MEMBER_ID", MEMBER_ID);
		
		Map<String,Object> memberInfo = myPageService.memberInfo(commandMap.getMap());
		 System.out.println(memberInfo);
		 mav.addObject("M",memberInfo);
		mav.setViewName("memberInfo");
		return mav;
	}
	
	
	@RequestMapping(value="/pwCheck")
	public ModelAndView pwCheck(CommandMap commandMap, HttpServletRequest request) throws Exception {
		  ModelAndView mav = new ModelAndView();
	      mav.setViewName("pwCheck");
	      return mav;
	}
	
	@RequestMapping(value="/pwCheck", method = RequestMethod.POST)
	public ModelAndView pwCheck1(CommandMap commandMap, HttpServletRequest request) throws Exception {
		  ModelAndView mav = new ModelAndView();
	      
	      HttpSession session = request.getSession();
	      String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
	      mav.addObject("MEMBER_ID",MEMBER_ID);
	      commandMap.put("MEMBER_ID", MEMBER_ID);
	  	
	      System.out.println("아이디" + commandMap.get("MEMBER_ID"));
	      
	      Map<String, Object> chk = myPageService.memberInfo(commandMap.getMap());
	      
	    	  								//비밀번호 1 = DB에 저장된 해당 아이디 비밀번호,		비밀번호 2 = 로그인시 회원이 입력한 비밀번호 
	         System.out.println("비밀번호 1 : " + chk.get("MEMBER_PASSWORD") + "\n비밀번호 2 : " + commandMap.get("MEMBER_PASSWORD"));
	         			//멤버 비밀번호가 입력한 비밀번호 값이 같으면
	         if (String.valueOf(chk.get("MEMBER_PASSWORD")).equals(commandMap.get("MEMBER_PASSWORD"))) {
	        	 mav.addObject("M",chk);
	        	 mav.setViewName("redirect:/memberUpdateForm");
	            return mav;
	        
	         } else {	//비밀번호 틀렸을때
	  	        	mav.setViewName("pwCheck");
	  	            mav.addObject("message", "비밀번호를 확인해 주세요.");
	  	            return mav;
	  	     }
	      
	      
	      }
   
	@RequestMapping(value="memberUpdateForm")
	public ModelAndView memberUpdateForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		mav.addObject("MEMBER_ID",MEMBER_ID);
		commandMap.put("MEMBER_ID", MEMBER_ID);
		
		Map<String,Object> memberInfo = myPageService.memberInfo(commandMap.getMap());
		 System.out.println(memberInfo);
		 mav.addObject("M",memberInfo);
		
		mav.setViewName("memberUpdateForm");
		return mav;
	}
	
	@RequestMapping(value="memberUpdateForm", method = RequestMethod.POST)
	public ModelAndView memberUpdateForm1(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		myPageService.memberUpdate(commandMap.getMap());
		
		HttpSession session = request.getSession();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		mav.addObject("MEMBER_ID",MEMBER_ID);
		commandMap.put("MEMBER_ID", MEMBER_ID);
		
		Map<String,Object> memberInfo = myPageService.memberInfo(commandMap.getMap());
		 System.out.println(memberInfo);
		 mav.addObject("M",memberInfo);
		
		
		mav.setViewName("memberInfo");
		return mav;
	}
	
	@RequestMapping(value="/deleteForm")
	public ModelAndView deleteForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("deleteForm");
		return mav;
	}
	
	@RequestMapping(value = "/deleteMember")
	@ResponseBody
	public ModelAndView memberDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		mav.addObject("MEMBER_ID",MEMBER_ID);
		commandMap.put("MEMBER_ID", MEMBER_ID);
		
		Map<String,Object> memberInfo = myPageService.memberInfo(commandMap.getMap());
		System.out.println("비밀번호 1 : " + memberInfo.get("MEMBER_PASSWORD") + "\n비밀번호 2 : " + commandMap.get("pw"));
	       
		if(memberInfo.get("MEMBER_PASSWORD").equals(commandMap.get("pw"))) {
			myPageService.memberDelete(commandMap.getMap());
				session.invalidate();
				mav.setViewName("deleteForm");
				mav.addObject("message", "1");
				return mav;
						
		}else {
			 mav.setViewName("deleteForm");
	         mav.addObject("message", "2");
	         return mav;
		}		
	}
	
	//여기서 부터 마이페이지->구매내역
	@RequestMapping(value="/orderInfo")
	public ModelAndView order(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		mav.addObject("MEMBER_ID",MEMBER_ID);
		commandMap.put("MEMBER_ID", MEMBER_ID);
		
		List<Map<String, Object>> orderInfo = myPageService.orderInfo(commandMap.getMap());
		System.out.println(orderInfo);
		
		mav.addObject("O",orderInfo);
		mav.setViewName("orderInfo");
		return mav;
	}
	
	
	//상품취소	
	@RequestMapping(value="/orderCancle")
	public ModelAndView orderCancle1(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		myPageService.orderCancel(commandMap.getMap());
		
		HttpSession session = request.getSession();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		mav.addObject("MEMBER_ID",MEMBER_ID);
		commandMap.put("MEMBER_ID", MEMBER_ID);
		
		List<Map<String, Object>> orderInfo = myPageService.orderInfo(commandMap.getMap());
		System.out.println(orderInfo);
		
		mav.addObject("O",orderInfo);
	
		
		mav.setViewName("orderInfo");
		return mav;
}
	
	
	//상품교환,환불
	@RequestMapping(value="/orderExchange")
	public ModelAndView orderExchange(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println(commandMap.get("ORDER_NUMBER"));
	
		Map<String,Object> orderExchange = myPageService.orderExchange(commandMap.getMap());
		
		mav.addObject("o", commandMap.get("ORDER_NUMBER"));
		mav.addObject("oc", orderExchange);
		mav.setViewName("orderExchange");
		return mav;
	}
	
	
	//상품 교환,환불후 넘어가는 페이지
	@RequestMapping(value="/cancel", method = RequestMethod.POST)
	public ModelAndView orderExchange1(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println(commandMap.getMap());
		myPageService.cancel(commandMap.getMap());
		
		HttpSession session = request.getSession();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		mav.addObject("MEMBER_ID",MEMBER_ID);
		commandMap.put("MEMBER_ID", MEMBER_ID);
		
		List<Map<String, Object>> orderInfo = myPageService.enquiryCheck(commandMap.getMap());
		System.out.println(orderInfo+" ");
		
		mav.addObject("O",orderInfo);
		mav.setViewName("enquiryCheck");
		return mav;
	}
	
	
	//마이페이지 - 내 문의사항 확인
	@RequestMapping(value="/enquiryCheck")
	public ModelAndView enquiryCheck(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		mav.addObject("MEMBER_ID",MEMBER_ID);
		commandMap.put("MEMBER_ID", MEMBER_ID);
		
		List<Map<String, Object>> orderInfo = myPageService.enquiryCheck(commandMap.getMap());
		System.out.println(orderInfo+" ");
		
		mav.addObject("O",orderInfo);
		mav.setViewName("enquiryCheck");
		return mav;
	}
	
	@RequestMapping(value="/enquiryDelete")
	public ModelAndView enquirydelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		myPageService.enquiryDelete(commandMap.getMap());

		HttpSession session = request.getSession();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		mav.addObject("MEMBER_ID",MEMBER_ID);
		commandMap.put("MEMBER_ID", MEMBER_ID);
		
		List<Map<String, Object>> orderInfo = myPageService.enquiryCheck(commandMap.getMap());
		System.out.println(orderInfo+" ");
		
		mav.addObject("O",orderInfo);
		mav.setViewName("enquiryCheck");
		return mav;
	}
	
	@RequestMapping(value="/enquiryModify")
	public ModelAndView enquirymodify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> enquiryModifyForm = myPageService.enquiryModifyForm(commandMap.getMap());
		
		mav.addObject("O",enquiryModifyForm);
		mav.setViewName("enquiryModify");
		return mav;
	}
	
	@RequestMapping(value="/enquiryModify" ,method = RequestMethod.POST )
	public ModelAndView enquirymodify1(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		myPageService.enquiryModify(commandMap.getMap());
		
		HttpSession session = request.getSession();
		String MEMBER_ID = (String) session.getAttribute("MEMBER_ID");
		mav.addObject("MEMBER_ID",MEMBER_ID);
		commandMap.put("MEMBER_ID", MEMBER_ID);
		
		List<Map<String, Object>> orderInfo = myPageService.enquiryCheck(commandMap.getMap());
		System.out.println(orderInfo+" ");
		
		mav.addObject("O",orderInfo);
		mav.setViewName("enquiryCheck");
		return mav;
	}
	
	@RequestMapping(value="/qnaCheck")
	public ModelAndView qnaCheck(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();

		List<Map<String, Object>> qnaCheck = myPageService.qnaCheck(commandMap.getMap());
		System.out.println(qnaCheck);
		mav.addObject("O",qnaCheck);
		mav.setViewName("qnaCheck");
		return mav;
	}
	
	
	
	@RequestMapping(value="/qnaDelete")
	public ModelAndView qnaDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		myPageService.qnaDelete(commandMap.getMap());
		
		List<Map<String, Object>> qnaCheck = myPageService.qnaCheck(commandMap.getMap());
		System.out.println(qnaCheck);
		mav.addObject("O",qnaCheck);
		mav.setViewName("qnaCheck");
		return mav;
	}
	
	@RequestMapping(value="/qnaModify")
	public ModelAndView qnaModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> qnaModify = myPageService.qnaModifyForm(commandMap.getMap());
		
		mav.addObject("O",qnaModify);
		mav.setViewName("qnaModify");
		return mav;
	}
	
	@RequestMapping(value="/qnaModify" ,method = RequestMethod.POST )
	public ModelAndView qnaModify1(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		 final String filePath =  "C:\\java\\stsApp\\ELTRUT\\src\\main\\webapp\\file\\qnaFile\\";
		 MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

	      if (multipartHttpServletRequest.getFile("CS_IMAGE1").getOriginalFilename() != "") {
	         MultipartFile file = multipartHttpServletRequest.getFile("CS_IMAGE1");
	         String fileName = "CS_IMAGE" + commandMap.get("CS_NUMBER").toString();
	        
	         String IMAGEExtension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
	         System.out.println(IMAGEExtension);
	         
	         File file1 = new File(filePath);
	         if (file1.exists() == false) {
	            file1.mkdirs(); // 폴더가 존재하지 않으면 폴더 생성
	         }

	         File uploadFile = new File(filePath + fileName + IMAGEExtension);
	         System.out.println(uploadFile);
	         try {
	        	 file.transferTo(uploadFile);
	         } catch (Exception e) {

	         }
	         commandMap.put("CS_IMAGE1", fileName + IMAGEExtension);
	      }else {
	    	  commandMap.put("CS_IMAGE1","null");
	    	  //전달되는 이미지가없을경우 null로?? 전달
	      }
	   
		myPageService.qnaModify(commandMap.getMap());
		
		List<Map<String, Object>> qnaCheck = myPageService.qnaCheck(commandMap.getMap());
		System.out.println(qnaCheck);
		mav.addObject("O",qnaCheck);
		mav.setViewName("qnaCheck");
		return mav;
	}
	
}
