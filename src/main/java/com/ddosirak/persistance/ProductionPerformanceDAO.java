package com.ddosirak.persistance;

import java.util.List;

import com.ddosirak.domain.ProductionPerformanceVO;

public interface ProductionPerformanceDAO {
	public void insertProdPerf(ProductionPerformanceVO ivo);
	
	public List<ProductionPerformanceVO> prodPerfList(String wo_code);
	
	public ProductionPerformanceVO perfUpdateList(int perf_id);
	
	public Integer perfUpdateBoard(ProductionPerformanceVO uvo);
	
	public void perfDeleteBoard(int perf_id);
}
