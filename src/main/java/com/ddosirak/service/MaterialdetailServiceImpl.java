package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ddosirak.domain.MaterialdetailVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.persistance.MaterialdetailDAO;

@Service
public class MaterialdetailServiceImpl implements MaterialdetailService {
	
	@Inject
	MaterialdetailDAO dao;
	
	public static final Logger logger = LoggerFactory.getLogger(MaterialdetailServiceImpl.class);
	
	@Override
	public List<MaterialdetailVO> mdList(PageVO pageVO) throws Exception {
		logger.debug("service : 자재 목록 호출");
		List<MaterialdetailVO> resultlist=dao.mdList(pageVO);
		logger.debug("service : 자재 목록 완료");
		return resultlist;
	}
	
	@Override
	public List<MaterialdetailVO> mdList(PageVO pageVO, Map<String, Object> instrSearch) throws Exception {
		logger.debug("service : 자재 목록 호출");
		List<MaterialdetailVO> resultlist=dao.mdList(pageVO, instrSearch);
		logger.debug("service : 자재 목록 완료");
		return resultlist;
	}

	@Override
	public Integer insertMD(MaterialdetailVO vo) throws Exception {
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
	public Integer updateMD(MaterialdetailVO vo) throws Exception {
		logger.debug("service : 자재 수정 호출 (update)");
		int result=dao.updateMD(vo);
		return result;
	}

	@Override
	public MaterialdetailVO selectMD(String material_code) throws Exception {
		logger.debug("service : 자재 수정 호출 (edit)");
		logger.debug("service : 파라미터 확인 "+ material_code);
		MaterialdetailVO resultvo=dao.selectMD(material_code);
		return resultvo;
	}

	@Override
	public void deleteM(String material_code) throws Exception {
		logger.debug("service : 자재 삭제 호출");
		dao.deleteM(material_code);
	}

	@Override
	public List<MaterialdetailVO> materialItemList(PageVO pageVO) throws Exception {
		logger.debug("service : 자재 목록 전체 호출");
		return dao.materialItemList(pageVO);
	}

	@Override
	public List<MaterialdetailVO> materialItemList(Map<String, Object> instrSearch,PageVO pageVO) throws Exception {
		logger.debug("service : 자재 목록 검색 호출");
		return dao.materialItemList(instrSearch,pageVO);

	}

	@Override
	public Integer materialCount(Map<String, Object> instrSearch) throws Exception {
		logger.debug("service : 자재 검색 갯수 호출");
		return dao.materialCount(instrSearch);
	}

	@Override
	public MaterialdetailVO selectTQTY(String material_code) throws Exception {
		
		return dao.selectTQTY(material_code);
	}
	
	

}
