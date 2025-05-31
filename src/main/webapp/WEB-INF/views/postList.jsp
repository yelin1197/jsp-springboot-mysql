<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 목록</title>
</head>
<body>
<h1>전체 게시글</h1>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>제목</th>
        <th>내용</th>
        <th>작성일</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="post" items="${posts}">
        <tr>
            <td>${post.id}</td>
            <td>${post.title}</td>
            <td>${post.content}</td>
            <td>${post.createdAt}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="/post/new">글 작성하기</a>
</body>
</html>
