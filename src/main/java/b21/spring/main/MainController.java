package b21.spring.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import b21.spring.eltrut.CommandMap;
@Controller
public class MainController {

	@Resource(name="mainService")
	private MainService mainService;
	
	@RequestMapping("/main")
	public ModelAndView main(CommandMap commandMap) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<Map<String,Object>>goods = mainService.goodsList(commandMap.getMap());
		mav.setViewName("main");
		mav.addObject("goods", goods);
		return mav;
	}
}
