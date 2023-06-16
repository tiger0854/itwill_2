package com.ddosirak.service;

import java.util.List;

import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.ProOrderVO;

public interface ProOrderService {
	
	// 작업지시 등록
	public void orderInsert(ProOrderVO vo);
	
	// 작업지시 목록 출력
	public List<ProOrderVO> proOrderList();
	
	// 작업지시 조회
	public ProOrderVO getProOder(String wo_code);
	
	// 작업지시 정보 수정
	public Integer EditProOrder(ProOrderVO vo);
	
	// 작업지시 정보 삭제
	public void deleteProOrder(String wo_code);
} // interface end
