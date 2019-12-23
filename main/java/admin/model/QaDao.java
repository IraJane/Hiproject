package admin.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSessionException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import admin.model.Qa;
import utility.Paging;

@Component("MyQa")
public class QaDao {
	private final String namespace = "admin.model.Admin";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int insertQa(Qa qa) {
		int cnt = sqlSessionTemplate.insert(namespace+".insertQa", qa);
		return cnt;
	}

	public int getQaCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".getQaCount", map);
		return cnt;
	}

	public List<Qa> getQaList(Paging pageInfo, Map<String, String> map) {
		RowBounds row = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		List<Qa> qnaList = sqlSessionTemplate.selectList(namespace + ".getQaList", map, row);
		return qnaList;
	}

//	public Qna selectQna(int num) {
//		Qna qna = sqlSessionTemplate.selectOne(namespace + ".selectQna", num);
//		System.out.println(qna);
//		return qna;
//	}

	public int updateQa(int q_num) {
		int cnt = sqlSessionTemplate.update(namespace + ".updateQa", q_num);
		return cnt;
	}

	
	public int deleteQa(int q_num) {
		int cnt = sqlSessionTemplate.delete(namespace + ".deleteQa", q_num);
		return cnt;
		
	}

	public int getCountNew() {
		int cnt = sqlSessionTemplate.selectOne(namespace + ".getCountNew");
		return cnt;
		
	}
	
	
	/*public boolean deleteQa(int q_num) {
		int cnt = sqlSessionTemplate.delete(namespace + ".deleteQa", q_num);
		boolean result;
		if(cnt==0) {
			result = false;
		} 
		else {
			result = true;			
		}
		return result;
	}*/

	
	
	
	
}