package com.ddosirak.service;

import java.util.List;

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
}
