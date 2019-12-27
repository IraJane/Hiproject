package admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import hotel.model.Hotel;
import hotel.model.HotelDao;
import hotel.model.Room;
import hotel.model.RoomDao;
import member.model.Member;

@Controller("adminHotelInsertController")
public class HotelInsertController {

	private final String command = "/insertHotel.ad";
	private final String getPage = "adHotelInsertForm";
	private final String gotoPage = "redirect:/hotelNow.ad";
	private final String errPage = "redirect:/main.jsp";

	@Autowired
	private HotelDao hotelDao;
	@Autowired
	private RoomDao roomDao;
	@Autowired
	ServletContext application;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam("s_num") int s_num, Model model, HttpSession session) {
	
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

		model.addAttribute("s_num", s_num);
		return getPage;
	}

	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doAction(@RequestParam("s_num") int s_num, 
			Hotel hotel, Room rooms,
			MultipartHttpServletRequest mpfRequest, HttpSession session) {
		
		//ADMIN CHECK 
		if ((Member) session.getAttribute("loginfo") == null) {
			return errPage;
		}
		Member loginfo = (Member) session.getAttribute("loginfo");
		String adCheck = loginfo.getM_email();
		if (!adCheck.equals("admin@admin.com")) {
			return errPage;
		}
		// ADMIN CHECK END
		
		String filePath = application.getRealPath("/resources/Hotelimages/" + hotel.getH_name());
		List<MultipartFile> fileList = mpfRequest.getFiles("file");

		File file = new File(filePath);
		System.out.println(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}
		String image = "";
		for (int i = 0; i < fileList.size(); i++) {

			file = new File(filePath + File.separator + fileList.get(i).getOriginalFilename());
			try {
				fileList.get(i).transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			image += fileList.get(i).getOriginalFilename() + ";";
		}
		hotel.setH_image(image);
		int hotelcnt = hotelDao.insertHotel(hotel);
		System.out.println("호텔등록:" + hotelcnt);

		int roomcnt = 0;
		for (int i = 0; i < rooms.getType().length; i++) {
			String type = rooms.getType()[i];
			int price = rooms.getPrice()[i];
			int person = rooms.getPerson()[i];
			int stock = rooms.getStock()[i];
			String breakfast = rooms.getBreakfast()[i];
			int h_num = hotel.getH_num();

			Room room = new Room(type, price, person, stock, breakfast, h_num);
			roomcnt += roomDao.insertRoom(room);
		}
		System.out.println("객실 등록:" + roomcnt);

		return gotoPage + "?s_num=" + hotel.getS_num();
	}
}
