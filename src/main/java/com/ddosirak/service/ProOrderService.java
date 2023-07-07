package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.GraphVO;
import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.ProOrderVO;
import com.ddosirak.domain.ProductionPerformanceVO;

public interface ProOrderService {
	
	// 작업지시 등록
	public void orderInsert(ProOrderVO vo);
	
	// 작업지시 목록 출력
	public List<ProOrderVO> proOrderList(PageVO pageVO);
	// 작업지시 검색
	public List<ProOrderVO> proOrderList(Map<String, Object> instrSearch, Model model, PageVO pageVO);

	// 작업지시 조회
	public ProOrderVO getProOder(String wo_code);
	
	// 작업지시 정보 수정
	public Integer EditProOrder(ProOrderVO vo);
	
	// 작업지시 정보 삭제
	public void deleteProOrder(String wo_code);
	
	// 작업지시 상태 변경
//	public Integer statusProOrder(ProductionPerformanceVO ivo);
	
	// 상품목록
	public List<ItemdetailVO> proitemList(PageVO pageVO);
	
	// 상품목록 검색
	public List<ItemdetailVO> proitemList(PageVO pageVO,Map<String, Object> instrSearch, Model model);

	public void addpQTY(ProductionPerformanceVO ivo);
	
	// 작업지시 검색 갯수
	public Integer ProOrdercount(Map<String, Object> instrSearch);
	
	// 상품 검색 갯수
	public Integer itemcount(Map<String, Object> instrSearch);
	
	// 그래프 목록 
	public List<Map<String, Object>> graphList();
	
	
} // interface end
