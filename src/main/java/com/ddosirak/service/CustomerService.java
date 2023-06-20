package com.ddosirak.service;

import java.util.List;

import com.ddosirak.domain.CustomerVO;

public interface CustomerService {
		
	public List<CustomerVO> customerList(); //거래처목록
	
	public void insertCustomer(CustomerVO vo); //거래처등록
	
	public void updateCustomer(CustomerVO vo); //거래처 수정
	
	public void deleteCustomer(String cus_id); //거래처 삭제
}
