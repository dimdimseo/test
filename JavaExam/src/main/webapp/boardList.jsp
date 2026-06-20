<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Board" %>

<%
ArrayList<Board> boardList =
    (ArrayList<Board>) application.getAttribute("boardList");

if(boardList == null){
    boardList = new ArrayList<Board>();
    application.setAttribute("boardList", boardList);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안성 맛집 게시판</title>
</head>
<body>

<h1>안성 맛집 게시판</h1>

<p>
    <a href="boardWrite.jsp">글쓰기</a>
</p>

<hr>

<table border="1" width="700">
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
    </tr>

<%
for(Board b : boardList){
%>

    <tr>
        <td><%= b.getNum() %></td>

        <td>
            <a href="boardView.jsp?num=<%= b.getNum() %>">
                <%= b.getTitle() %>
            </a>
        </td>

        <td><%= b.getWriter() %></td>
    </tr>

<%
}
%>

</table>

</body>
</html>