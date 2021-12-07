package com.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

public class thaythewebxml implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		
		AnnotationConfigWebApplicationContext appcontext = new AnnotationConfigWebApplicationContext();
		appcontext.register(ProServletCfg.class);
//		appcontext.setServletContext(servletContext);
		ServletRegistration.Dynamic dispatcher = servletContext.addServlet("dispatcher",
				new DispatcherServlet(appcontext));

		dispatcher.setLoadOnStartup(1);
		dispatcher.addMapping("/");
		servletContext.addFilter("SitemeshFilter", com.opensymphony.module.sitemesh.filter.PageFilter.class).addMappingForServletNames(null, false, "dispatcher");
	}

}
//public void onStartup(ServletContext container) throws ServletException {
//AnnotationConfigWebApplicationContext ctx= new AnnotationConfigWebApplicationContext();
//ctx.register(ProjectCof.class);
//ctx.setServletContext(container);
//ServletRegistration.Dynamic servlet=container.addServlet("dispatcher", new DispatcherServlet(ctx));
//servlet.setLoadOnStartup(1);
//servlet.addMapping("/");
//
//}