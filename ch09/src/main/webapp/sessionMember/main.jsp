<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../common.css");</style>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
	if( id == null || id.equals("")) {
		response.sendRedirect("loginForm.jsp");
		return;
	}
%>
<%=id %>님 환영합니다<p>
<button onclick="location.href='logout.jsp'">로그아웃</button>
</body>
</html>