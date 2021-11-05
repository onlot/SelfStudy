<%@page import="ch09.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	MemberDao md = MemberDao.getInstance(); //싱글톤으로 객체 생성
	int result = md.loginChk(id,password);
	if(result > 0) {
		session.setAttribute("id", id);
		response.sendRedirect("main.jsp");
	}	else if(result == 0) {
%>
<script type="text/javascript">
	alert("암호가 틀렸습니다");
	history.go(-1);
</script>
<%	}	else { %>
<script type="text/javascript">
	alert("없는 아이디입니다.");
	history.go(-1);
</script>
<%	} %>

</body>
</html>