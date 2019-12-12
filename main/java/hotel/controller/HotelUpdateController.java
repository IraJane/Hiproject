package hotel.controller;

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


@Controller
public class HotelUpdateController {

	private final String command="/updateHotel.ho";
	private final String getPage="hotelUpdateForm";
	private final String gotoPage="redirect:hotelNow.ho";
	
	@Autowired
	private HotelDao hotelDao;
	
	@Autowired
	private RoomDao roomDao;
	
	@Autowired
	ServletContext application;
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String doUpdateGet(@RequestParam("h_num") int h_num,Model model) {
		
		Hotel hotel=hotelDao.getHotelOne(h_num);
		List<Room> rooms=roomDao.getRoomList(hotel);
		hotel.setRooms(rooms);
		model.addAttribute("hotel",hotel);
		return getPage;
	}
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String doUpdatePost(
			@RequestParam("filebtn") String doWhat,
			@RequestParam("originName") String originName,
			Room rooms,Hotel hotel,
			MultipartHttpServletRequest mpfRequest,HttpSession session) {
			
			List<MultipartFile> fileList=mpfRequest.getFiles("file");
			String originfilePath=application.getRealPath("/resources/Hotelimages/"+originName);
			String newfilePath=application.getRealPath("/resources/Hotelimages/"+hotel.getH_name());
			File originFile=new File(originfilePath);
			File newFile=new File(newfilePath);
			String image="";
			if(doWhat.equals("change")) {
				if(originFile.exists()) {
					if(originFile.isDirectory()) {
						File[] files=originFile.listFiles();
						for(int i=0;i<files.length;i++) {
							if(files[i].delete()) {
								System.out.println(files[i].getName()+"삭제성공");
							}else {
								System.out.println(files[i].getName()+"삭제실패");
							}
						}
					}
					if(originFile.delete()) {
						System.out.println("파일삭제 성공");
					}else {
						System.out.println("파일삭제 실패");
					}
				}else {
					System.out.println("파일이 존재하지 않습니다.");
				}
				if(newFile.exists()==false) {
					newFile.mkdirs();
				}
				for(int i=0;i<fileList.size();i++) {
					newFile=new File(newfilePath+File.separator+fileList.get(i).getOriginalFilename());
					try {
						fileList.get(i).transferTo(newFile);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					image+=fileList.get(i).getOriginalFilename()+";";
				}//fileList 추가
			}//change 
			else {
				if(originName.equals(hotel.getH_name())) {
					if(originFile.exists()==false) {
						originFile.mkdirs();
					}
					image+=hotel.getH_image();
					for(int i=0;i<fileList.size();i++) {
						originFile=new File(originfilePath+File.separator+fileList.get(i).getOriginalFilename());
						try {
							fileList.get(i).transferTo(originFile);
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
						image+=fileList.get(i).getOriginalFilename()+";";
					}
				}else {
					if(originFile.exists()) {
						originFile.renameTo(newFile);
					}
					image+=hotel.getH_image();
					for(int i=0;i<fileList.size();i++) {
						newFile=new File(newfilePath+File.separator+fileList.get(i).getOriginalFilename());
						try {
							fileList.get(i).transferTo(newFile);
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
						image+=fileList.get(i).getOriginalFilename()+";";
					}
				}
			}
			hotel.setH_image(image);
			hotelDao.updateHotel(hotel);
		///room 
		return gotoPage;
	}
	
}