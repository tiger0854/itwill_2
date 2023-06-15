package com.ddosirak.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ddosirak.domain.WarehouseVO;
import com.ddosirak.persistance.WarehouseDAO;

@Service
public class WarehouseServiceImpl implements WarehouseService {
	@Inject
	private WarehouseDAO dao;
	
	public static final Logger logger = LoggerFactory.getLogger(WarehouseServiceImpl.class);
	
	//창고 목록
	@Override
	public List<WarehouseVO> warehouseList() {
		logger.debug("dao : warehouselist 호출");
		List<WarehouseVO> voList=dao.whList();
		logger.debug("voList의 개수 : "+voList.size());
		return voList;
	}
	
	//창고 등록
	@Override
	public Integer insertwh(WarehouseVO vo) {
		logger.debug("service : 창고 등록 호출");
		int result=dao.insertWh(vo);
		logger.debug("sevice : 창고 등록 완료");
		return result;
	}
	
	//창고 수정
	@Override
	public Integer updatewh(WarehouseVO vo) {
		logger.debug("service : 창고 수정 호출");
		int result=dao.updateWh(vo);
		logger.debug("sevice : 창고 수정 완료");
		return result;
	}

	@Override
	public WarehouseVO editwh(String wh_code) {
		logger.debug("service : editwh 호출");
		WarehouseVO result=dao.editwh(wh_code);
		logger.debug("result : "+result);
		return result;
	}

	@Override
	public void deletewh(String wh_code) {
		logger.debug("service: deletewh 호출");
		dao.deletewh(wh_code);
		
	}

}
