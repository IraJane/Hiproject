package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.Member;
import member.model.MemberDao;

@Controller
public class MemberEmailController {
	private final String command = "findPw.mem";
	private final String getPage = "findPwForm";
	private final String goPage = "redirect:/main.jsp";
	
	private static int count = 0;
	
	public MemberEmailController() {
		count++;
		System.out.println("MemberEmailController ====== 생성됨....... : "  + count);
	}
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberDao memDao;

	@RequestMapping(value=command, method=RequestMethod.GET)
	public String mailSending() {
		return getPage;
	}
	
	
	/* mailSending 코드 */
	@RequestMapping(value = command, method=RequestMethod.POST)
	public String mailSending(Member member, HttpServletResponse response) throws IOException {
		
		String m_email = member.getM_email();
		System.out.println(m_email);
		
		Member check = memDao.checkMail(m_email);
		
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 8; i++) {
		    int rIndex = rnd.nextInt(2);
		    switch (rIndex) {
		    case 0:
		        // a-z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
		        break;
		        
		    case 1:
		        // 0-9
		        temp.append((rnd.nextInt(10)));
		        break;
		    }
		}
		
		String npassword = temp.toString();
		
		member.setM_password(npassword);
		
		memDao.updatePw(member);
		
		
		if(check != null) {
		
		String setfrom = "joongang601@naver.com";
		String tomail = m_email; // 받는 사람 이메일
		String title = "임시 비밀번호 입니다"; // 제목
		String content = "";
		content += "임시 비밀번호는";
		content += npassword;
		content += "입니다. 로그인 후 변경해 주세요";
		// 내용
		
		System.out.println("content : " + content);
		try {
			MimeMessage message = mailSender.createMimeMessage();	
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용
			
			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
			}
		return goPage;
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter writer;
			writer = response.getWriter();
			writer.print("<script type='text/javascript'>");
			writer.print("alert('존재하지 않는 이메일입니다')");
			writer.print("</script>");
			writer.flush();
			
			return getPage;
		}
	}
	
}