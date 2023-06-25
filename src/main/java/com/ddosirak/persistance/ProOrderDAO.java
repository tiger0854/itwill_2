package com.ddosirak.persistance;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.ProOrderVO;
import com.ddosirak.domain.ProductionPerformanceVO;

// persistance 영속성 > DB관련 처리

public interface ProOrderDAO {
	// 필요한 동작들을 추상메서드를 사용하여 정의! (만들어두기만 한다.)

	// C - 작업지시등록
	public void insertOrder(ProOrderVO vo); 
	
	// 작업지시 목록
	public List<ProOrderVO> proOrderList(PageVO pageVO);
	
	// 작업지시 검색목록
	// 작업지시 검색
	public List<ProOrderVO> proOrderList(Map<String, Object> instrSearch, Model model,PageVO pageVO);
	
	// 작업지시 정보 조회
	public ProOrderVO getProOrder(String wo_code);
	
	// 작업지시 정보 수정
	public Integer EditProOrder(ProOrderVO vo);
	
	// 작업지시 정보 삭제
	public void deleteProOrder(String wo_code);
	
	// 작업지시 상태 변경
//	public Integer statusProOrder(ProductionPerformanceVO vo);
	
	// 상품목록
	public List<ItemdetailVO> proitemList();
	
	// 상품목록 검색
	public List<ItemdetailVO> proitemList(Map<String, Object> instrSearch, Model model);
	
	public void addpQTY(ProductionPerformanceVO ivo);
	
	//작업지시 검색 갯수
	public Integer ProOdercount(Map<String, Object> instrSearch);
	
	
}// public interface end
