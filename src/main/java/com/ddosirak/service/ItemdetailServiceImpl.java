package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.PageVO;
import com.ddosirak.persistance.EmployeeDAO;
import com.ddosirak.persistance.ItemdetailDAO;

@Service
public class ItemdetailServiceImpl implements ItemdetailService {
	@Inject
	private ItemdetailDAO dao;
	
	@Inject
	private HttpSession session;
	
	@Inject
	private EmployeeDAO edao;
	
	public static final Logger logger = LoggerFactory.getLogger(ItemdetailServiceImpl.class);
	
	@Override
	public List<ItemdetailVO> idList(PageVO pageVO) throws Exception {
		logger.debug("service : mdlist 실행");
		return dao.idList(pageVO);
	}
	
	@Override
	public List<ItemdetailVO> idList(PageVO pageVO, Map<String, Object> instrSearch) throws Exception {
		// TODO Auto-generated method stub
		return dao.idList(pageVO, instrSearch);
	}

	@Override
	public Integer insertID(ItemdetailVO vo) throws Exception {
		logger.debug("service : insertMD 실행");
		int id=Integer.valueOf((String)session.getAttribute("login_id"));
		vo.setEmployee_name(edao.vacationfind(id));
		
		if (vo.getItem_code() == null) {
			if (dao.getMaxCode() != null && dao.getMaxCode().contains("I")) {
				int codeNum = Integer.parseInt(dao.getMaxCode().substring(1));
				StringBuilder sb = new StringBuilder();
				sb.append("I");
				sb.append(String.format("%03d", ++codeNum));
				vo.setItem_code(sb.toString());
			} else {
				vo.setItem_code("I001");
			}
		}
		return dao.insertID(vo);
	}

	@Override
	public Integer updateID(ItemdetailVO vo) throws Exception {
		logger.debug("service : updateMD 실행");
		int id=Integer.valueOf((String)session.getAttribute("login_id"));
		vo.setEmployee_name(edao.vacationfind(id));
		return dao.updateID(vo);
	}
	
	@Override
	public ItemdetailVO selectID(String item_code) throws Exception {
		logger.debug("service : editmd  실행");
		return dao.selectID(item_code);
	}

	@Override
	public void deleteI(String item_code) throws Exception {
		logger.debug("service : deletemd 실행");
		dao.deleteI(item_code);
	}

	@Override
	public Integer itemCount(Map<String, Object> instrSearch) throws Exception {
		logger.debug("service : itemCount 실행");
		return dao.itemCount(instrSearch);
	}
	
	

}
