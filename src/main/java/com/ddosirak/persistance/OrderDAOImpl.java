package com.ddosirak.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ddosirak.domain.ItemRecipeVO;
import com.ddosirak.domain.OrderVO;
import com.ddosirak.domain.PageVO;



//@Repository : 스프링에 해당 파일이 DAO의 동작을 하는 객체라고 등록하는 것.

@Repository
public class OrderDAOImpl implements OrderDAO{
	
	@Inject
	private SqlSession sqlSession; 
	
	private static final String NAMESPACE="com.ddosirak.mapper.OrderMapper";

	private static final Logger logger = LoggerFactory.getLogger(OrderDAOImpl.class);

	//메서드 시작
	@Override
	public void insertOrder(OrderVO vo) {
		sqlSession.insert(NAMESPACE+".insertOrder", vo); 
		logger.debug("발주서 등록 완료!");
		
	}//발주서 등록

	@Override
	public List<OrderVO> orderAllList(PageVO vo) {
		List<OrderVO> orderList = sqlSession.selectList(NAMESPACE+".orderAllList",vo); 
		logger.debug("발주리스트 불러오기 완료!");		
		return orderList;
	}

	@Override
	public Integer updateOrder(OrderVO vo) {
		logger.debug("발주서 수정 완료!");	
		return sqlSession.update(NAMESPACE+".updateOrder",vo);
	}

	@Override
	public Integer deleteOrder(String order_number) {
		logger.debug("발주서 삭제 완료!");	
		return sqlSession.delete(NAMESPACE+".deleteOrder",order_number);
	}

	@Override
	public List<ItemRecipeVO> getRequestList(PageVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".selectRequset",vo);
	}

}
