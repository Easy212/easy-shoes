<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<!-- 로그인하지않았을 경우 접근불가, 로그인 페이지로 이동하게 만들기 // 쿠키나 세션? -->

  <header>
    <!-- 헤더 삽입하기  -->
  </header>

  <main class="main_wrapper">
    <h2>마이페이지</h2>
    <div class="main_container">
      <h2><%=session.getAttribute("id")%>님 환영합니다.</h2>
        <!-- name부분 추후 수정 -->
      <div class="modMember">
        <a href="${contextPath}/member/cfmPwdMod.do">회원정보 수정/</a>
        <a href="${contextPath}/member/cfmPwdDel.do">탈퇴</a>
      </div> <!-- modMember -->

      <div class="bookingList">
        <h3>예매내역</h3>
        <table>
          <!-- 예매내역 추후 연동/추가 -->
        </table>
      </div>

      <div class="QnA">
        <h3>Q&A</h3>
        <table>
          <!-- QnA 추후 연동/추가 -->
        </table>
      </div>

    </div> <!-- //main_container -->
  </main> <!-- //main_wrapper -->

  <footer>
    <!-- 푸터 삽입 -->
  </footer>
</body>
</html>