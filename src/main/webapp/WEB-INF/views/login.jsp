<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
</head>
<body>
<h2>로그인 페이지</h2>

<!-- 로그인 실패 메시지 출력 -->
<c:if test="${not empty error}">
    <p style="color:red;">${error}</p>
</c:if>

<form method="post" action="/login">
    <label>아이디: <input type="text" name="username" required></label><br>
    <label>비밀번호: <input type="password" name="password" required></label><br>
    <button type="submit">로그인</button>
</form>
<p><a href="/register">회원가입 하러가기</a></p>
</body>
</html>
