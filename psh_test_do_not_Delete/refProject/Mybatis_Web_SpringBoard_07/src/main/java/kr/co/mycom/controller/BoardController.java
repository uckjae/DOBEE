package kr.co.mycom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mycom.model.BoardDAO;
import kr.co.mycom.model.BoardDTO;
import kr.co.mycom.model.UserDto;

@Controller
public class BoardController {

	@Autowired
	private SqlSession sqlsession;

	// 요청 Url 맞는 method 구현 하고 처리
	@RequestMapping("/writeform.htm")
	public String writeForm() {
		return "writeform";

	}

	@RequestMapping("/write.htm")
	public String write(BoardDTO dto) {
		// 핵심 (KEY POINT)
		// sqlsession.insert(dto);
		// sqlsession.select(statement, handler);
		// sqlsession.selectList("board.selectboard")
		
		
		
		BoardDAO boardDao = sqlsession.getMapper(BoardDAO.class);
		// mapper xml 파일과 DAO interface 동기화
		// 인터페이스가 가지는 자원은 실행 : mapper 가 실행
		// 전제 : 1. namespace , 2. id=method
		boardDao.insertBoard(dto);
		return "redirect:/list.htm";
	}

	@RequestMapping("/insertdto.htm")
	public String insertUser() {
		
		UserDto dto1 = new UserDto();
		dto1.setUsername("홍길동");
		dto1.setAge(25);
		
		UserDto dto2 = new UserDto();
		dto2.setUsername("woniper");
		dto2.setAge(26);
		
		List<UserDto> list = new ArrayList<UserDto>();
		list.add(dto1);
		list.add(dto2);
		
		HashMap<String, Object> map = new  HashMap<String, Object>();
		map.put("insertlist", list);
		
		System.out.println(map.get("insertlist"));
		
		BoardDAO boardDao = sqlsession.getMapper(BoardDAO.class);
		boardDao.insertUserDto(map);
		return  "redirect:/list.htm";
	}
	
	
	
	
	
	@RequestMapping("/list.htm")
	public String list(Model model, String pg) {
		// System.out.println("list 페이지");
		// request.getParameter("pg")
		int page = 1;
		String Strpg = pg;
		if (Strpg != null) {
			page = Integer.parseInt(Strpg);
		}

		int rowSize = 10;
		int start = (page * rowSize) - (rowSize - 1);
		int end = page * rowSize;

		BoardDAO boardDao = sqlsession.getMapper(BoardDAO.class);
		int total = boardDao.getBoardCount();

		System.out.println("start : " + start);
		System.out.println("end : " + end);
		System.out.println("total : " + total);

		// ... 목록
		int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수
		// int totalPage = total/rowSize + (total%rowSize==0?0:1);
		System.out.println("페이지수 : " + allPage);

		int block = 5; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9]
		// [10] >>
		int fromPage = ((page - 1) / block * block) + 1; // 보여줄 페이지의 시작
		// ((1-1)/10*10)
		int toPage = ((page - 1) / block * block) + block; // 보여줄 페이지의 끝
		if (toPage > allPage) { // 예) 20>17
			toPage = allPage;
		}

		// start , end
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<BoardDTO> list = boardDao.getBoardList(map);

		// request.setAttribute("list",list) 같은 원리
		model.addAttribute("list", list);
		model.addAttribute("pg", page);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		return "list";

	}

	@RequestMapping("/read.htm")
	public String read(int num, int pg, Model model) {

		BoardDAO boardDao = sqlsession.getMapper(BoardDAO.class);
		// 조회증가
		boardDao.updateHit(num);
		// 상세조회
		BoardDTO dto = boardDao.getBoard(num);
		// model 필요한 것 담고
		model.addAttribute("b", dto);
		model.addAttribute("pg", pg);
		return "read"; // read.jsp
	}

	@RequestMapping("/updateform.htm")
	public String updateForm(int num, int pg, Model model) {

		// 기존 화면 내용 출력
		// getBoard()
		BoardDAO boardDao = sqlsession.getMapper(BoardDAO.class);
		BoardDTO dto = boardDao.getBoard(num);
		// model 담기
		model.addAttribute("b", dto);
		model.addAttribute("pg", pg);
		return "updateform"; // updateform.jsp
	}

	@RequestMapping("/update.htm")
	public String update(BoardDTO dto, int pg) {

		// update : return 0(실패) / return 1 (성공)
		BoardDAO boardDao = sqlsession.getMapper(BoardDAO.class);
		int result = boardDao.updateBoard(dto);
		// 결과 받기
		String view = "";
		if (result == 0) {
			view = "fail"; // fail.jsp
		} else {
			view = "redirect:list.htm?pg=" + pg;
		}

		// 실패 : fail.jsp
		// 성공 : 원하는 페이지
		return view;
	}

	// delete (view , 처리)
	@RequestMapping("/deleteform.htm")
	public String deleteform() {
		return "deleteform";
	}

	@RequestMapping("delete.htm")
	public String delete(BoardDTO dto, int pg) {
		BoardDAO boardDao = sqlsession.getMapper(BoardDAO.class);
		int result = boardDao.deleteBoard(dto);

		String view = "";

		if (result == 0) {
			view = "fail"; // fail.jsp
		} else {
			view = "redirect:list.htm?pg=" + pg;
		}

		return view;
	}

	@RequestMapping("/replyform.htm")
	public String replyform(int num, Model model) {
		BoardDAO boardDao = sqlsession.getMapper(BoardDAO.class);
		BoardDTO dto = boardDao.getBoard(num);
		model.addAttribute("b", dto);

		return "replyform"; // replyform.jsp
	}

	@RequestMapping("/reply.htm")
	public String reply(BoardDTO dto, int pg) {

		BoardDAO boardDao = sqlsession.getMapper(BoardDAO.class);
		boardDao.updateSort(dto);
		// 예 ) 2번글 : sort(step) 3,4,5 > 4,5,6
		dto.setSort(dto.getSort() + 1); // 3번
		dto.setTab(dto.getTab() + 1);

		boardDao.insertReply(dto);
		return "redirect:list.htm?pg=" + pg;

	}

	@RequestMapping("/create.htm")
	public String createtable(BoardDTO dto) {
		BoardDAO boardDao = sqlsession.getMapper(BoardDAO.class);
		dto.setTname("job");
		boardDao.createTable(dto);
		return "redirect:list.htm";
	}

}
