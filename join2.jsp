<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <title>회원가입</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	//id 중복체크
	function fn_idChk() {
		var chkId=$("#id").val(); //입력된 id 값을 chkId로 정의
		if(chkId=="") { //id 입력이 없을 경우
			alert("ID를 입력해주세요");
			return;
		}
		$.ajax({
			type:"post",
			async:true, //false=>동기식, true=>비동기식
			url: "${contextPath}/member/idChk.do",
			dataType:"text",
			data: {id: chkId}, //chkId(=유저가 입력한 id)를 id에 담아 서버로 보냄
			success:function(data, textStatus) { //서버가 성공적으로 실행되었을 경우
				if(data=="usable") { //데이터가 사용가능할 경우
					alert("사용할 수 있는 아이디입니다.");
					$("#btnIdChk").prop("disabled", true); //버튼을 비활성화시킴(더 이상 중복체크할 필요가 없으니)
				}else {
					alert("사용할 수 없는 아이디입니다.");
				}
			},
			error:function(data, textStatus, error) { //서버 연결에 실패하였을 경우
				alert("id 중복확인 오류 발생");
				console.log("data : " + data);
				console.log("textStatus : " + data.textStatus);
			}
		});
	}
	
	//연락처에 자동 하이픈 삽입
	function autoHyphen(target) {
		target.value = target.value
			.replace(/[^0-9]/g, "").replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/\-{1,2}$/g, "");
		// 숫자를 제외한 모든 문자는 삭제
		// 3자리 - 4자리 - 4자리
		// 하이픈만 있을 경우 삭제(숫자가 입력되어야만 하이픈이 나오게함)
	}
	
	//메인으로 가기
	function backToMain(obj) {
		obj.action="${contextPath}/member/main.do";
		obj.submit();
	}
	

</script>
</head>
<body>
  <header>
    <!-- 헤더 삽입하기  -->
  </header>

  <main class="main_wrapper">
    <h2>회원가입</h2>
    <div class="main_container">

      <!-- 회원가입 입력 폼 -->   
      <form action="${contextPath}/member/joinMember.do" method="post" id="joinForm" name="joinForm" >
        <!-- controller, DAO에서 addMember(회원가입) 만들기 -->
        <table>
          <tr>
            <td>이름</td>
            <td><input type="text" id="name" name="name" required></td>
          </tr>
          <tr>
            <td>아이디</td>
            <td><input type="text" id="id" name="id" required placeholder="영문, 숫자 조합(최대 13자)" maxlength="13"></td>
            <td><input type="button" id="btnIdChk" value="ID 중복확인" onclick="fn_idChk()"></td>
            	<!-- fn_idChk : 아이디 체크 기능 -->
          </tr>
          <tr>
          	<td><div id="idMsg"></div><td> 
          	<!-- 아이디 중복 확인 메세지 뜨는 곳 -->
          </tr>
          <tr>
            <td>비밀번호</td>
            <td><input type="password" id="pw" name="pw" required placeholder="영문/숫자 조합(최대 15자)" maxlength="15"></td>
          </tr>
          <tr>
            <td>휴대폰 번호</td>
            <td><input type="tel" id="hp" name="hp" name="hp"required oninput="autoHyphen(this)" maxlength="13"></td>
          </tr>
          <tr>
            <td>생년월일</td>
            <td><input type="date" id="birth" name="birth" name="birth" required></td>
          </tr>
          <tr>
            <td>이메일</td>
            <td><input type="email" id="email" name="email"></td>
          </tr>
        </table> <!-- //joinForm table -->
        <div class="btnJoinForm">
          <input type="submit" value="회원가입">
          <input type="button" value="취소" onclick="backToMain(this.form)">
        </div> <!-- //btnJoinForm -->
      </form> <!-- //joinForm -->

    </div> <!-- //main_container -->
  </main> <!-- //main_wrapper -->

  <footer>
    <!-- 푸터 삽입 -->
  </footer>
</body>
</html>