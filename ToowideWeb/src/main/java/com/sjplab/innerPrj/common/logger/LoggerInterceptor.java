package com.sjplab.innerPrj.common.logger;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sjplab.innerPrj.common.common.Member;
import com.sjplab.innerPrj.common.logger.LoggerInterceptor;

public class LoggerInterceptor extends HandlerInterceptorAdapter {
	protected Log log = LogFactory.getLog(LoggerInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("======================================          START         ======================================");
			log.debug(" Request URI \t:  " + request.getRequestURI());
		}
		
		if( request.getRequestURI().contains("login.do")){
			log.debug("======================================   request uri login.do so go pass  ==========================");
			return super.preHandle(request, response, handler);
		}
		
		//login check
		HttpSession session = request.getSession(false);
		
		if(session == null){
			log.debug("======================================   session null     redirect  index.jsp    ==========================");
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			return false;
		}
		
		Member member =  (Member)session.getAttribute("member");
		
		if(member == null){
			log.debug("======================================   member null     redirect  index.jsp    ==========================");
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			return false;
		}
		//login check end
		
		log.debug(" ***** employee_num: " + member.getEmployee_num());
		log.debug(" ***** member_name: " + member.getMember_name());
		log.debug(" ***** email_addr: " + member.getEmail_addr());
		log.debug(" ***** team_name: " + member.getTeam_name());
		log.debug(" ***** position: " + member.getPosition());
		
		
		return super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		if (log.isDebugEnabled()) {
			log.debug("======================================           END          ======================================\n");
		}
	}
}