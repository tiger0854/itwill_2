package com.ddosirak.persistance;

import java.util.List;

import com.ddosirak.domain.WarehouseVO;

public interface WarehouseDAO {
	//창고 목록
	public List<WarehouseVO> whList();
	//창고 등록
	public Integer insertWh(WarehouseVO vo);
	//창고 수정
	public Integer updateWh(WarehouseVO vo);
	public WarehouseVO editwh(String wh_code);
	//창고 삭제
	public void deletewh(String wh_code);
}
