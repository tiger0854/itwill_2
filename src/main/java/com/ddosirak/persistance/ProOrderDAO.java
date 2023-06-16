package com.ddosirak.persistance;

import java.util.List;

import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.ProOrderVO;

// persistance 영속성 > DB관련 처리

public interface ProOrderDAO {
	// 필요한 동작들을 추상메서드를 사용하여 정의! (만들어두기만 한다.)

	// C - 작업지시등록
	public void insertOrder(ProOrderVO vo); 
	
	// 작업지시 목록
	public List<ProOrderVO> proOrderList();

	// 작업지시 정보 조회
	public ProOrderVO getProOrder(String wo_code);
	
	// 작업지시 정보 수정
	public Integer EditProOrder(ProOrderVO vo);
	
	// 작업지시 정보 삭제
	public void deleteProOrder(String wo_code);
	
}// public interface end
