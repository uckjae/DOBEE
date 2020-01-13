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
	

	/*
     * @method Name : onAuthenticationSuccess
     * @Author : 권기엽
     * @description
     * 로그인을 성공하였으나, 회원상태가 임시 비밀번호 발급상태라면 비밀번호 변경창으로 유도.
    */
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
            throws IOException, ServletException {
    	System.out.println("LoginHandler_onAuthenticationSuccess Done!!");
        UserDao userDao = sqlsession.getMapper(UserDao.class);
        String url = getReturnUrl(request,response);
                
        String mail = request.getParameter("mail");

        User user = userDao.getUser(mail);
        
        request.getSession().setAttribute("user", user);
        System.out.println(user.toString());
        if(user.getAuthCode() == 1){// ADMIN
        	System.out.println("1번째 if");
            response.sendRedirect("adminWarnig.do");
        	//response.sendRedirect(request.getSession().getServletContext().getContextPath()+"/admin/");
        }else if(user.getAuthCode() == 2 || user.getAuthCode() == 3){//USER, PM
            System.out.println("2번째 if");
        	response.sendRedirect("main.do");
        }else {
        	System.out.println("3번째 if");
        	response.sendRedirect(url);
        }
    }
 
    public void forward(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException, IOException {
    	System.out.println("LoginHandler_forward Done!!");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
        requestDispatcher.forward(request, response);
    }
    
    /*
     * @method Name : getReturnUrl
     * @Author : 권기엽
     * @description
     * Security 를 타기 이전의 URL 을 기억하는 함수
    */
    private String getReturnUrl(HttpServletRequest request, HttpServletResponse response) {
    	System.out.println("LoginHandler_getReturnUrl Done!!");
        RequestCache requestCache = new HttpSessionRequestCache();
        SavedRequest savedRequest = requestCache.getRequest(request, response);
        if (savedRequest == null) {
            return request.getSession().getServletContext().getContextPath();
        }
        return savedRequest.getRedirectUrl();
    }
    
}
