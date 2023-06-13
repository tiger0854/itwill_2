package com.ddosirak.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ddosirak.persistance.EmployeeDAO;
import com.ddosirak.persistance.OrderDAO
;
@Service
public class OrderServiceImpl implements OrderService{

	@Inject
	private OrderDAO odao ; // 의존성 주입
}
