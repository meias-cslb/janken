<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String message = (String)request.getAttribute("message");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>じゃんけん</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<h1>じゃんけん</h1>

	<%
		if(message != null) {
	%>
		<div id="error"><%= message %></div>
	<%
		}
	%>

	<form method="GET" action="${pageContext.request.contextPath}/result">
		<div>
			<p><label><input type="radio" name="hand" value="1">
						<img src="${pageContext.request.contextPath}/image/gu.png" alt="グー"></label></p>
			<p><label><input type="radio" name="hand" value="2">
						<img src="${pageContext.request.contextPath}/image/choki.png" alt="チョキ"></label></p>
			<p><label><input type="radio" name="hand" value="3">
						<img src="${pageContext.request.contextPath}/image/pa.png" alt="パー"></label></p>
		</div>
		<input type="submit" value="Let's Fight!">
	</form>

</body>
</html>