package com.dobee.controller;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dobee.services.DebitService;
import com.dobee.services.ReceiptService;

@Controller
@RequestMapping("ajax/receipt/**")
public class AjaxController_Reciept {
	
	@Autowired
	private ReceiptService receiptService;
	
	@Autowired
	private DebitService debitService;
	
	
	//영수증 파일 업로드 
	@RequestMapping(value="/fileUploadAjax.do", method=RequestMethod.POST)
	public ModelAndView fileUploadAjax(MultipartHttpServletRequest mRequest) throws UnsupportedEncodingException {
		List<String> list = receiptService.fileUpload(mRequest);

		ModelAndView mav = new ModelAndView();
		try {
			if(list.get(0).equals("true")) {
				mav.addObject("result", "success");
				mav.addObject("uploadPath", list.get(1));
				mav.addObject("saveFileName", list.get(2));
			} else {
				mav.addObject("result", "fail");
				
			}
			mav.setViewName("jsonView");
			
		}catch (Exception e) {
			System.out.println(e);
		}
		
		return mav;
	}
	
	
	//영수증 등록_현재 사용자 이메일 불러오기
   	@RequestMapping("nowEmpEmail.do") 
   	@ResponseBody 
   	public String currentEmpEmail(Principal principal) { 
   		return principal.getName(); 
   	}
   	
    //영수증등록_현재 법인카드 목록 아작스로 불러다주기
    @RequestMapping(value="cardListtoReceipt.do", method=RequestMethod.POST)
    @ResponseBody
    public List cardList() {
    	List debitList = debitService.listDebit();
    	return debitList;
    }
    
    
    //영수증 등록_ 비용항목 선택 아작스로 불러다주기
    @RequestMapping("debitCodeList.do")
    @ResponseBody
    public List costCodeList() {
    	List listCodes = debitService.listCode();
    	return listCodes;
    }
	
}
