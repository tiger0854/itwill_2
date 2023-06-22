package com.ddosirak.persistance;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ddosirak.domain.IntegrationCodeVO;
import com.ddosirak.domain.MaterialsVO;

@Repository
public class MaterialsDAOImpl implements MaterialsDAO {
		// 1,2 DB 연결
		// 3, SQL작성, pstmt
		// 4. SQL 실행
		// 5. 데이터 처리 ... 기존에 DAO에서 하던 일!!
		
		// 1,2 DB 연결			> SqlSessionFactory 객체 주입
		@Inject
//		private SqlSessionFactory sqlFactory; // bean으로 인식된다.
		private SqlSession sqlSession; // sqlFactory는 select() 사용이 불가능하여 변경, 이후 다른 객체를 주입받아 사용할거임!
		// 3, SQL작성, pstmt	> memberMapper.xml에 작성하였음
		
		private static final String NAMESPACE = "com.ddosirak.mapper.MaterialsMapper";
		// 상수는 final인데 왜 static 주나 ? > 관례적인것 ,,
		
		private static final Logger logger = LoggerFactory.getLogger(ProOrderDAOImpl.class);

		@Override
		public void insertMatInput(MaterialsVO ivo) {
			// 1,2 DB 연결
			// 3, SQL작성, pstmt
			// 4. SQL 실행
//			sqlSession.insert("com.itwillbs.mapper.MemberMapper"+".insertMember", parameter);
			sqlSession.insert(NAMESPACE + ".insertMatInput", ivo); // ". 주의 !!"
			logger.debug("자재입고 등록 완료");
		}

		@Override
		public List<MaterialsVO> inputMaterialList() {
			
			logger.debug("자재입고 목록 출력");
			List<MaterialsVO> materialInputList = sqlSession.selectList(NAMESPACE + ".materialInputList");
			return materialInputList;
		}
		

		@Override
		public MaterialsVO getMatInput(String material_code) {
			logger.debug("특정 자재 입고 게시물 조회");
			MaterialsVO resultVO = sqlSession.selectOne(NAMESPACE + ".getMatInput", material_code);
			return resultVO;
		}
		

		@Override
		public Integer updateMatInput(MaterialsVO uvo) {
			logger.debug("자재입고 수정 완료");
			return sqlSession.update(NAMESPACE + ".updateMatInput", uvo);
		}

		@Override
		public void deleteMatInput(String material_code) {
			logger.debug("특정 자재 입고 게시물 삭제");
			sqlSession.delete(NAMESPACE + ".deleteMatInput", material_code);
		}

		@Override
		public List<IntegrationCodeVO> matInputItemList() {
			logger.debug("특정 상품 목록 조회");
			List<IntegrationCodeVO> itemList = sqlSession.selectList(NAMESPACE + ".itemList"); 
			return itemList;
		}

		
		
		
		
		
		
		
}
