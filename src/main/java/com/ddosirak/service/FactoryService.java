package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ddosirak.domain.FactoryVO;
import com.ddosirak.domain.PageVO;

public interface FactoryService {
	// 공장 목록
	public List<FactoryVO> facList(PageVO pageVO) throws Exception;
	
	// 공장 목록 검색
	public List<FactoryVO> facList(PageVO pageVO, Map<String, Object> instrSearch) throws Exception;	

	// 공장 기초 등록
	public Integer insertFac(FactoryVO vo) throws Exception;

	// 공장 기초 수정
	public Integer updateFac(FactoryVO vo) throws Exception;

	public FactoryVO selectFac(String factory_code) throws Exception;

	// 공장 삭제
	public void deleteF(String factory_code) throws Exception;

	// 상품목록 검색	
	public List<FactoryVO> factoryItemList();
	public List<FactoryVO> factoryItemList(Map<String, Object> instrSearch);

	// 공장 검색 갯수
	public Integer factoryCount(Map<String, Object> instrSearch);

}
