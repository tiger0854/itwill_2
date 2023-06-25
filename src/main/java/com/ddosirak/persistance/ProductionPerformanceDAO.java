package com.ddosirak.persistance;

import java.util.List;
import java.util.Map;

import com.ddosirak.domain.ProductionPerformanceVO;

public interface ProductionPerformanceDAO {
	public void insertProdPerf(ProductionPerformanceVO ivo);
	
	public List<ProductionPerformanceVO> prodPerfList(String wo_code);
	
	public ProductionPerformanceVO perfUpdateList(int perf_id);
	
	public Integer perfUpdateBoard(ProductionPerformanceVO uvo);
	
	public void perfDeleteBoard(int perf_id);
	
	// 양품인지 체크
	public boolean checkY(String  wo_code);

	//지시상태 마감
	public void updateClose (String  wo_code);
	
	//지시상태 시작
	public void updateStart (String  wo_code);
	
	//지시상태 지시
	public void updateInstr(String wo_code);
	
	// 실적등록에 등록된 지시목록 하나불러오기
	public String getWoMap(String  wo_code);
	
	//실적 갯수 반환
	public Integer getPrefCount(String wo_code);
	
	//생산량 갯수 삭제
	public void pfQTYDel(ProductionPerformanceVO pvo);

	

	
}
