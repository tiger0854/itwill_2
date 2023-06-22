package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.MaterialdetailVO;

public interface MaterialdetailService {
	// 자재 목록
	public List<MaterialdetailVO> mdList();

	// 자재 기초 등록
	public Integer insertMD(MaterialdetailVO vo);

	// 자재 기초 수정
	public Integer updateMD(MaterialdetailVO vo);

	public MaterialdetailVO selectMD(String material_code);

	// 자재 삭제
	public void deleteM(String material_code);
	
	// 상품목록
	public List<MaterialdetailVO> materialItemList();

	// 상품목록 검색
	public List<MaterialdetailVO> materialItemList(Map<String, Object> instrSearch, Model model);
}
