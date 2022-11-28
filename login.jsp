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
  <title>로그인</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function moveToJoin(obj) {
		obj.action="${contextPath}/member/join.do";
		obj.submit();
	}

</script>
</head>
<body>
  <header>
    <!-- 헤더 삽입하기  -->
  </header>

  <main class="main_wrapper">
    <h2>로그인</h2>
    <div class="main_container">
      
      <!-- 로그인 폼 -->
      <form action="${contextPath}/member/loginMember.do" method="post" id="loginForm">
        <table>
          <tr>
            <td><p>아이디</p></td>
            <td><input type="text" id="id" name="id" required></td>
          </tr>
          <tr>
            <td>비밀번호</td>
            <td><input type="password" id="pw" name="pw" required></td>
          </tr>
        </table> <!-- //joinForm table -->
        <div>
        	<input type="submit" id="btnLogin" value="로그인">	
        </div>
      </form> <!-- //loginForm -->
      <div>
      	<input type="button" id="btnJoin" value="회원가입" onclick="moveToJoin(this.form)">
          <!--  <a href="#">아이디 찾기</a> --> <!-- 시간 되면 구현,, -->
          <!--  <a href="#">비밀번호 찾기</a> -->
      </div>
    </div> <!-- //main_container -->
  </main> <!-- //main_wrapper -->

  <footer>
    <!-- 푸터 삽입 -->
  </footer>
</body>
</html>