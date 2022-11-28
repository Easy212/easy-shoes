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
  <meta name="author" content="JiHoon Lee"> <!--홈페이지 제작자-->
  <meta name="keywords" content="Drow, 신발, 조던, 덩크, 한정판 스니커즈"> <!--검색엔진을 통한 키워드 (대략적인 사이트 정보)-->
  <meta name="description" content="Easy shoes의 회원가입 화면"> <!--홈페이지의 대략적인 설명(요약정보)-->
  <meta name="robots" content="all"> <!--검색엔진을 통한 노출설정(all = 전부)-->
  <link rel="shortcut icon" href="${contextPath}/memberView/img/mainlogo.png"> <!--파비콘 지정(타이틀과 함께 노출되는 이미지)-->
  <link rel="stylesheet" href="${contextPath}/memberView/css/normalize.css"> <!--css 초기화(옛날버전 > 기본값으로 초기화/인터넷에서 초기화 css다운가능)-->
  <link rel="stylesheet" href="${contextPath}/memberView/css/common.css"> <!--메인 페이지와 서브페이지 공통적으로 사용할 스타일(css) 연결-->
  <link rel="stylesheet" href="${contextPath}/memberView/css/join.css"> 
  <script src="${contextPath}/memberView/js/jquery-3.6.0.min.js"></script>
  <script src="${contextPath}/memberView/js/common.js"></script>
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
    <!--건너뛰기 링크(Tap키) 시작-->
    <a id="skipNav" href="#contentsArea">본문 바로가기</a>
    <!--건너뛰기 링크(Tap키) 종료-->

    <!--wrapper 영역(전체 영역) 시작-->
    <div id="wrapper">
        <!--헤더 영역 시작-->
        <header>
            <div class="headerLogo">
                <a href="${contextPath}/member/index.do"><img src="${contextPath}/memberView/img/mainlogo.png" alt="로고"></a>
            </div>
            <!--안내링크 영역 시작-->
            <ul class="infoLink">
                <li><a href="${contextPath}/member/index.do">홈</a></li>
                <li><a href="#">로그인</a></li>
                <li><a href="${contextPath}/member/join.do">회원가입</a></li>
                <li><a href="#">고객센터</a></li>
                <li><a href="#">관심상품</a></li>
                <li><a href="#">마이페이지</a></li>
            </ul>
            <!--안내링크 영역Fs 종료-->

            <!--메인메뉴 영역 시작-->
            <div id="mainMenuArea">
                <h2 class="hidden">메인메뉴</h2>
                <ul class="mainMenu">
                    <li><a href="#">Air Jordan1</a>
                        <ul class="jordan">
                            <li><a href="#">High</a></li>
                            <li><a href="#">Mid</a></li>
                            <li><a href="#">Row</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Dunk</a>
                        <ul class="dunk">
                            <li><a href="#">High</a></li>
                            <li><a href="#">Row</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Yeezy 시리즈</a>
                        <ul class="yeezy">
                            <li><a href="#">Yeezy Boost</a></li>
                            <li><a href="#">Yeezy Form</a></li>
                            <li><a href="#">Yeezy Slide</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Collaboration</a>
                        <ul class="collabo">
                            <li><a href="#">오프화이트</a></li>
                            <li><a href="#">트래비스 스캇</a></li>
                            <li><a href="#">사카이</a></li>
                            <li><a href="#">슈프림</a></li>
                            <li><a href="#">피스마이너스원</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Lucky Drow</a>
                        <ul class="drow">
                            <li><a href="#">드로우 일정</a></li>
                            <li><a href="#">드로우 신청</a></li>
                            <li><a href="#">드로우 당첨 여부 확인</a></li>
                            <li><a href="#">드로우 당첨자 구매하기</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--메인메뉴 영역 종료-->
        </header>
        <!--헤더 영역 종료-->

        <!--비쥬얼 영역 시작-->
        <div id="visual">
            <div class="main_img">
                <img class="viimg" src="${contextPath}/memberView/img/visualimg1.png" alt="메인 슬라이드 이미지1">
                <img class="viimg" src="${contextPath}/memberView/img/visualimg2.png" alt="메인 슬라이드 이미지2">
                <img class="viimg" src="${contextPath}/memberView/img/visualimg3.png" alt="메인 슬라이드 이미지3">
                <img class="viimg" src="${contextPath}/memberView/img/visualimg4.png" alt="메인 슬라이드 이미지4">
                <img class="viimg" src="${contextPath}/memberView/img/visualimg5.png" alt="메인 슬라이드 이미지5">
            </div>
            <div>
                <img class="left_control" src="${contextPath}/memberView/img/btn_left.png" alt="왼쪽">
                <img class="right_control" src="${contextPath}/memberView/img/btn_right.png" alt="오른쪽">
            </div>
        </div>
        <!--비쥬얼 영역 종료-->

        <!--회원가입 영역 시작-->
        <section id="memberArea">
            <h2>회원가입</h2>
            <p class="formSign"><strong class="require">필수</strong>는 필수 입력 사항 입니다.</p>
            <form action="${contextPath}/member/joinMember.do" method="post" id="joinForm" name="joinForm">
                <fieldset>
                    <!--기본정보 시작-->
                    <div class="baseInfo">
                        <h3>기본정보</h3>
						<fieldset>
                            <label for="id">아이디<strong class="require">필수</strong></label>
                            <input type="text" id="id" name="id" minlength="4" maxlength="16" size="30" required placeholder="영문 숫자 포함 4~16자">
                            <a href="pop_idCheck.html" class="idCheck">ID 중복확인</a>
                        </fieldset>
                        <fieldset>
                            <label for="name">성명<strong class="require">필수</strong></label>
                            <input type="text" id="name" name="name" placeholder="성함을 입력해주세요">
                        </fieldset>

                        <fieldset>
                            <label for="pw">비밀번호<strong class="require">필수</strong></label>
                            <input type="password" id="pw" name="pw" minlength="10" size="30" required placeholder="영문 숫자 포함 10자이상">
                        </fieldset>
                        <fieldset>
                            <label for="confirmPw">비밀번호확인<strong class="require">필수</strong></label>
                            <input type="password" id="confirmPw" name="confirmPw"  minlength="10" size="30" required>
                        </fieldset>

                       <fieldset class="tel_selct">
                            <label>연락처</label>
							<input type="text" id="hp" name="hp">
                        </fieldset>
                        
                        <fieldset>
                            <label for="email">이메일<strong class="require">필수</strong></label>
                            <input type="email" id="email" name="email" size="30" required placeholder="입력 예) easy@naver.com">
                        </fieldset>
                    </div>
                    <!--기본정보 끝-->
            <!--추가정보 시작-->
            <div class="addInfo">
                <h3>추가정보</h3>
                <fieldset class="sex" >
                    <label>성별</label>
                    <input type="radio" id="sexInfo1" name="sex" value="남자" checked>
                    <label>남자</label>
                    <input type="radio" id="sexInfo2" name="sex" value="여자">
                    <label>여자</label>
                </fieldset>

                <fieldset class="birth">
                    <label>생년월일</label>
                    <input type="date" id="birth" name="birth" name="birth" >

                </fieldset>
            
                <fieldset class="region">
                    <label>지역</label>
                    <select name="region">
                        <option value="선택안함">선택</option>
                        <option value="경기">경기</option>
                        <option value="서울">서울</option>
                        <option value="인천">인천</option>
                        <option value="강원">강원</option>
                        <option value="충남">충남</option>
                        <option value="충북">충북</option>
                        <option value="대전">대전</option>
                        <option value="경남">경남</option>
                        <option value="경북">경북</option>
                        <option value="대구">대구</option>
                        <option value="부산">부산</option>
                        <option value="울산">울산</option>
                        <option value="전북">전북</option>
                        <option value="전남">전남</option>
                        <option value="광주">광주</option>
                        <option value="제주">제주</option>
                    </select>
                </fieldset>

                <fieldset class="shoesSize">
                    <label>신발 사이즈</label>
                    <select name="shoesSize">
                        <option value="선택안함">선택</option>
                        <option value="220">220</option>
                        <option value="225">225</option>
                        <option value="230">230</option>
                        <option value="235">235</option>
                        <option value="240">240</option>
                        <option value="245">245</option>
                        <option value="250">250</option>
                        <option value="255">255</option>
                        <option value="260">260</option>
                        <option value="265">265</option>
                        <option value="270">270</option>
                        <option value="275">275</option>
                        <option value="280">280</option>
                        <option value="285">285</option>
                        <option value="290">290</option>
                        <option value="295">295</option>
                        <option value="300">300</option>
                </select>
            </form>
            </fieldset>
               <div class="btnJoinArea">
	                <input type="submit" value="회원가입">
	   			 	<input type="button" value="취소" onclick="backToMain(this.form)">
               </div>
            </fieldset>
        </section>
        <!--회원가입 영역 종료-->


        <!--푸터 영역 시작-->
        <footer>
            <section class="guide">
                <h2 class="hidden">내부규정 </h2>
                <ul>
                    <li><a href="#">회사소개</a></li>
                    <li><a href="#">인재채용</a></li>
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">개인정보 처리방침</a></li>
                </ul>
            </section>

            <section class="callCenter">
                <h2>고객센터☏</h2>
                <ul>
                    <li>대표번호: 1588-7813</li>
                    <li>운영시간: 평일 11:00 - 18:00 (토 ∙ 일, 공휴일 휴무)</li>
                    <li>점심시간: 평일 13:00 - 14:00</li>
                    <li>1:1 문의하기는 앱에서만 가능합니다.</li>
                </ul>
            </section>

            <address>
                <p>· 주식회사 이지 대표 이지훈</p>
                <p>· 사업자 등록번호: 570-88-01618</p>
                <p>· 사업장 소재지: 서울시 강북구 392-117 영남빌딩 3층</p>
                <p>· 전화: 02-123-4567</p>
                <p>· E-Mail: <a href="mailto:gxwlgns@naver.com">gxwlgns@naver.com</a></p>
            </address>
            <p class="copyright">이지(주)는 통신판매 중개자로서 통신판매의 당사자가 아니므로 개별 판매자가 등록한 상품정보에 대해서 책임을 지지 않습니다. <br>
                단, 거래과정에서 검수하고 보증하는 내용에 대한 책임은 당사에 있습니다
            </p>
        </footer>
        <!--푸터 영역 종료-->
    </div>
    <!--wrapper 영역(전체 영역) 종료-->
</body>
</html>