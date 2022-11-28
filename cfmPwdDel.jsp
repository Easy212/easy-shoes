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
  <title>회원탈퇴_비밀번호확인</title>
</head>
<body>
  <header>
    <!-- 헤더 삽입하기  -->
  </header>

  <main class="main_wrapper">
    <h2>회원탈퇴</h2>
    <div class="main_container">
      <h3>회원탈퇴 전 아래 사항을 꼭 확인해주세요</h3>
      <p>‣ 회원 탈퇴를 신청하시면 즉시 회원의 모든 정보가 삭제됩니다.</p>
      <p>‣ QnA 게시판에 등록된 게시물은 탈퇴 후에도 삭제되지않습니다. <br> 삭제를 원하시는 경우 반드시 직접 삭제 후 탈퇴를 신청해주시기 바랍니다.</p>
      <form action="${contextPath}/member/cfmPwdForm_del.do">
      	<input type="hidden" name="session_id" value="<%=session.getAttribute("id")%>">
        <input type="password" name="pw" placeholder="비밀번호를 입력해주세요">
        <input type="submit" value="회원탈퇴">
      </form>
    </div> <!-- //main_container -->
  </main> <!-- //main_wrapper -->

  <footer>
    <!-- 푸터 삽입 -->
  </footer>
</body>
</html>