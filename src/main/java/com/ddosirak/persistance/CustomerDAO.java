package com.ddosirak.persistance;

import java.util.List;

import com.ddosirak.domain.CustomerVO;
import com.ddosirak.domain.PageVO;

public interface CustomerDAO {
	public List<CustomerVO> customerList(PageVO vo); //거래처목록
	
	public List<CustomerVO> serchCusname(PageVO vo); //거래처 이름검색 목록
	
	public CustomerVO customerDetail(String cus_id); //거래처 상세목록

	public void insertCustomer(CustomerVO vo); //거래처등록
	
	public void updateCustomer(CustomerVO vo); //거래처 수정
	
	public void deleteCustomer(String cus_id); //거래처 삭제
	
	public Integer selectCusNumber(String cus_number); //사업자번호 조회
	
}
