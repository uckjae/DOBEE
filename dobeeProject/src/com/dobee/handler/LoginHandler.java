package com.dobee.handler;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.dobee.dao.MemberDao;
import com.dobee.vo.member.User;

public class LoginHandler extends SavedRequestAwareAuthenticationSuccessHandler
		implements AuthenticationSuccessHandler {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
  
			System.out.println(authentication.getName() +"     "+authentication.getAuthorities().toString());
  
			String email = "";
		  Enumeration params = request.getSession().getAttributeNames();
		  while(params.hasMoreElements()){
		     email = (String)params.nextElement();
		     System.out.println(email + " : " + request.getParameter(email) + "<br>");
		    }
		  
		  System.out.println("INFO : Skein-U202 - 로그인에 성공하였습니다.");
		  
		     request.getSession().removeAttribute("SPRING_SECURITY_LAST_EXCEPTION");
		     
		     MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
		     
		     HttpSession session = request.getSession();
		     User member = memberDao.login(email);
		     
		    
		  session.setAttribute("Member", member);
		  
		  
		        if (session != null) {
		            String redirectUrl = (String) session.getAttribute("prevPage");
		            if (redirectUrl != null) {
		                session.removeAttribute("prevPage");
		                getRedirectStrategy().sendRedirect(request, response, redirectUrl);
		            } else {
		                super.onAuthenticationSuccess(request, response, authentication);
		            }
		        } else {
		            super.onAuthenticationSuccess(request, response, authentication);
		        }
		     
		     
		     
		  
		  /*String url = request.getContextPath();
		  response.sendRedirect(url);*/
		}
	}
