package com.saurabh.demo.spring.service.accountservice.biz;

public class Account {
	private Long id;
	private String number;
	private Long customerId;

	public Account() {

	}
	
	public Account(Long id, String number, Long customerId) {
		this.id = id;
		this.number = number;
		this.customerId = customerId;
	}

	public Long getId() {
		return id;
	}

	public void setId(long id) {
		this.id=id;
	}
	
	public String getNumber() {
		return number;
	}

	public Long getCustomerId() {
		return customerId;
	}
	
}
