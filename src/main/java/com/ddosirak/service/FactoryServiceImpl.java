package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ddosirak.domain.FactoryVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.persistance.EmployeeDAO;
import com.ddosirak.persistance.FactoryDAO;

@Service
public class FactoryServiceImpl implements FactoryService {
	
	public static final Logger logger = LoggerFactory.getLogger(FactoryServiceImpl.class);
	
	@Inject
	FactoryDAO dao;
	
	@Inject
	EmployeeDAO edao;
	
	@Inject
	HttpSession session;
	
	@Override
	public List<FactoryVO> facList(PageVO pageVO) throws Exception {
		logger.debug("service : 창고 목록 출력");
		return dao.facList(pageVO);
	}
	
	

	@Override
	public List<FactoryVO> facList(PageVO pageVO, Map<String, Object> instrSearch) throws Exception {
		logger.debug("service : 창고 검색 목록 출력");
		return dao.facList(pageVO, instrSearch);
	}



	@Override
	public Integer insertFac(FactoryVO vo) throws Exception {
		logger.debug("service : 창고 등록");
	
		int id=Integer.valueOf((String)session.getAttribute("login_id"));
		vo.setEmployee_name(edao.vacationfind(id));
		
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
		logger.debug("service : 공장 수정");
		int id=Integer.valueOf((String)session.getAttribute("login_id"));
		vo.setEmployee_name(edao.vacationfind(id));
		return dao.updateFac(vo);
	}

	@Override
	public FactoryVO selectFac(String factory_code) throws Exception {
		logger.debug("service : 공장 수정 파라미터 출력");
		return dao.selectFac(factory_code);
	}

	@Override
	public void deleteF(String factory_code) throws Exception {
		logger.debug("service : 공장 삭제");
		dao.deleteF(factory_code);
	}
	
	

	@Override
	public List<FactoryVO> factoryItemList() {
		logger.debug("service : 공장 검색 전체");
		return dao.factoryItemList();
	}



	@Override
	public List<FactoryVO> factoryItemList(Map<String, Object> instrSearch) {
		logger.debug("service : 공장 검색 부분");
		return dao.factoryItemList(instrSearch);
	}

	@Override
	public Integer factoryCount(Map<String, Object> instrSearch) {
		logger.debug("service : 공장 검색 갯수");
		return dao.factoryCount(instrSearch);
	}
	
	
	
	

}
