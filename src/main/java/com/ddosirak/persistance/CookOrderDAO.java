package com.ddosirak.persistance;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.ddosirak.domain.CookAddVO;
import com.ddosirak.domain.CookListVO;
import com.ddosirak.domain.CookVO;
import com.ddosirak.domain.EmployeeVO;
import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.domain.ProOrderVO;
import com.ddosirak.domain.ProductionPerformanceVO;

// persistance 영속성 > DB관련 처리

public interface CookOrderDAO {
	// 필요한 동작들을 추상메서드를 사용하여 정의! (만들어두기만 한다.)

	// C - 조리지시등록
	public void cookOrder(CookVO cvo);
	
	// 조리지시 목록
	public List<CookVO> cookOrderList(PageVO pageVO);
	
	// 조리지시 검색목록
	// 조리지시 검색
	public List<CookVO> cookOrderList(Map<String, Object> instrSearch, Model model,PageVO pageVO);
	
	//조리지시 갯수
	public Integer cookOrdercount(Map<String, Object> instrSearch);
	
	// 조리지시 정보 조회
	public CookVO getcookOrder(String co_code);

	
	// 조리지시 정보 수정
	public Integer EditcookOrder(CookVO cvo);
	
	// 조리지시 정보 삭제
	public void deletecookOrder(String co_code);
	
	
	// 조리지시 실적 등록
	public void insertcookPerf(CookAddVO cavo);
	
	// 조리실적 등록 갯수
	public Integer cooketccount(String co_code);
	
	
	//조리실적 목록
	public List<CookAddVO> cooketcList(Map<String, Object> instrSearch, PageVO pageVO,String co_code);
	
	
	//조리실적 삭제
	public void cooketcDel(String cook_id);
	
	//조리실적등록 - 생산수량 증가
	public void addcpQTY(CookAddVO cavo);

	//조리 지시상태
	public String getcookstatus(String co_code);
	
	// 조리 지시상태 시작
	public void updateStart(String co_code);

	// 조리 지시상태 마감
	public void updateClose(String co_code);
	
	// 조리 지시상태 지시
	public void updateInstr(String co_code);

	// 불량체크
	public boolean checkY(String co_code);

	// 조리 실적 조회
	public CookAddVO getCooketc(String cook_id);
	
	// 조리실적삭제
	public void cfQTYDel(CookAddVO cavo);
	
	// 조리실적 갯수
	public Integer getCrefCount(String co_code);
	
	// 조리실적 수동마감
	public void codatatusEnd(String co_code);

	// 수주번호 체크
	public boolean checkrecode(String re_code);
	
	// 수주번호 중복체크
	public Boolean checksuList(String re_code);
	
	// 수주번호 중복체크2
	public Boolean checksucookList(String re_code);

	


	

	

	


	

	

	

	

	

	
	
	
}// public interface end
