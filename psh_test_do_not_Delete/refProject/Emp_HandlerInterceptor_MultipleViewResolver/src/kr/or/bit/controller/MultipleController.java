package kr.or.bit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MultipleController {
	@RequestMapping("/multiple.do")
	public ModelAndView multiple() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("multiple");
		mav.addObject("multi", "xml¿ª ≈¿¿ª±Ó?");
		
		return mav;
	}
}
