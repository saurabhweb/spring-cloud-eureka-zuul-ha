package com.saurabh.demo.spring.service.customerservice;

import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableEurekaClient
@EnableFeignClients
public class CustomerServiceApplication 
{
    public static void main( String[] args ) {
    	new SpringApplicationBuilder(CustomerServiceApplication.class).web(WebApplicationType.SERVLET).run(args);
    }
}