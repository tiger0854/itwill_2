package com.ddosirak.persistance;

import java.util.List;

import com.ddosirak.domain.ItemdetailVO;


public interface ItemdetailDAO {
	//자재 목록
	public List<ItemdetailVO> idList();

	// 자재 기초 등록
	public Integer insertID(ItemdetailVO vo);

	// 자재 기초 수정
	public Integer updateID(ItemdetailVO vo);
	public ItemdetailVO editID(String item_code);

	// 자재 삭제
	public void deleteI(String item_code);
}
