package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ddosirak.domain.InboundVO;
import com.ddosirak.domain.OrderVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.persistance.InboundDAO;

@Service
public class InboundServiceImpl implements InboundService {

	@Inject
	InboundDAO idao; //의존성 주입
	
	@Override
	public void insertInbound(InboundVO vo) {
		idao.insertInbound(vo);

	}//입고예정서 등록

	@Override
	public List<InboundVO> inboundAllList(PageVO vo) {
		List<InboundVO> inboundList = idao.inboundAllList(vo);
		return inboundList;
	}//입고리스트

	@Override
	public int updateOrderState(String order_number) {
		// TODO Auto-generated method stub
		return idao.updateOrderState(order_number);
	}//입고등록시 발주서상태변경

	@Override
	public int updateInProcess(InboundVO vo) {

		return idao.updateInProcess(vo);
	}

	@Override
	public int deleteInbound(String in_id) {
		
		return idao.deleteInbound(in_id);
	}

	@Override
	public String getOrderNumber(String in_id) {
		
		return idao.getOrderNumber(in_id);
	}

	@Override
	public int updateOrderStateToDefault(String order_number) {
	
		return idao.updateOrderStateToDefault(order_number);
	}

	@Override
	public void updateInbound(InboundVO vo) {
		idao.updateInbount(vo);
		
	}

	@Override
	public void updateMatrial(Map param) {
		idao.updateMatrial(param);
		
	}

	@Override
	public Integer selectNowIndate() {
		return idao.selectNowIndate();
	}

	@Override
	public Integer selectNowEdate() {
		return idao.selectNowEdate();
	}

}
