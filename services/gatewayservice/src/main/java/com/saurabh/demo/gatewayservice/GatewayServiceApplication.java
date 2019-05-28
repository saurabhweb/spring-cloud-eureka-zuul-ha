package com.saurabh.demo.gatewayservice;

import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

// service-parent $curl http://localhost:9001/api/account/1

@SpringBootApplication
@EnableEurekaClient
@EnableZuulProxy
public class GatewayServiceApplication 
{
    public static void main( String[] args ) {
    	new SpringApplicationBuilder(GatewayServiceApplication.class).web(WebApplicationType.SERVLET).run(args);
    }
}
