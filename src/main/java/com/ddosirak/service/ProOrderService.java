package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.ProOrderVO;
import com.ddosirak.domain.ProductionPerformanceVO;

public interface ProOrderService {
	
	// 작업지시 등록
	public void orderInsert(ProOrderVO vo);
	
	// 작업지시 목록 출력
	public List<ProOrderVO> proOrderList();
	// 작업지시 검색
	public List<ProOrderVO> proOrderList(Map<String, Object> instrSearch, Model model);

	
	// 작업지시 조회
	public ProOrderVO getProOder(String wo_code);
	
	// 작업지시 정보 수정
	public Integer EditProOrder(ProOrderVO vo);
	
	// 작업지시 정보 삭제
	public void deleteProOrder(String wo_code);
	
	// 작업지시 상태 변경
//	public Integer statusProOrder(String wo_code,ProductionPerformanceVO ivo);
	
	// 상품목록
	public List<ItemdetailVO> proitemList();
	
	// 상품목록 검색
	public List<ItemdetailVO> proitemList(Map<String, Object> instrSearch, Model model);
	
} // interface end
