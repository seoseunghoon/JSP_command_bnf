package com.jsp.listener;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.jsp.context.ApplicationContextLoader;

public class ApplicationContextLoaderListener implements ServletContextListener {
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {}

	@Override
	public void contextInitialized(ServletContextEvent ctxEvent) {
		ServletContext ctx = ctxEvent.getServletContext();
    	String beanConfigXml = ctx.getInitParameter("contextConfigLocation");
    	beanConfigXml =  ctx.getRealPath("/") + beanConfigXml.replace("classpath:", "WEB-INF/classes/").replace("/", File.separator);
    	
    	try {
			ApplicationContextLoader.build(beanConfigXml);			
		} catch (Exception e) {	
			e.printStackTrace();
		}
	}
}
