package member.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myReviewComposite")
public class ReviewCompositeDao {
	private String namespace = "member.model.ReviewComposite";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<ReviewComposite> getReviewList(int h_num) {
		System.out.println("1 h_num: " + h_num);
		List<ReviewComposite> review = sqlSessionTemplate.selectList(namespace + ".getReviewList", h_num);
		System.out.println("2");
		return review;
	}
/*
	public Integer getAvg(int h_num) {
		// TODO Auto-generated method stub
		int cnt = sqlSessionTemplate.selectOne(namespace + ".getAvg",h_num);
		return cnt;
	}
	*/



}