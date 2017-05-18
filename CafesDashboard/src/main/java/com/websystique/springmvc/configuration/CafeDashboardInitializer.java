package com.websystique.springmvc.configuration;

import javax.servlet.Filter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class CafeDashboardInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
	return new Class[] { DashboardCafesConfiguration.class };
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
	return null;
    }

    @Override
    protected String[] getServletMappings() {
	return new String[] { "/" };
    }

    @Override
    protected Filter[] getServletFilters() {
	Filter[] singleton = { new CORSFilter() };
	return singleton;
    }

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
	super.onStartup(servletContext);
	servletContext.addListener(new SessionListener());
    }

}