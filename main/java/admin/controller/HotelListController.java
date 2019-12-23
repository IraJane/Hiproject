package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;
import hotel.model.Hotel;
import hotel.model.Room;

@Controller
public class HotelListController {

	private final String command = "listHo.ad";
	private final String getPage = "adHotelList";

	@Autowired
	private AdminDao adDao;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam(value = "num", required = true) int num,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "hname", required = false) String hname, 
			Model model) {
		
		if (hname!=null) {
			List<Room> roomList = adDao.getRoomList(hname);
			model.addAttribute("roomList", roomList);
		}
		List<Hotel> hotelList = adDao.getHotelList(num);
		model.addAttribute("num", num);
		model.addAttribute("email", email);
		model.addAttribute("hotelList", hotelList);

		return getPage;
	}

}
