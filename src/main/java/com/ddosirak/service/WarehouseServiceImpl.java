package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.WarehouseVO;
import com.ddosirak.persistance.WarehouseDAO;

@Service
public class WarehouseServiceImpl implements WarehouseService {
	@Inject
	private WarehouseDAO dao;
	
	public static final Logger logger = LoggerFactory.getLogger(WarehouseServiceImpl.class);
	
	//창고 목록
	@Override
	public List<WarehouseVO> warehouseList(PageVO pageVO) {
		logger.debug("dao : warehouselist 호출");
		List<WarehouseVO> voList=dao.whList(pageVO);
		logger.debug("voList의 개수 : "+voList.size());
		return voList;
	}
	
	//창고 검색 목록
	@Override
	public List<WarehouseVO> warehouseList(PageVO pageVO, Map<String, Object> instrSearch, Model model) {
		logger.debug("dao : warehouselist 검색 호출");
		List<WarehouseVO> voList=dao.whList(pageVO, instrSearch, model);
		logger.debug("voList의 개수 : "+voList.size());
		return voList;
	}
	
	//창고 등록
	@Override
	public Integer insertwh(WarehouseVO vo) {
		logger.debug("service : 창고 등록 호출");
		String codeFinder=dao.getMaxCode(vo);
		logger.debug("codefinder : "+codeFinder);
		if(codeFinder!=null) {
			int codeNum=Integer.parseInt(codeFinder.substring(2));
			StringBuilder sb = new StringBuilder();
				switch(codeFinder.charAt(0)) {
					case 'A' :  sb.append("A");
								break;
					case 'B' :	sb.append("B");
								break;
					case 'C' :  sb.append("C");
				}
				switch(codeFinder.charAt(1)) {
					case 'I' :  sb.append("I");
					sb.append(String.format("%02d", ++codeNum));
					break;
					case 'M' :	sb.append("M");
					sb.append(String.format("%02d", ++codeNum));
					break;
				}
				logger.debug("codenum :"+codeNum);
				logger.debug(sb.toString());
				vo.setWh_code(sb.toString());
				
			}else {
			StringBuilder sb = new StringBuilder();
				switch(vo.getWh_type()) {
					case "냉동" :  sb.append("A");
								break;
					case "냉장" :	sb.append("B");
								break;
					case "상온" :  sb.append("C");
				}
				switch(vo.getRetail_code()) {
					case "자재" :  sb.append("I");
					sb.append(String.format("%02d", 1));
					break;
					case "재고" :	sb.append("M");
					sb.append(String.format("%02d", 1));
					break;
				}
				vo.setWh_code(sb.toString());
			}
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
	public WarehouseVO selectwh(String wh_code) {
		logger.debug("service : editwh 호출");
		WarehouseVO result=dao.selectwh(wh_code);
		logger.debug("result : "+result);
		return result;
	}

	@Override
	public void deletewh(String wh_code) {
		logger.debug("service: deletewh 호출");
		dao.deletewh(wh_code);
		
	}

	@Override
	public List<WarehouseVO> warehouseItemList() {
		logger.debug("service : 창고 검색 전체");
		return dao.warehouseItemList();
	}

	@Override
	public List<WarehouseVO> warehouseItemList(Map<String, Object> instrSearch, Model model) {
		logger.debug("service : 창고 검색");
		return dao.warehouseItemList(instrSearch, model);
	}

	@Override
	public Integer warehouseCount(Map<String, Object> instrSearch) {
		logger.debug("service : 창고 검색  갯수");
		return dao.warehouseCount(instrSearch);
	}
	
	
	
	

}
