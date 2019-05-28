package com.saurabh.demo.spring.service.accountservice.biz;

public class Response<T> {
	
	private String instance;
	private T body;
	
	public Response(String instance, T body) {
		super();
		this.instance = instance;
		this.body = body;
	}

	public String getInstance() {
		return instance;
	}

	public T getBody() {
		return body;
	}
	
	
	
}