package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.ddosirak.domain.FactoryVO;
import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.domain.PageVO;

public interface FactoryService {
	// 공장 목록
	public List<FactoryVO> facList(PageVO pageVO);
	
	// 공장 목록 검색
	public List<FactoryVO> facList(PageVO pageVO, Map<String, Object> instrSearch, Model model);	

	// 공장 기초 등록
	public Integer insertFac(FactoryVO vo);

	// 공장 기초 수정
	public Integer updateFac(FactoryVO vo);

	public FactoryVO selectFac(String factory_code);

	// 공장 삭제
	public void deleteF(String factory_code);

	// 상품목록 검색	
	public List<FactoryVO> factoryItemList();
	public List<FactoryVO> factoryItemList(Map<String, Object> instrSearch, Model model);

	// 공장 검색 갯수
	public Integer factoryCount(Map<String, Object> instrSearch);

}
