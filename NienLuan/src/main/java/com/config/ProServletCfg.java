package com.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan("com")
public class ProServletCfg implements WebMvcConfigurer{
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		    registry.addResourceHandler("/common/**").addResourceLocations("/common/");
	        registry.addResourceHandler("/style/**").addResourceLocations("/style/");
	        registry.addResourceHandler("/resource/**").addResourceLocations("/resource/");
	    }

	@Bean(name="viewResolver")
	public InternalResourceViewResolver getVR() {
		InternalResourceViewResolver vr= new InternalResourceViewResolver();
		vr.setPrefix("/WEB-INF/views/");
		vr.setSuffix(".jsp");
		
		return vr;
	}
	

}
