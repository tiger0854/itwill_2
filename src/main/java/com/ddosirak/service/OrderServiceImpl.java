package com.ddosirak.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ddosirak.domain.ItemRecipeVO;
import com.ddosirak.domain.OrderVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.RequestVO;
import com.ddosirak.persistance.EmployeeDAO;
import com.ddosirak.persistance.OrderDAO
;
@Service
public class OrderServiceImpl implements OrderService{

	@Inject
	private OrderDAO odao ; // 의존성 주입

	@Override
	public void insertOrder(OrderVO vo) {
		odao.insertOrder(vo);
		
	}

	@Override
	public List<OrderVO> orderAllList(PageVO vo) {
		List<OrderVO> orderList = odao.orderAllList(vo);
		return orderList;
	}

	@Override
	public Integer updateOrder(OrderVO vo) {
		return  odao.updateOrder(vo);
	}

	@Override
	public Integer deleteOrder(String order_number) {

		return odao.deleteOrder(order_number);
	}

	@Override
	public List<RequestVO> getRequestList(PageVO vo) {

		return odao.getRequestList(vo);
	}

	@Override
	public int updateRequestStat(RequestVO vo) {
		return odao.updateRequestStat(vo);
		
	}
}
