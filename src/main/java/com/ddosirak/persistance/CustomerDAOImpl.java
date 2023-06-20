package com.ddosirak.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ddosirak.domain.CustomerVO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
	
	@Inject
	private SqlSession sqlSession; 
	
	private static final String NAMESPACE="com.ddosirak.mapper.CustomerMapper";

	private static final Logger logger = LoggerFactory.getLogger(InboundDAOImpl.class);

	@Override
	public List<CustomerVO> customerList() {
		
		return sqlSession.selectList(NAMESPACE+".selectCustomer");
	}

	@Override
	public void insertCustomer(CustomerVO vo) {
		 sqlSession.insert(NAMESPACE+".insertCustomer",vo);
		
	}

	@Override
	public void updateCustomer(CustomerVO vo) {
		sqlSession.update(NAMESPACE+".updateCustomer",vo);
		
	}

	@Override
	public void deleteCustomer(String cus_id) {
		sqlSession.delete(NAMESPACE+".deleteCustomer",cus_id);	
	}
	
}
