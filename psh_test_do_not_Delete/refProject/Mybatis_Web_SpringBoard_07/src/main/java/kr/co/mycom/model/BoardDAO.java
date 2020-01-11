package kr.co.mycom.model;

import java.util.HashMap;
import java.util.List;

public interface BoardDAO {
 //메서드 정의
 //CRUD 기반
 int insertBoard(BoardDTO dto);
 int updateBoard(BoardDTO dto);
 int deleteBoard(BoardDTO dto);
 
 List<BoardDTO> getBoardList(HashMap map);
 BoardDTO getBoard(int num);
 
 void updateHit(int num); //조회수 증가
 int getBoardCount(); //전체 글 수
 
 void insertReply(BoardDTO dto); //답변처리
 void updateSort(BoardDTO dto); //답변 처리(step(sort) 값 변경)
 
 void createTable(BoardDTO dto);
 
 
 void insertUserDto(HashMap map);
}
