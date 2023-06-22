package com.ddosirak.persistance;

import java.util.List;

import com.ddosirak.domain.IntegrationCodeVO;
import com.ddosirak.domain.MaterialsVO;

public interface MaterialsDAO {

	// 자재입고 등록
	public void insertMatInput(MaterialsVO ivo);

	// 자재입고 목록
	public List<MaterialsVO> inputMaterialList();

	// 자재입고 특정 게시물 불러오기
	public MaterialsVO getMatInput(String material_code);

	// 자재입고 특정 게시물 수정
	public Integer updateMatInput(MaterialsVO uvo);

	// 자재입고 특정 게시물 삭제
	public void deleteMatInput(String material_code);

	// 팝업창 상품 리스트
	public List<IntegrationCodeVO> matInputItemList();
}
