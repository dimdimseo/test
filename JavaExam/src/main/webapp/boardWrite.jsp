<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>

<h2>맛집 등록</h2>

<form action="boardWriteProcess.jsp" method="post">

제목<br>
<input type="text" name="title">

<br><br>

작성자
<input type="text" name="writer">

<br><br>

내용<br>
<textarea name="content"
rows="10"
cols="50"></textarea>

<br><br>

<input type="submit" value="등록">

</form>

</body>
</html>