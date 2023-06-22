package com.ddosirak.persistance;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.MaterialdetailVO;

public interface MaterialdetailDAO {
		//자재 목록
		public List<MaterialdetailVO> mdList();
		//자재 기초 등록
		public Integer insertMD(MaterialdetailVO vo);
		public String getMaxCode();
		//자재 기초 수정
		public Integer updateMD(MaterialdetailVO vo);
		public MaterialdetailVO selectMD(String material_code);
		//자재 삭제
		public void deleteM(String material_code);
		//자재 검색(전체조회 검색)
		public List<MaterialdetailVO> materialItemList();
		//자재 검색(부분 검색)
		public List<MaterialdetailVO> materialItemList(Map<String, Object> instrSearch, Model model);
}
