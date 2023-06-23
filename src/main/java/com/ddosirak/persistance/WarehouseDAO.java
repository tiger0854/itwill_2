package com.ddosirak.persistance;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.ddosirak.domain.FactoryVO;
import com.ddosirak.domain.WarehouseVO;

public interface WarehouseDAO {
	// 창고 목록
	public List<WarehouseVO> whList();

	// 창고 등록
	public Integer insertWh(WarehouseVO vo);

	public String getMaxCode();

	// 창고 수정
	public Integer updateWh(WarehouseVO vo);

	public WarehouseVO selectwh(String wh_code);

	// 창고 삭제
	public void deletewh(String wh_code);

	// 창고 검색(부분 검색)
	public List<WarehouseVO> warehouseItemList(Map<String, Object> instrSearch, Model model);
}
