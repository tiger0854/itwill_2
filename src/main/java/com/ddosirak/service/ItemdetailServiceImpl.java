package com.ddosirak.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.persistance.ItemdetailDAO;

@Service
public class ItemdetailServiceImpl implements ItemdetailService {
	@Inject
	ItemdetailDAO dao;
	
	public static final Logger logger = LoggerFactory.getLogger(ItemdetailServiceImpl.class);
	
	@Override
	public List<ItemdetailVO> idList() throws Exception {
		logger.debug("service : mdlist 실행");
		return dao.idList();
	}
	
	@Override
	public List<ItemdetailVO> idList(Map<String, Object> instrSearch, Model model) throws Exception {
		// TODO Auto-generated method stub
		return dao.idList(instrSearch, model);
	}

	@Override
	public Integer insertID(ItemdetailVO vo) throws Exception {
		logger.debug("service : insertMD 실행");
		if(dao.getMaxCode()!=null && dao.getMaxCode().contains("I")) {
			int codeNum=Integer.parseInt(dao.getMaxCode().substring(1));
			StringBuilder sb = new StringBuilder();
			sb.append("I");
			sb.append(String.format("%03d", ++codeNum));
			vo.setItem_code(sb.toString());
			}else {
				vo.setItem_code("I001");
			}
		return dao.insertID(vo);
	}

	@Override
	public Integer updateID(ItemdetailVO vo) throws Exception {
		logger.debug("service : updateMD 실행");
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

}
