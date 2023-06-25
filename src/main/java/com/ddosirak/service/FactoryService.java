package com.ddosirak.service;

import java.util.List;

import com.ddosirak.domain.FactoryVO;

public interface FactoryService {
	// 공장 목록
	public List<FactoryVO> facList() throws Exception;

	// 공장 기초 등록
	public Integer insertFac(FactoryVO vo) throws Exception;

	// 공장 기초 수정
	public Integer updateFac(FactoryVO vo) throws Exception;

	public FactoryVO selectFac(String factory_code) throws Exception;

	// 공장 삭제
	public void deleteF(String factory_code) throws Exception;

}
