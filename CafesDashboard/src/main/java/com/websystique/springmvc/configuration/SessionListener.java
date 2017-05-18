package com.websystique.springmvc.configuration;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.websystique.springmvc.services.UsersService;

/**
 * This class represent session management to invalidate session after certain
 * time
 * 
 * @author lenovo
 *
 */
public class SessionListener implements HttpSessionListener {

    /**
     * set inactive timeout
     */
    @Override
    public void sessionCreated(HttpSessionEvent se) {
	System.out.println("Inactive for 15 minute");
	se.getSession().setMaxInactiveInterval(15 * 60);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {

	System.out.println(se.getSession().getId());
	System.out.println("good bye session");

	ApplicationContext ctx = WebApplicationContextUtils
		.getWebApplicationContext(se.getSession().getServletContext());

	UsersService userService = (UsersService) ctx.getBean("usersService");

	userService.updateLogout(se.getSession().getId());
    }

}
