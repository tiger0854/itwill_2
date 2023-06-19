package com.ddosirak.service;

import java.util.List;

import com.ddosirak.domain.WarehouseVO;

public interface WarehouseService {
	//창고 목록 출력
	public List<WarehouseVO> warehouseList();
	
	//창고 등록
	public Integer insertwh(WarehouseVO vo);
	
	//창고 수정
	public Integer updatewh(WarehouseVO vo);
	public WarehouseVO selectwh(String wh_code);
	
	//창고 삭제
	public void deletewh(String wh_code);
}
