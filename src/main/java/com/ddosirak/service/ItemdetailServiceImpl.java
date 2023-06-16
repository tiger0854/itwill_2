package com.ddosirak.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.persistance.ItemdetailDAO;

@Service
public class ItemdetailServiceImpl implements ItemdetailService {
	@Inject
	ItemdetailDAO dao;
	
	public static final Logger logger = LoggerFactory.getLogger(ItemdetailServiceImpl.class);
	
	@Override
	public List<ItemdetailVO> idList() {
		logger.debug("service : mdlist 실행");
		return dao.idList();
	}

	@Override
	public Integer insertID(ItemdetailVO vo) {
		logger.debug("service : insertMD 실행");
		return dao.insertID(vo);
	}

	@Override
	public Integer updateID(ItemdetailVO vo) {
		logger.debug("service : updateMD 실행");
		return dao.updateID(vo);
	}

	@Override
	public ItemdetailVO editID(String item_code) {
		logger.debug("service : editmd  실행");
		return dao.editID(item_code);
	}

	@Override
	public void deleteI(String item_code) {
		logger.debug("service : deletemd 실행");
		dao.deleteI(item_code);
	}

}
