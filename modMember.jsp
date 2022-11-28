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
  <title>회원정보수정</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	//연락처에 자동 하이픈 삽입
	function autoHyphen(target) {
		target.value = target.value
			.replace(/[^0-9]/g, "").replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/\-{1,2}$/g, "");
	}
</script>
</head>
<body>
  <header>
    <!-- 헤더 삽입하기  -->
  </header>

  <main class="main_wrapper">
    <h2>회원정보 수정</h2>
    <div class="main_container">

      <div class="main_page">
        <form action="${contextPath}/member/modMemberForm.do?id=<%=session.getAttribute("id")%>" method="post" id="modFrom">
          <!-- controller에서 modMember, DAO에서 memberInfo 만들기 -->
          <table>
            <tr>
              <td><p>이름</p></td>
              <td><input type="text" id="name" name="name" value="${memberInfo.name}" required disabled></td>
            </tr>
            <tr>
              <td>아이디</td>
              <td><input type="text" id="id" name="id" value="${memberInfo.id}" required maxlength="13" disabled></td>
            </tr>
            <tr>
              <td>비밀번호</td>
              <td><input type="password" id="pw" name="pw" required placeholder="영문/숫자 조합(최대 15자)" maxlength="15"></td>
            </tr>
            <tr>
              <td>휴대폰 번호</td>
              <td><input type="tel" id="hp" name="hp" value="${memberInfo.hp}" required oninput="autoHyphen(this)" maxlength="13"></td>
            </tr>
            <tr>
              <td>생년월일</td>
              <td><input type="date" id="birth" name="birth" value="${memberInfo.birth}" required disabled></td>
            </tr>
            <tr>
              <td>이메일</td>
              <td><input type="email" id="email" value="${memberInfo.email}" name="email"></td>
            </tr>
          </table> <!-- //modForm table -->
          <div class="btnModForm">
            <input type="submit" value="수정하기">
            <input type="reset" value="다시 입력">
          </div> <!-- //btnModForm -->
        </form> <!-- //modForm -->
      </div> <!-- //main_page -->
    </div> <!-- //main_container -->
  </main> <!-- //main_wrapper -->

  <footer>
  <!-- 푸터 삽입 -->
  </footer>
</body>
</html>