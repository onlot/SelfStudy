<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>세션 읽기</h2>
ID : <%=session.getAttribute("id") %><p>
암호 : <%=session.getAttribute("pass") %>
</body>
</html>