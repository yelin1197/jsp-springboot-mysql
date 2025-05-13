<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시글 작성</title>
</head>
<body>
<h2>✏️ 게시글 작성</h2>

<form method="post" action="/post">
    <label>제목: <input type="text" name="title" required></label><br>
    <label>내용: <textarea name="content" required></textarea></label><br>
    <label>작성자: <input type="text" name="author" required></label><br>
    <label>비밀번호: <input type="password" name="password" required></label><br>
    <button type="submit">등록</button>
</form>

<p><a href="/posts">← 목록으로</a></p>
</body>
</html>