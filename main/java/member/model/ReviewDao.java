package member.model;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("myReview")
public class ReviewDao {
	private String namespace = "member.model.Review";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	

	public void writeReview(Review review) {
		sqlSessionTemplate.insert(namespace+".writeReview", review);
		
	}


	public List<Review> getReviewList(int h_num) {
		List<Review> reviewList=sqlSessionTemplate.selectList(namespace+".getReviewList", h_num);
		return reviewList;
	}


	public float avgStar(int h_num) {
	      float avg = sqlSessionTemplate.selectOne(namespace+".avgStar", h_num);
	      return avg;
	   }

}