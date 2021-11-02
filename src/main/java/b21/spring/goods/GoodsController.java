package b21.spring.goods;

import java.io.File;
import java.util.HashMap;
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
public class GoodsController {

	 @Resource(name = "goodsService")
	   private GoodsService goodsService;

	 
	 @RequestMapping(value = "goodsDetail")
	   public ModelAndView goodsDetail(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request,
	         HttpSession session) throws Exception {

	      ModelAndView mv = new ModelAndView();

	      // 상품정보 가져오기
	      Map<String, Object> goodsDetail = goodsService.selectOneGoods(commandMap.getMap());
	      mv.addObject("goodsDetail", goodsDetail);
	      mv.setViewName("goods/goodsDetail");
	      return mv;
	   }
	 

	 

}
