package com.ddosirak.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.springframework.stereotype.Repository;

import com.ddosirak.domain.MaterialdetailVO;

@Repository
public class MaterialdetailDAOImpl implements MaterialdetailDAO {
	
	@Inject
	SqlSession sqlsession;
	
	private static final String NAMESPACE="com.ddosirak.mapper.MaterialdetailMapper";
	
	
	private static final Logger logger=org.slf4j.LoggerFactory.getLogger(MaterialdetailDAOImpl.class);
	
	//자재 기초 목록
	@Override
	public List<MaterialdetailVO> mdList() {
		logger.debug("dao : 자재 기초 목록 실행");
		return sqlsession.selectList(NAMESPACE+".selectMaterialDetail");
	}
	
	//자재 기초 등록
	@Override
	public Integer insertMD(MaterialdetailVO vo) {
		logger.debug("dao : 자재 기초 등록 실행");
		logger.debug(vo+"");
		return sqlsession.insert(NAMESPACE+".insertMaterialDetail",vo);
	}
	
	//자재 기초 수정
	@Override
	public Integer updateMD(MaterialdetailVO vo) {
		logger.debug("dao : 자재 기초 수정 실행(update)");
		return sqlsession.update(NAMESPACE+".updateMaterialDetail",vo);
	}
	@Override
	public MaterialdetailVO editMD(String material_code) {
		logger.debug("dao : 자재 기초 수정 실행(edit)");
		return sqlsession.selectOne(NAMESPACE+".editMaterialDetail", material_code);
	}

	//자재 삭제
	@Override
	public void deleteM(String material_code) {
		logger.debug("dao : 자재 삭제 실행");
		sqlsession.delete(NAMESPACE+".deleteMaterial",material_code);
	}

	
}
