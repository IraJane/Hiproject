package hotel.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hotel.model.Hotel;
import hotel.model.HotelDao;
import hotel.model.RoomDao;

@Controller
public class HotelDeleteController {

	private final String command = "/deleteHotel.ho";
	private final String getPage = "redirect:hotelNow.der";

	@Autowired
	private HotelDao hotelDao;

	@Autowired
	private RoomDao roomDao;

	@Autowired
	private ServletContext application;

	@RequestMapping(command)
	public String deleteHotel(@RequestParam("h_num") int h_num) {

		Hotel hotel = hotelDao.getHotelOne(h_num);
		String filePath = application.getRealPath("/resources/Hotelimages/" + hotel.getH_name());
		File file = new File(filePath);
		if (file.exists()) {
			if (file.isDirectory()) {  
				File[] files = file.listFiles();
				for (int i = 0; i < files.length; i++) {
					if (files[i].delete()) {
						System.out.println(files[i].getName() + "삭제성공");
					} else {
						System.out.println(files[i].getName() + "삭제실패");
					}
				}
			}
			if (file.delete()) {
				System.out.println("파일삭제 성공");
			} else {
				System.out.println("파일삭제 실패");
			}
		} else {
			System.out.println("파일이 존재하지 않습니다");
		}
		
		hotelDao.deleteHotel(h_num);
		roomDao.deleteHotelRoom(h_num);
		return getPage;
	}
}