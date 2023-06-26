package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.ddosirak.domain.ItemdetailVO;

public interface ItemdetailService {
	// 자재 목록
	public List<ItemdetailVO> idList() throws Exception;
	
	// 자재 목록 검색
	public List<ItemdetailVO> idList(Map<String, Object> instrSearch, Model model) throws Exception;
	
	// 자재 기초 등록
	public Integer insertID(ItemdetailVO vo) throws Exception;

	// 자재 기초 수정
	public Integer updateID(ItemdetailVO vo) throws Exception;
	public ItemdetailVO selectID(String item_code) throws Exception;

	// 자재 삭제
	public void deleteI(String item_code) throws Exception;
}
