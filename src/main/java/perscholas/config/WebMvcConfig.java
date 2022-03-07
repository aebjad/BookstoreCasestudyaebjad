package perscholas.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import perscholas.validation.getParameterInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Autowired
	private getParameterInterceptor getParameter;

	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(getParameter);

	}
}