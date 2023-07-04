package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.domain.PageVO;

public interface MaterialdetailService {
	// 자재 목록
	public List<MaterialdetailVO> mdList(PageVO pageVO);

	public List<MaterialdetailVO> mdList(PageVO pageVO, Map<String, Object> instrSearch);

	// 자재 기초 등록
	public Integer insertMD(MaterialdetailVO vo);

	// 자재 기초 수정
	public Integer updateMD(MaterialdetailVO vo);

	public MaterialdetailVO selectMD(String material_code);

	// 자재 삭제
	public void deleteM(String material_code);
	
	// 상품목록
	public List<MaterialdetailVO> materialItemList(PageVO pageVO);

	// 상품목록 검색
	public List<MaterialdetailVO> materialItemList(Map<String, Object> instrSearch);


	// 자재 검색 갯수
	public Integer materialCount(Map<String, Object> instrSearch);

}
