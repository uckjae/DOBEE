package com.dobee.handler;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;

import com.dobee.dao.UserDao;
import com.dobee.vo.member.User;

@Controller
public class LoginHandler extends SavedRequestAwareAuthenticationSuccessHandler
		implements AuthenticationSuccessHandler {

	@Autowired
    private SqlSession sqlsession;
	
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
            throws IOException, ServletException {
        UserDao userDao = sqlsession.getMapper(UserDao.class);
        String url = getReturnUrl(request,response);
                
        Object obj = auth.getPrincipal();
        String mail = auth.getName();
        User user = userDao.getUser(mail);
        
        // 로그인 시 출 퇴근 여부확인 (null => 퇴근 완료 // attSeq not null => 출근 완료)		0126 게다죽
        if(user.getAuthCode() != 1) {
	        String isWork = userDao.isWork(auth.getName());
	        user.setIsWork(isWork);
        }
        
        request.getSession().setAttribute("user", user);
        if(user.getAuthCode() == 1){// ADMIN
            response.sendRedirect("adminWarnig.do");
        	//response.sendRedirect(request.getSession().getServletContext().getContextPath()+"/admin/");
        }else if(user.getAuthCode() == 2 || user.getAuthCode() == 3){//USER, PM
        	response.sendRedirect("main.do");
        }else {
        	response.sendRedirect(url);
        }
    }
 
    
    public void forward(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
        requestDispatcher.forward(request, response);
    }
    
    
    private String getReturnUrl(HttpServletRequest request, HttpServletResponse response) {
        RequestCache requestCache = new HttpSessionRequestCache();
        SavedRequest savedRequest = requestCache.getRequest(request, response);
        if (savedRequest == null) {
            return request.getSession().getServletContext().getContextPath();
        }
        return savedRequest.getRedirectUrl();
    }
    
}
