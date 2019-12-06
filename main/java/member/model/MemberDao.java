package member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberDao {
	private String namespace = "member.model.Member";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public void registerMem(Member member) {
		sqlSessionTemplate.insert(namespace+".registerMem", member);
	}
	
	public Member login(Member member) {
		Member members = sqlSessionTemplate.selectOne(namespace + ".login", member);

		return members;
	}

	public Member info(String m_email) {
		Member member = sqlSessionTemplate.selectOne(namespace + ".info", m_email);
		
		return member;
	}

	public void delete(String m_email) {
		sqlSessionTemplate.delete(namespace + ".delete", m_email);
	}

	public void update(Member member) {
		sqlSessionTemplate.update(namespace + ".update", member);
	}

}