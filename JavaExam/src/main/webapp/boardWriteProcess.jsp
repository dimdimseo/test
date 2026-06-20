<%@ page import="java.util.*,dto.Board" %>
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

String title = request.getParameter("title");
String writer = request.getParameter("writer");
String content = request.getParameter("content");

ArrayList<Board> boardList =
(ArrayList<Board>)application.getAttribute("boardList");

if(boardList == null){
    boardList = new ArrayList<Board>();
}

int num = boardList.size()+1;

Board board =
new Board(num,title,writer,content);

boardList.add(board);

application.setAttribute("boardList", boardList);

response.sendRedirect("boardList.jsp");
%>