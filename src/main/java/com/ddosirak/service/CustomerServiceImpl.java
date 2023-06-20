package com.ddosirak.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ddosirak.domain.CustomerVO;
import com.ddosirak.persistance.CustomerDAO;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Inject
	CustomerDAO cdao;
	
	@Override
	public List<CustomerVO> customerList() {
	
		return cdao.customerList();
	}

	@Override
	public void insertCustomer(CustomerVO vo) {
		cdao.insertCustomer(vo);
		
	}

	@Override
	public void updateCustomer(CustomerVO vo) {
		cdao.updateCustomer(vo);
		
	}

	@Override
	public void deleteCustomer(String cus_id) {
		cdao.deleteCustomer(cus_id);
		
	}

}
