<%@ page import="java.util.*,dto.Board,dto.Review" %>
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int num =
Integer.parseInt(request.getParameter("num"));

ArrayList<Board> boardList =
(ArrayList<Board>)application.getAttribute("boardList");

ArrayList<Review> reviewList =
(ArrayList<Review>)application.getAttribute("reviewList");

if(reviewList == null){
    reviewList = new ArrayList<Review>();
}

Board board = null;

for(Board b : boardList){
    if(b.getNum()==num){
        board=b;
        break;
    }
}

double avg=0;
int cnt=0;

for(Review r : reviewList){
    if(r.getBoardNum()==num){
        avg += r.getRating();
        cnt++;
    }
}

if(cnt>0){
    avg/=cnt;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
</head>
<body>

<h1><%=board.getTitle()%></h1>

작성자 : <%=board.getWriter()%>

<hr>

<%=board.getContent()%>

<hr>

<h3>평균 별점</h3>

<%=String.format("%.1f",avg)%>

<hr>

<h3>리뷰 작성</h3>

<form action="reviewProcess.jsp"
method="post">

<input type="hidden"
name="boardNum"
value="<%=num%>">

작성자
<input type="text"
name="writer">

<br><br>

별점

<select name="rating">
<option value="1">1점</option>
<option value="2">2점</option>
<option value="3">3점</option>
<option value="4">4점</option>
<option value="5">5점</option>
</select>

<br><br>

<textarea
name="content"
rows="5"
cols="50"></textarea>

<br><br>

<input type="submit"
value="리뷰등록">

</form>

<hr>

<h3>리뷰 목록</h3>

<%
for(Review r : reviewList){

if(r.getBoardNum()==num){
%>

<b><%=r.getWriter()%></b>

(별점 :
<%=r.getRating()%>/5)

<br>

<%=r.getContent()%>

<hr>

<%
}
}
%>

<a href="boardList.jsp">
목록으로
</a>

</body>
</html>