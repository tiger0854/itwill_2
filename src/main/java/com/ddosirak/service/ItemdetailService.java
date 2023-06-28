package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.ddosirak.domain.ItemdetailVO;

public interface ItemdetailService {
	// 자재 목록
	public List<ItemdetailVO> idList();
	
	// 자재 목록 검색
	public List<ItemdetailVO> idList(Map<String, Object> instrSearch, Model model);
	
	// 자재 기초 등록
	public Integer insertID(ItemdetailVO vo);

	// 자재 기초 수정
	public Integer updateID(ItemdetailVO vo);
	public ItemdetailVO selectID(String item_code);

	// 자재 삭제
	public void deleteI(String item_code);
}
