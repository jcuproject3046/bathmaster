package com.path.spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class ContextHolder implements ApplicationContextAware {
     
	private static ApplicationContext context;

	public void setApplicationContext(ApplicationContext ctx) {
		if (context == null)
			context = ctx;
		else
			throw new RuntimeException("ApplicationContext already inited!");
	}

	public static ApplicationContext getApplicationContext() {
	    return context;
	}
	  

}
