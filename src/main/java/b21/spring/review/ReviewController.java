package b21.spring.review;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import b21.spring.eltrut.CommandMap;

@Controller
public class ReviewController {
	
	 @Resource(name = "reviewService")
	   private ReviewService reviewService;
	
	 @RequestMapping(value = "goodsReview")
	   public ModelAndView goodsReview(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request,
	         HttpSession session) throws Exception {

	      ModelAndView mv = new ModelAndView();
	      System.out.println(commandMap.getMap());
	      
	     
	      mv.addObject("G",commandMap.getMap());
	      // 상품정보 가져오기
	      List<Map<String, Object>> goodsReview = reviewService.goodsReview(commandMap.getMap());
	      
	      System.out.println(goodsReview);
	      mv.addObject("message",commandMap.get("message"));
	      mv.addObject("goodsReview", goodsReview);
	      mv.setViewName("goodsReview");
	      return mv;
	   }
	 
	 @RequestMapping(value = "/reviewModify")
	   public ModelAndView reviewSelect(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request,
	         HttpSession session) throws Exception {

	      ModelAndView mv = new ModelAndView();

	      // 상품정보 가져오기
	      Map<String, Object> reviewSelect = reviewService.reviewSelect(commandMap.getMap());
	      
	      System.out.println(reviewSelect);
	      mv.addObject("goodsReview", reviewSelect);
	      mv.setViewName("reviewModify");
	      return mv;
	   }
	 
	 @RequestMapping(value = "/reviewModify" ,method = RequestMethod.POST)
	 public ModelAndView reviewModify1(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request,
			 HttpSession session) throws Exception {
		 
		 System.out.println(commandMap.getMap());
		 ModelAndView mav = new ModelAndView();
		 final String filePath =  "C:\\JAVA\\stsApp\\ELTRUT\\src\\main\\webapp\\file\\reviewFile\\";
		 MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

	      if (multipartHttpServletRequest.getFile("REVIEW_IMAGE").getOriginalFilename() != "") {
	         MultipartFile file = multipartHttpServletRequest.getFile("REVIEW_IMAGE");
	         String fileName = "REVIEW_IMAGE" + commandMap.get("REVIEW_NUMBER").toString();
	        
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
	         commandMap.put("REVIEW_IMAGE", fileName + IMAGEExtension);
	      }else {
	    	  commandMap.put("REVIEW_IMAGE","null");
	    	  //전달되는 이미지가없을경우 null로 전달 그렇지않으면 원하는 에러생김,,
	      }
	      reviewService.reviewModify(commandMap.getMap());
	      
		   mav.addObject("GOODS_NUMBER",commandMap.get("GOODS_NUMBER"));
		   mav.setViewName("redirect:/goodsReview");
	      return mav;
	 }
	 @RequestMapping(value = "/reviewDelete")
	   public ModelAndView reviewDelete(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request,
	         HttpSession session) throws Exception {
		 
		  System.out.println(commandMap.getMap()); 
		 
	      ModelAndView mv = new ModelAndView();
	      reviewService.reviewDelete(commandMap.getMap());
	      
		   mv.addObject("GOODS_NUMBER",commandMap.get("GOODS_NUMBER"));
		   mv.setViewName("redirect:/goodsReview");
	      return mv;
	   }
	 
	 @RequestMapping(value = "reviewInsert")
	   public ModelAndView reviewInsert(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request
	         ) throws Exception {
		   ModelAndView mv = new ModelAndView();
	      
		   
		   HttpSession session=request.getSession();
			String MEMBER_ID=(String) session.getAttribute("MEMBER_ID");
				System.out.println("***********************************************\n"+MEMBER_ID);
				mv.addObject("MEMBER_ID",MEMBER_ID);
				commandMap.put("MEMBER_ID", MEMBER_ID);
				mv.addObject("GOODS_NUMBER",commandMap.get("GOODS_NUMBER"));
				
			  Map<String, Object> reviewInsertCheck = reviewService.reviewInsertCheck(commandMap.getMap());
			  
			  if(reviewInsertCheck==null ) {
	    	  mv.addObject("message", "상품을 구매하지않았거나, 상품이 배송완료된 상태가 아닙니다.");
	    	  System.out.println("==================");
				/* mv.setViewName("/goods/goodsReview"); */
	    	  mv.setViewName("redirect:/goodsReview");
	    	  
	    	  List<Map<String, Object>> goodsReview = reviewService.goodsReview(commandMap.getMap());
		      mv.addObject("goodsReview", goodsReview);
	    	  return mv;
			  }
	      mv.addObject("review", reviewInsertCheck);
	      mv.setViewName("reviewInsert");
	      return mv;
	   }
	 
	 @RequestMapping(value = "/reviewInsert" ,method = RequestMethod.POST)
	   public ModelAndView reviewInsert1(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request
	         ) throws Exception {
		   ModelAndView mv = new ModelAndView();
		  
		   Map<String, Object> id = reviewService.reviewNumber(commandMap.getMap());
		   
		   Object REVIEW_NUMBER = (Object) id.get("REVIEW_NUMBER"); 
		   
		   commandMap.put("REVIEW_NUMBER", REVIEW_NUMBER);
		   
		   
		   System.out.println("1111111111111111111111111111111111111111");
			/* System.out.println(request.getParameter("REVIEW_NUMBER")); */
		   System.out.println(commandMap.getMap());
		   
		   final String filePath =  "C:\\JAVA\\stsApp\\ELTRUT\\src\\main\\webapp\\file\\reviewFile\\";
			 MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

		      if (multipartHttpServletRequest.getFile("REVIEW_IMAGE").getOriginalFilename() != "") {
		         MultipartFile file = multipartHttpServletRequest.getFile("REVIEW_IMAGE");
		         String fileName = "REVIEW_IMAGE" + commandMap.get("REVIEW_NUMBER").toString();
		        
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
		         commandMap.put("REVIEW_IMAGE", fileName + IMAGEExtension);
		      }else {
		    	  commandMap.put("REVIEW_IMAGE","null");
		    	  //전달되는 이미지가없을경우 null로?? 전달
		      }

		   
		   System.out.println(commandMap.getMap());
		   
		   reviewService.reviewInsert(commandMap.getMap());
		   
		   List<Map<String, Object>> goodsReview = reviewService.goodsReview(commandMap.getMap());
		   mv.addObject("goodsReview", goodsReview);
		   
		   mv.addObject("GOODS_NUMBER",commandMap.get("GOODS_NUMBER"));
		   mv.setViewName("redirect:/goodsReview");

		   return mv;
	 }
	 
	 
	 //QNA 시작
	 @RequestMapping(value = "goodsQna")
	   public ModelAndView goodsQna(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request,
	         HttpSession session) throws Exception {

	      ModelAndView mv = new ModelAndView();

	      mv.addObject("Q",commandMap.getMap());
	      // 상품정보 가져오기
	      List<Map<String, Object>> goodsQna = reviewService.goodsQna(commandMap.getMap());
	      
	      System.out.println(goodsQna);
	      mv.addObject("goodsQna", goodsQna);
	      mv.setViewName("goodsQna");
	      return mv;
	   }
	 
	 
	 //QNA 삭제
	 @RequestMapping(value = "/goodsQnaDelete")
	   public ModelAndView qnaDelete(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request,
	         HttpSession session) throws Exception {
		 
		  System.out.println(commandMap.getMap()); 
		 
	      ModelAndView mv = new ModelAndView();
	      reviewService.goodsQnaDelete(commandMap.getMap());
	      

	      mv.addObject("GOODS_NUMBER", commandMap.get("GOODS_NUMBER"));
	      mv.setViewName("redirect:/goodsQna");
	      return mv;
	   }
	 
	 @RequestMapping(value = "goodsQnaModify")
	   public ModelAndView goodsQnaModify(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request,
	         HttpSession session) throws Exception {

	      ModelAndView mv = new ModelAndView();

	      // 상품정보 가져오기
	      Map<String, Object> goodsQna = reviewService.qnaSelect(commandMap.getMap());
	      
	      System.out.println(goodsQna);
	      mv.addObject("O", goodsQna);
	      mv.setViewName("goodsQnaModify");
	      return mv;
	   }
	 
	 @RequestMapping(value = "/goodsQnaModify",method = RequestMethod.POST)
	   public ModelAndView goodsQnaModify0(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request,
	         HttpSession session) throws Exception {
		 
		 ModelAndView mav = new ModelAndView();
		 
		 System.out.println(commandMap.getMap());
		 final String filePath =  "C:\\JAVA\\stsApp\\ELTRUT\\src\\main\\webapp\\file\\qnaFile\\";
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
	   
		reviewService.goodsQnaModify(commandMap.getMap());

	      System.out.println(commandMap.get("GOODS_NUMBER"));

	      mav.addObject("GOODS_NUMBER",commandMap.get("GOODS_NUMBER"));
	      mav.setViewName("redirect:/goodsQna");
	      return mav;
	   }
	 
	 @RequestMapping(value = "/goodsQnaInsert")
	   public ModelAndView goodsQnaInsert(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request
	         ) throws Exception {
		   ModelAndView mv = new ModelAndView();
	      
		  System.out.println(commandMap.get("GOODS_NUMBER")); 
		    
		  mv.addObject("GOODS_NUMBER",commandMap.get("GOODS_NUMBER"));
	      mv.setViewName("goodsQnaInsert");
	      return mv;
	   }
	 
	 
	 @RequestMapping(value = "/goodsQnaInsert", method = RequestMethod.POST)
	 public ModelAndView goodsQnaInsert0(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request
			 ) throws Exception {
		  ModelAndView mv = new ModelAndView();
		  
		   Map<String, Object> id = reviewService.qnaNumber(commandMap.getMap());
		   
		   Object CS_NUMBER = (Object) id.get("CS_NUMBER"); 
		   
		   commandMap.put("CS_NUMBER", CS_NUMBER);
		   
		   System.out.println(commandMap.getMap());
		   
		   
		   final String filePath =  "C:\\JAVA\\stsApp\\ELTRUT\\src\\main\\webapp\\file\\qnaFile\\";
			 MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

		      if (multipartHttpServletRequest.getFile("CS_IMAGE1").getOriginalFilename() != "") {
		         MultipartFile file = multipartHttpServletRequest.getFile("CS_IMAGE1");
		         String fileName = "CS_IMAGE1" + commandMap.get("CS_NUMBER").toString();
		        
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

		   
		   System.out.println(commandMap.getMap());
		   
		   reviewService.goodsQnaInsert(commandMap.getMap());
		   
		   Map<String, Object> number = commandMap.getMap();
		   mv.addObject("GOODS_NUMBER",number.get("GOODS_NUMBER"));
		   mv.setViewName("redirect:/goodsQna");

		   return mv;
	 }
	 
	 
}
