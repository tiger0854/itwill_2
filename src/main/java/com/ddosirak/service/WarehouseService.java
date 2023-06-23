package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.ddosirak.domain.FactoryVO;
import com.ddosirak.domain.WarehouseVO;

public interface WarehouseService {
	// 창고 목록 출력
	public List<WarehouseVO> warehouseList();

	// 창고 등록
	public Integer insertwh(WarehouseVO vo);

	// 창고 수정
	public Integer updatewh(WarehouseVO vo);

	public WarehouseVO selectwh(String wh_code);

	// 창고 삭제
	public void deletewh(String wh_code);

	// 상품목록 검색
	public List<WarehouseVO> warehouseItemList(Map<String, Object> instrSearch, Model model);
}
