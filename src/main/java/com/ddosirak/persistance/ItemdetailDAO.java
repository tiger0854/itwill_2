package com.ddosirak.persistance;

import java.util.List;

import com.ddosirak.domain.ItemdetailVO;


public interface ItemdetailDAO {
	//자재 목록
	public List<ItemdetailVO> mdList();

	// 자재 기초 등록
	public Integer insertMD(ItemdetailVO vo);

	// 자재 기초 수정
	public Integer updateMD(ItemdetailVO vo);
	public ItemdetailVO editMD(String material_code);

	// 자재 삭제
	public void deleteM(String material_code);
}
