<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../common.css");</style>
<script type="text/javascript">
	function chk() {
		if(frm.password.value != frm.password2.value) {
			alert("비밀번호가 다릅니다");
			frm.password.focus();
			frm.password.value="";
			frm.password2.value="";
			return false();
		}
	}
</script>
</head>
<body>
<form action = "insert.jsp" name="frm" onsubmit="return chk()">
<table><caption>회원 등록</caption>
	<tr><th>아이디</th><td><input type="text" name="id" required="required" autofocus="autofocus"></td></tr>
	<tr><th>비밀번호</th><td><input type="password" name="password" required="required"></td></tr>
	<tr><th>비밀번호확인</th><td><input type="password" name="password2"></td></tr>
	<tr><th>이름</th><td><input type="text" name="name"></td></tr>
	<tr><th colspan="2"><input type="submit" value="확인"></th></tr>
</table>
</form>
</body>
</html>