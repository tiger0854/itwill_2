package com.ddosirak.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ddosirak.codeBulider.CodeBuilder;
import com.ddosirak.codeBulider.CodeBuilder.ServiceName;
import com.ddosirak.domain.FactoryVO;
import com.ddosirak.persistance.FactoryDAO;

@Service
public class FactoryServiceImpl implements FactoryService {
	
	public static final Logger logger = LoggerFactory.getLogger(FactoryServiceImpl.class);
	
	@Inject
	FactoryDAO dao;
	
	
	
	@Override
	public List<FactoryVO> facList() {
		logger.debug("service : 창고 목록 출력");
		return dao.facList();
	}

	@Override
	public Integer insertFac(FactoryVO vo) {
		logger.debug("service : 창고 등록");
		CodeBuilder cb= new CodeBuilder();
		vo.setFactory_code(cb.FoundationCodeBuilder(ServiceName.FACTORY));
		return dao.insertFac(vo);
	}

	@Override
	public Integer updateFac(FactoryVO vo) {
		logger.debug("service : 창고 수정");
		return dao.updateFac(vo);
	}

	@Override
	public FactoryVO editFac(String factory_code) {
		logger.debug("service : 창고 수정 파라미터 출력");
		return dao.editFac(factory_code);
	}

	@Override
	public void deleteF(String factory_code) {
		logger.debug("service : 창고 삭제");
		dao.deleteF(factory_code);
	}

}
