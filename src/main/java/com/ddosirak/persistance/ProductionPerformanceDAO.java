package com.ddosirak.persistance;

import java.util.List;

import com.ddosirak.domain.ProductionPerformanceVO;

public interface ProductionPerformanceDAO {
	public void insertProdPerf(ProductionPerformanceVO ivo);
	
	public List<ProductionPerformanceVO> prodPerfList();
}
