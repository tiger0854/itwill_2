package com.ddosirak.service;

import java.util.List;

import com.ddosirak.domain.IntegrationCodeVO;
import com.ddosirak.domain.MaterialsVO;

public interface MaterialsService {
	
	// 자재입고 등록
	public void matInputInsert(MaterialsVO ivo);
	
	// 자재입고 목록
	public List<MaterialsVO> matInputList();
	
	// 특정 자재입고 게시물 불러오기
	public MaterialsVO getMatInput(String material_code);
	
	// 특정 자재입고 수정
	public Integer matInputEdit(MaterialsVO uvo);
	
	// 특정 자재입고 게시물 삭제
	public void RemoveMatInput(String material_code);
	
	// 팝업창 상품 리스트
	public List<IntegrationCodeVO> matInputItemList();
}
