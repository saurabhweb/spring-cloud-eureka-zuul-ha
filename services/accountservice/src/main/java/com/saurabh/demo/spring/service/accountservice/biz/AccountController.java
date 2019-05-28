package com.saurabh.demo.spring.service.accountservice.biz;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AccountController {

	@Value("${server.port}")
	private String port;
	
	@Autowired
	private CustomerClient customerClient;
	
	@GetMapping("/{id}")
	public Response<Account> get(@PathVariable("id") long id) {
		return new Response<>(port, new Account(id, new Random().nextInt()+"", new Random().nextLong()));
	}
	
	@GetMapping("/map/{id}")
	public Response<Map<String, String>> getMap(@PathVariable("id") long id) {
		Map<String, String> map = new HashMap<> ();
		//map.put(id+"", System.currentTimeMillis()+"");
		map.put("accountId", id+"");
		map.put("accountNum", new Random().nextInt()+"");
		map.put("customerId", new Random().nextLong()+"");
		
		Response<Map<String, String>> customerResponse = customerClient.get(id);
		
		Map<String, String> customerMap = customerResponse.getBody();
		map.putAll(customerMap);
		map.put("customerPort", customerResponse.getInstance());
		return new Response<> (port, map);
		
		//return new Response<>(port, new Account(id, new Random().nextInt()+"", new Random().nextLong()));
	}
	
}
