package com.kbstar;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Value("${imgdir}") // application.properties 안에 지정함
    String imgdir;
    @Value("${logdir}") // application.properties 안에 지정함
    String logdir;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // c 경로로 되어 있는 것도 127.0.0.1/logs 하면 접속이 되게끔 한다.
        registry.addResourceHandler("/uimg/**").addResourceLocations(imgdir);
        registry.addResourceHandler("/logs/**").addResourceLocations(logdir);

    }

}