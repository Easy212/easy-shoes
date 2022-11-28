<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원정보 수정_비밀번호확인</title>
</head>
<body>
  <header>
    <!-- 헤더 삽입하기  -->
  </header>

  <main class="main_wrapper">
    <div class="main_container">
      <h3>비밀번호 확인</h3>
      <p>회원님의 개인정보 보호를 위해 비밀번호를 다시 확인합니다.</p>
      <form action="${contextPath}/member/cfmPwdForm_mod.do" method="post">
      	<input type="hidden" name="session_id" value="<%=session.getAttribute("id")%>">
      	<!-- 아이디는 세션값으로 받아 올 수 있도록 함 (사용자에게는 노출x)-->
        <input type="password" name="pw" placeholder="비밀번호를 입력해주세요">
        <input type="submit" value="확인">
      </form>
    </div> <!-- //main_container -->
  </main> <!-- //main_wrapper -->

  <footer>
    <!-- 푸터 삽입 -->
  </footer>
</body>
</html>