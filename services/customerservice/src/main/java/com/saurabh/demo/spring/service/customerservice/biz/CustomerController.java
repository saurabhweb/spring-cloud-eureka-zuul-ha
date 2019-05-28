package com.saurabh.demo.spring.service.customerservice.biz;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CustomerController {

	@Value("${server.port}")
	private String port;
	
	@GetMapping("/{id}")
	public Response<Map<String, String>> get(@PathVariable("id") long id) {
		Map<String, String> map = new HashMap<> ();
		//map.put(id+"", System.currentTimeMillis()+"");
		map.put("customerId", new Random().nextInt()+"");
		return new Response<> (port, map);
	}
}