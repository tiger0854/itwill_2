package com.ddosirak.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ddosirak.domain.CustomerVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.persistance.CustomerDAO;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Inject
	CustomerDAO cdao;
	
	@Override
	public List<CustomerVO> customerList(PageVO vo) {
	
		return cdao.customerList(vo);
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

	@Override
	public CustomerVO customerDetail(String cus_id) {
		// TODO Auto-generated method stub
		return cdao.customerDetail(cus_id);
	}

	@Override
	public Integer selectCusNumber(String cus_number) {
		
		return cdao.selectCusNumber(cus_number);
	}

	@Override
	public List<CustomerVO> customerALL() {
		// TODO Auto-generated method stub
		return cdao.customerALL();
	}


}
