package com.recetA.domain;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.recetA.database.SqlSessionManager;
import com.recetA.domain.Process;
public class ProcessDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	//과정 순서, 과정 설명, 과정 이미지 출력
	public int selectDetailRecipe(String b_code) {
		int cnt = 0;
		try {
			cnt = sqlSession.update("selectRecipedetail2", b_code);

			if (cnt != 0) {
				System.out.println("상세 레시피 공개 성공");
				sqlSession.commit();
			} else {
				System.out.println("상세 레시피 공개 실패");
				sqlSession.rollback();
			}
		} finally {
			sqlSession.close();
		} // finally 끝
		return cnt;
	} //상세 레시피 뿌리기 끝
	
}
