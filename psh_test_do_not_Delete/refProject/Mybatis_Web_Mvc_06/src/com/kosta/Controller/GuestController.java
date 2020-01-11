package com.kosta.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta.DAO.GuestDAO;
import com.kosta.DTO.GuestDTO;

@WebServlet("/guest.do")
public class GuestController extends HttpServlet {
 private static final long serialVersionUID = 1L;

 public GuestController() {
  super();
  // TODO Auto-generated constructor stub
 }

 protected void service(HttpServletRequest request, HttpServletResponse response)
   throws ServletException, IOException {
  request.setCharacterEncoding("UTF-8");
  String cmd = request.getParameter("cmd");
  // localhost:8080/website/guest.do?cmd=write
  System.out.println("파라메터 : " + cmd);
  if (cmd.equals("write")) {
   write(request, response);
  } else if (cmd.equals("list")) {
   System.out.println("LIST gogo");
   list(request, response);
  } else if (cmd.equals("delete")) {
   System.out.println("DELETE gogo");
   delete(request, response);
  } else if (cmd.equals("update")) {
   System.out.println("DELETE gogo");
   update(request, response);
  } else if (cmd.equals("detail")) {
   System.out.println("DETAIL gogo");
   detail(request, response);
  } else if (cmd.equals("search")) {
   System.out.println("SEARCH gogo");
   search(request, response);
  } else if (cmd.equals("search2")) {
   System.out.println("SEARCH_2 gogo");
   search2(request, response);
  }

 }

 public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  GuestDAO dao = new GuestDAO();
  List<GuestDTO> list = dao.getList();
  if (list != null) {
   request.setAttribute("list", list);
   request.getRequestDispatcher("/list.jsp").forward(request, response);
  } else {
   response.sendRedirect("error.jsp");
  }
 }

 public void write(HttpServletRequest request, HttpServletResponse response) throws IOException {
  String name = request.getParameter("name");
  String pwd = request.getParameter("pwd");
  String email = request.getParameter("email");
  String home = request.getParameter("home");
  String content = request.getParameter("content");
  System.out.println(name + "/" + pwd + "/" + email + "/" + home + "/" + content);

  GuestDTO dto = new GuestDTO(0, name, pwd, email, home, content, null);
  GuestDAO dao = new GuestDAO();
  System.out.println("INSERT");
  int rowcount = dao.insert(dto);
  if (rowcount > 0) {
   response.sendRedirect("guest.do?cmd=list");
  } else {
   response.sendRedirect("error.jsp");
  }

 }

 public void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  System.out.println("Detail gogo : " + request.getParameter("no"));
  String no = request.getParameter("no");
  GuestDAO dao = new GuestDAO();
  GuestDTO guest = dao.DetailList(Integer.parseInt(no));
  if (guest != null) {
   request.setAttribute("detail", guest);
   request.getRequestDispatcher("/detail.jsp").forward(request, response);
  } else {
   response.sendRedirect("error.jsp");
  }

 }

 private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  String no = request.getParameter("no");
  System.out.println("삭제하기" + no);
  GuestDAO dao = new GuestDAO();
  int rowcount = dao.delete(Integer.parseInt(no));
  if (rowcount > 0) {
   list(request, response);
  }
 }

 public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  String no = request.getParameter("no");
  String name = request.getParameter("name");
  String email = request.getParameter("email");
  String home = request.getParameter("home");
  String content = request.getParameter("content");
  System.out.print(no + "/" + name + "/" + email + "/" + home + "/" + content);
  GuestDTO dto = new GuestDTO(Integer.parseInt(no), name, null, email, home, content, null);
  GuestDAO dao = new GuestDAO();
  int rowcount = dao.update(dto);
  if (rowcount > 0) {
   list(request, response);
  }
 }

 public void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  // 컬럼명
  String column = request.getParameter("column"); // name, home,email
  String keyvalue = request.getParameter("keyvalue"); // 홍길동
  System.out.println(column + " / " + keyvalue);

  Map<String, String> map = new HashMap<>(); // collection
  map.put("column", column); // column : name or email or home
  map.put("search", keyvalue); // keyvalue : 홍길동

  GuestDAO dao = new GuestDAO();
  List<GuestDTO> list = dao.getSearchList(map);
  if (list != null) {
   request.setAttribute("list", list);
   request.getRequestDispatcher("/SearchList.jsp").forward(request, response);
  } else {
   response.sendRedirect("error.jsp");
  }

 }

 public void search2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

  String name = request.getParameter("name");
  String email = request.getParameter("email");
  String home = request.getParameter("home");
  String keyvalue = request.getParameter("keyvalue");
  System.out.println(name + "-" + email + "-" + home + "-" + keyvalue);

  Map<String, String> map = new HashMap<>(); // collection
  map.put("name", name);
  map.put("email", email);
  map.put("home", home);
  map.put("search", keyvalue);

  GuestDAO dao = new GuestDAO();
  List<GuestDTO> list = dao.getSearchList2(map);
  if (list != null) {
   request.setAttribute("list", list);
   request.getRequestDispatcher("/SearchList.jsp").forward(request, response);
  } else {
   response.sendRedirect("error.jsp");
  }

 }

 protected void doGet(HttpServletRequest request, HttpServletResponse response)
   throws ServletException, IOException {
  // TODO Auto-generated method stub
 }

 protected void doPost(HttpServletRequest request, HttpServletResponse response)
   throws ServletException, IOException {
  // TODO Auto-generated method stub
 }

}