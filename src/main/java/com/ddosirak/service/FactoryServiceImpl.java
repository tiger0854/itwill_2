package com.ddosirak.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ddosirak.domain.FactoryVO;
import com.ddosirak.persistance.FactoryDAO;

@Service
public class FactoryServiceImpl implements FactoryService {
	
	public static final Logger logger = LoggerFactory.getLogger(FactoryServiceImpl.class);
	
	@Inject
	FactoryDAO dao;
	
	
	
	@Override
	public List<FactoryVO> facList() throws Exception {
		logger.debug("service : 창고 목록 출력");
		return dao.facList();
	}

	@Override
	public Integer insertFac(FactoryVO vo) throws Exception {
		logger.debug("service : 창고 등록");
		if(dao.getMaxCode()!=null && dao.getMaxCode().contains("FAC")) {
		int codeNum=Integer.parseInt(dao.getMaxCode().substring(3));
		logger.debug("codenum : "+codeNum);
		StringBuilder sb = new StringBuilder();
		sb.append("FAC");
		sb.append(String.format("%02d", ++codeNum));
		vo.setFactory_code(sb.toString());
		}else {
			vo.setFactory_code("FAC01");
		}
		return dao.insertFac(vo);
	}

	@Override
	public Integer updateFac(FactoryVO vo) throws Exception {
		logger.debug("service : 창고 수정");
		return dao.updateFac(vo);
	}

	@Override
	public FactoryVO selectFac(String factory_code) throws Exception {
		logger.debug("service : 창고 수정 파라미터 출력");
		return dao.selectFac(factory_code);
	}

	@Override
	public void deleteF(String factory_code) throws Exception {
		logger.debug("service : 창고 삭제");
		dao.deleteF(factory_code);
	}

}
