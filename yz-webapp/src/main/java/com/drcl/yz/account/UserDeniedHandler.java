package com.drcl.yz.account;

import java.io.IOException;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.access.AccessDeniedHandlerImpl;
import org.springframework.security.web.authentication.session.SessionAuthenticationStrategy;

public class UserDeniedHandler implements SessionAuthenticationStrategy{

	private Properties customTargetUrl;
	private String defaultTargetUrl;
	public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException)
    throws IOException, ServletException {

	        // Put exception into request scope (perhaps of use to a view)
	        request.setAttribute(WebAttributes.ACCESS_DENIED_403, accessDeniedException);
	
	        // Set the 403 status code.
	        response.setStatus(HttpServletResponse.SC_FORBIDDEN);
	
	        // forward to error page.

	        String uri = request.getRequestURI(); 
	        Iterator iterator = customTargetUrl.keySet().iterator();
	        System.out.println(uri);
        	while(iterator.hasNext()){
        		String key = (String) iterator.next();
        		System.out.println(key);
        		if(uri!= null && uri.contains(key)){
        			defaultTargetUrl = customTargetUrl.getProperty(key);
	        		break;
        		}
        	}
	  
	        response.sendRedirect(defaultTargetUrl);

	}
	
	public void onAuthentication(Authentication authentication, HttpServletRequest request, HttpServletResponse response){
		System.out.println("-----------====---------------------------");
		System.out.println(defaultTargetUrl);
	}
	
	public Properties getCustomTargetUrl() {
		return customTargetUrl;
	}

	public void setCustomTargetUrl(Properties customTargetUrl) {
		this.customTargetUrl = customTargetUrl;
	}

	public String getDefaultTargetUrl() {
		return defaultTargetUrl;
	}

	public void setDefaultTargetUrl(String defaultTargetUrl) {
		this.defaultTargetUrl = defaultTargetUrl;
	}
	
	
}
