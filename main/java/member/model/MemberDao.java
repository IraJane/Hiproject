package member.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

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

	public void delete(Member member) {
		sqlSessionTemplate.delete(namespace + ".delete", member);
	}

	public void update(Member member) {
		sqlSessionTemplate.update(namespace + ".update", member);
	}

	public List<Member> getAllMembers() {
		// TODO Auto-generated method stub
		List<Member> mem = sqlSessionTemplate.selectList(namespace +".getAllMembers");
		return mem;
	}
	
	public Member checkMail(String m_email) {
		Member check = sqlSessionTemplate.selectOne(namespace + ".checkMail", m_email);
		
		return check;
	}

	public void updatePw(Member member) {
		sqlSessionTemplate.update(namespace + ".updatePw", member);
		
	}

}