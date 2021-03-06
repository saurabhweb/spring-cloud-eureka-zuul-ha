package com.saurabh.demo.spring.service.accountservice;

import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableEurekaClient
@EnableFeignClients
public class AccountServiceApplication 
{
    public static void main( String[] args ) {
    	new SpringApplicationBuilder(AccountServiceApplication.class).web(WebApplicationType.SERVLET).run(args);
    }
}
