<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int player = (int)request.getAttribute("player");
	int computer = (int)request.getAttribute("computer");
	String result = (String)request.getAttribute("result");
%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>じゃんけん結果</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

	<div id="showresult">
		<h1>じゃんけん結果 :</h1>
		<h2><%= result %></h2>
	</div>

	<div id="result">

		<div id="player">
			<h2>プレイヤー</h2>
			<%
				if(player == 1) {
			%>
				<img src="${pageContext.request.contextPath}/image/gu.png" alt="グー">
			<%
				} else if(player == 2){
			%>
				<img src="${pageContext.request.contextPath}/image/choki.png" alt="チョキ">
			<%
				} else if(player == 3) {
			%>
				<img src="${pageContext.request.contextPath}/image/pa.png" alt="パー">
			<%
				}
			%>
		</div>

		<h2 id="vs">VS</h2>


		<div id="computer">
			<h2>コンピューター</h2>
			<%
				if(computer == 1) {
			%>
				<img src="${pageContext.request.contextPath}/image/gu.png" alt="グー">
			<%
				} else if(computer == 2){
			%>
				<img src="${pageContext.request.contextPath}/image/choki.png" alt="チョキ">
			<%
				} else if(computer == 3) {
			%>
				<img src="${pageContext.request.contextPath}/image/pa.png" alt="パー">
			<%
				}
			%>
		</div>

	</div>

	<form method="GET" action="${pageContext.request.contextPath}/top" id="result-form">
		<input type="submit" value="もう一回勝負する！">
	</form>

</body>
</html>