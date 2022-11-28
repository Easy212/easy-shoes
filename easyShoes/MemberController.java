package easyShoes;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Formatter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	MemberDAO memberDAO;
	public void init(ServletConfig config) throws ServletException {
		memberDAO=new MemberDAO();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage=null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		String action=request.getPathInfo();
		System.out.println("요청명 : " + action);
		if(action == null || action.equals("/index.do")) { //***나중에 메인페이지로 변경하기
			List<MemberVO> memberList=memberDAO.listMembers();
			request.setAttribute("memberList", memberList); //DAO에서 받은 memberList를 "memberList"에 세팅
			nextPage="/memberView/index.jsp"; //***나중에 메인페이지로 변경하기
		}else if(action.equals("/join.do")) { //회원가입 버튼 눌렀을 떄 회원가입 창으로 이동
			nextPage="/memberView/join.jsp";
		}else if(action.equals("/idChk.do")) { //id 중복확인
			String id=request.getParameter("id");
			boolean chkId=memberDAO.chkId(id);
			//System.out.println("controller ID : " + id + ", chkId : " + chkId);
			if(chkId==true) { //동일한 id가 있음(중복)
				out.print("not_usable");
			}else {
				out.print("usable");
			}
			return;
		}else if(action.equals("/joinMember.do")) { //회원가입
			String id = request.getParameter("id");//join.jsp에서 받은 것들
			String name = request.getParameter("name"); 
			String pw=  request.getParameter("pw");
			String confirmPw = request.getParameter("confirmPw");
			String hp = request.getParameter("hp");
			String email = request.getParameter("email");
			String sex = request.getParameter("sex");
			String birth = request.getParameter("birth");
			String region = request.getParameter("region");
			int shoesSize = Integer.parseInt(request.getParameter("shoesSize"));
			MemberVO memberVO=new MemberVO(id, name, pw, confirmPw, hp, email, sex, java.sql.Date.valueOf(birth), region, shoesSize); //birth는 date 타입으로 변환해서 넣기
			memberDAO.joinMember(memberVO);
			nextPage="/member/index.do"; //***나중에 메인페이지로 변경하기
		/*}else if(action.equals("/login.do")) { //로그인 버튼 눌렀을 때 로그인 창으로 이동
			nextPage="/memberView/login.jsp"; 
		}else if(action.equals("/loginMember.do")) { //로그인 창에서 로그인했을 경우
			String id=request.getParameter("id");
			String pw=request.getParameter("pw");
			MemberVO memberVO=new MemberVO();
			memberVO.setId(id);
			memberVO.setPw(pw);
			boolean result=memberDAO.login(memberVO);
			if(result) {
				HttpSession session=request.getSession();
				session.setAttribute("id", id);
				out.print("<script>" + "location.href='" + request.getContextPath() + "/member/main.do';" + "</script>" );
				//세션에 id 저장 후 메인으로 리턴
			}else {
				out.print("<script>" + "alert('입력하신 아이디 또는 비밀번호가 일치하지않습니다.');" + "location.href='" + request.getContextPath() + "/member/login.do';" + "</script>" );
			}
		}else if(action.equals("/logout.do")) { //로그아웃: 세션 삭제
			HttpSession session=request.getSession();
			session.removeAttribute("id");
			nextPage="/member/main.do";
		}else if(action.equals("/memberPage.do")) {
			nextPage="/memberView/memberPage.jsp";
		}else if(action.equals("/cfmPwdMod.do")) { //회원정보수정-비밀번호 확인 페이지로 이동
			nextPage="/memberView/cfmPwdMod.jsp";
		}else if(action.equals("/cfmPwdForm_mod.do")) { //회원정보수정-비밀번호 일치 여부 확인
			String id=request.getParameter("session_id");
			String pw=request.getParameter("pw");
			MemberVO memberVO=new MemberVO();
			memberVO.setId(id);
			memberVO.setPw(pw);
			boolean result=memberDAO.cfmPwd(memberVO);
			//System.out.println("Controller id : " + id + ", pw : " + pw + ", result : " + result);
			if(result) {
				nextPage="/member/modMember.do";
			}else {
				out.print("<script>" + "alert('입력하신 비밀번호가 일치하지않습니다.');" + "location.href='" + request.getContextPath() + "/member/cfmPwdMod.do';" + "</script>" );
			}
		}else if(action.equals("/modMember.do")) { //회원정보 창에서 회원 정보 불러오기
			String session_id=request.getParameter("session_id");
			MemberVO memberVO=memberDAO.findMember(session_id);
			request.setAttribute("memberInfo", memberVO);
			nextPage="/memberView/modMember.jsp";
		}else if(action.equals("/modMemberForm.do")) { //회원정보 수정
			String id=request.getParameter("id");
			String pw=request.getParameter("pw");
			String hp=request.getParameter("hp");
			String email=request.getParameter("email");
			System.out.println("controller Id : " + id);
			MemberVO memberVO=new MemberVO(id, pw, email, hp);
			memberDAO.modMember(memberVO);
			nextPage="/member/main.do";
		}else if(action.equals("/cfmPwdDel.do")) {
			nextPage="/memberView/cfmPwdDel.jsp";
		}else if(action.equals("/cfmPwdForm_del.do")) { //회원탈퇴-비밀번호 일치 여부 확인+회원탈퇴
			String id=request.getParameter("session_id");
			String pw=request.getParameter("pw");
			MemberVO memberVO=new MemberVO();
			memberVO.setId(id);
			memberVO.setPw(pw);
			boolean result=memberDAO.cfmPwd(memberVO); //정보수정-비밀번호 확인과 동일한 메소드 사용
			System.out.println("Controller id : " + id + ", pw : " + pw + ", result : " + result);
			if(result) {
				memberDAO.delMember(id);
				HttpSession session=request.getSession();
				session.removeAttribute("id");
				out.print("<script>" + "alert('회원 탈퇴가 완료되었습니다.');" + "location.href='" + request.getContextPath() + "/member/main.do';" + "</script>" );
			}else {
				out.print("<script>" + "alert('입력하신 비밀번호가 일치하지않습니다.');" + "location.href='" + request.getContextPath() + "/member/cfmPwdDel.do';" + "</script>" );
			}*/
		}
		RequestDispatcher dispatcher=request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}
