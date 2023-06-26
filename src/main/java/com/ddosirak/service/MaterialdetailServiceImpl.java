package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.persistance.MaterialdetailDAO;

@Service
public class MaterialdetailServiceImpl implements MaterialdetailService {
	
	@Inject
	MaterialdetailDAO dao;
	
	public static final Logger logger = LoggerFactory.getLogger(MaterialdetailServiceImpl.class);
	
	@Override
	public List<MaterialdetailVO> mdList() {
		logger.debug("service : 자재 목록 호출");
		List<MaterialdetailVO> resultlist=dao.mdList();
		logger.debug("service : 자재 목록 완료");
		return resultlist;
	}

	@Override
	public Integer insertMD(MaterialdetailVO vo) {
		logger.debug("service : 자재 등록 호출");
		if(dao.getMaxCode()!=null && dao.getMaxCode().contains("M")) {
			int codeNum=Integer.parseInt(dao.getMaxCode().substring(1));
			StringBuilder sb = new StringBuilder();
			sb.append("M");
			sb.append(String.format("%04d", ++codeNum));
			vo.setMaterial_code(sb.toString());
			}else {
				vo.setMaterial_code("M0001");
			}	
		logger.debug(vo+"");
		int result=dao.insertMD(vo);
		return result;
	}

	@Override
	public Integer updateMD(MaterialdetailVO vo) {
		logger.debug("service : 자재 수정 호출 (update)");
		int result=dao.updateMD(vo);
		return result;
	}

	@Override
	public MaterialdetailVO selectMD(String material_code) {
		logger.debug("service : 자재 수정 호출 (edit)");
		logger.debug("service : 파라미터 확인 "+ material_code);
		MaterialdetailVO resultvo=dao.selectMD(material_code);
		return resultvo;
	}

	@Override
	public void deleteM(String material_code) {
		logger.debug("service : 자재 삭제 호출");
		dao.deleteM(material_code);
	}

	@Override
	public List<MaterialdetailVO> materialItemList() {
		logger.debug("service : 자재 목록 전체 호출");
		return dao.materialItemList();
	}

	@Override
	public List<MaterialdetailVO> materialItemList(Map<String, Object> instrSearch, Model model) {
		logger.debug("service : 자재 목록 검색 호출");
		return dao.materialItemList(instrSearch, model);
	}
	
	

}
