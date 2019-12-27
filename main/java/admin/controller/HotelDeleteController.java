package admin.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;
import hotel.model.Hotel;
import hotel.model.HotelDao;
import member.model.Member;

@Controller("adminHotelDeleteController")
public class HotelDeleteController {

	private final String command = "/deleteHotel.ad";
	private final String gotoPage = "redirect:/hotelNow.ad";
	private final String errPage = "redirect:/main.jsp";

	@Autowired
	private ServletContext application;
	@Autowired
	private HotelDao hotelDao;
	@Autowired
	private AdminDao adDao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam("h_num") int h_num, HttpSession session) {

		//ADMIN CHECK 
				if ((Member) session.getAttribute("loginfo") == null) {
					return errPage;
				}
				Member loginfo = (Member) session.getAttribute("loginfo");
				String adCheck = loginfo.getM_email();
				if (!adCheck.equals("admin@admin.com")) {
					return errPage;
				}
		//ADMIN CHECK END
				
		Hotel hotel = hotelDao.getHotelOne(h_num);
		int s_num = hotel.getS_num();

		String filePath = application.getRealPath("/resources/Hotelimages/" + hotel.getH_name());
		File file = new File(filePath);
		boolean isExists = file.exists();
		if (isExists) {
			if (file.isDirectory()) {
				File[] files = file.listFiles();
				for (int i = 0; i < files.length; i++) {
					if (files[i].delete()) {
						System.out.println(files[i].getName() + "삭제성공");
					} else {
						System.out.println(files[i].getName() + "삭제실패");
					}
				}
			} else if (file.delete()) {
				System.out.println("파일삭제 성공");
			} else {
				System.out.println("파일삭제 실패");
			}
		} else {
			System.out.println("삭제할 파일 없음");

		}
		adDao.deleteHotelRoom(h_num);
		adDao.deleteHotel(h_num);
		return gotoPage + "?s_num=" + s_num;
	}
}
