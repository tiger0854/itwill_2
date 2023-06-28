package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.ddosirak.domain.CookAddVO;
import com.ddosirak.domain.CookVO;
import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.ProOrderVO;
import com.ddosirak.domain.ProductionPerformanceVO;

public interface CookOrderService {
	
	// 조리지시 등록
	public void cookorderInsert(CookVO cvo);
	
	// 조리지시 목록 출력
	public List<CookVO> cookOrderList(PageVO pageVO);
	
	// 조리지시 검색목록
	public List<CookVO> cookOrderList(Map<String, Object> instrSearch, Model model, PageVO pageVO);
	
	// 조리지시 갯수
	public Integer cookOrdercount(Map<String, Object> instrSearch);
	
	// 조리지시 조회
	public CookVO getcookOder(String co_code);
	
	// 조리지시 정보 수정
	public Integer EditcookOrder(CookVO cvo);
	
	// 조리지시 정보 삭제
	public void deletecookOrder(String co_code);
	
	// 조리실적등록 갯수
	public Integer cooketccount(String co_code);
	
	// 조리실적 목록
	public List<CookAddVO> cookEtcList(Map<String, Object> instrSearch,String co_code, PageVO pageVO);
	
	// 작업지시 상태 변경
//	public Integer statusProOrder(ProductionPerformanceVO ivo);
	
	// 조리지시 실적등록
	public void insertcookPerf(CookAddVO cavo);
		
	//조리지시 실적삭제
	public void cooketcDelete(String cook_id);
	
	//조리지시 실적등록 - 생산수량 증가
	public void addcpQTY(CookAddVO cavo);

	

	

	

	


	

	

	

	

	

	
	
	
} // interface end
