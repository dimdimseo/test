<%@ page import="java.util.*,dto.Review" %>
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

int boardNum =
Integer.parseInt(
request.getParameter("boardNum"));

String writer =
request.getParameter("writer");

int rating =
Integer.parseInt(
request.getParameter("rating"));

String content =
request.getParameter("content");

ArrayList<Review> reviewList =
(ArrayList<Review>)application.getAttribute("reviewList");

if(reviewList == null){
    reviewList = new ArrayList<Review>();
}

Review review =
new Review(
boardNum,
writer,
rating,
content
);

reviewList.add(review);

application.setAttribute(
"reviewList",
reviewList
);

response.sendRedirect(
"boardView.jsp?num="+boardNum
);
%>