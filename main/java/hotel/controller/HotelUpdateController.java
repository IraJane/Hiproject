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
	private final String gotoPage="redirect:hotelNow.der";
	
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
			System.out.println(newfilePath);
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
			else if(doWhat.equals("add")){
				if(originName.equals(hotel.getH_name())) {
					if(originFile.exists()==false) {
						originFile.mkdirs();
					}
					image+=hotelDao.getHotelOne(hotel.getH_num()).getH_image();
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
			}else {
				image+=hotel.getH_image();
			}
			hotel.setH_image(image);
			hotelDao.updateHotel(hotel);  
			System.out.println("호텔수정완료");
			
			int updateCnt=0;
			int deleteCnt=0;
			int insertCnt=0;
			
			for(int i=0;i<rooms.getType().length;i++) {
				String r_numStr=rooms.getNum()[i];
				String r_type=rooms.getType()[i];
				int r_price=rooms.getPrice()[i];
				int r_person=rooms.getPerson()[i];
				int r_stock=rooms.getStock()[i];
				String r_breakfast=rooms.getBreakfast()[i];
				int h_num=hotel.getH_num();
				
				if(!r_numStr.equals("")) {
					int r_num=Integer.parseInt(r_numStr);
					if(!r_type.equals("remove_thisroom")) {
						
						Room room=new Room(r_num,r_type,r_price,r_person,r_stock,r_breakfast);
						updateCnt=roomDao.updateRoom(room);
					}else {
						deleteCnt=roomDao.deleteRoom(r_num);
					}
				}else {
					Room room=new Room(r_type,r_price,r_person,r_stock,r_breakfast,h_num);
					insertCnt=roomDao.insertRoom(room);
				}
				
			}
			System.out.println("룸변경:"+updateCnt);
			System.out.println("룸삭제:"+deleteCnt);
			System.out.println("룸추가:"+insertCnt);
			
		
		return gotoPage;
	}
	
}