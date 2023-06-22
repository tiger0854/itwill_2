package com.ddosirak.persistance;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ddosirak.domain.ItemdetailVO;
import com.ddosirak.domain.MaterialdetailVO;

@Repository
public class ItemdetailDAOImpl implements ItemdetailDAO {
	
	private static final String NAMESPACE="com.ddosirak.mapper.ItemdetailMapper";
	
	private static final Logger logger=org.slf4j.LoggerFactory.getLogger(ItemdetailDAOImpl.class);
	
	@Inject
	SqlSession sqlsession;
	
	//상품 기초 목록
	@Override
	public List<ItemdetailVO> idList() {
		logger.debug("dao : 상품 기초 목록 실행");
		return sqlsession.selectList(NAMESPACE+".itemlist");
	}
	
	@Override
	public List<ItemdetailVO> idList(Map<String, Object> instrSearch, Model model) {
		logger.debug("dao : 상품 기초 목록 검색기능 실행");
		return sqlsession.selectList(NAMESPACE+".itemDetailSearch", instrSearch);
	}

	//상품 기초 등록
	@Override
	public Integer insertID(ItemdetailVO vo) {
		logger.debug("dao : 자재 기초 등록 실행");
		logger.debug(vo+"");
		return sqlsession.insert(NAMESPACE+".insertid",vo);
	}
	
	//상품 기초 수정
	@Override
	public Integer updateID(ItemdetailVO vo) {
		logger.debug("dao : 상품 기초 수정 실행(update)");
		return sqlsession.update(NAMESPACE+".updateid",vo);
	}
	@Override
	public ItemdetailVO selectID(String item_code) {
		logger.debug("dao : 상품 기초 수정 실행(edit)");
		return sqlsession.selectOne(NAMESPACE+".selectid", item_code);
	}
	
	//자제 삭제
	@Override
	public void deleteI(String item_code) {
		logger.debug("dao : 자재 삭제 실행");
		sqlsession.delete(NAMESPACE+".deleteid",item_code);

	}
	
	

	@Override
	public String getMaxCode() {
		logger.debug("dao : getMaxCode 호출");
		return sqlsession.selectOne(NAMESPACE+".getMaxCode");
	}

}
