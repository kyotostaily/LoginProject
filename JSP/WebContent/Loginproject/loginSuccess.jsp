<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 관리자 로그인 </title>
</head>
<body>
  Home > 관리자 로그인
  <hr>
  <%
    //login 화면에서 입력한 내용을 request.getParameter()메소드를 사용하여 각각 변수에 저장합니다.
    String u_id = request.getParameter("uID");
    String u_pw = request.getParameter("uPW");
    
    //관리자 계정의 아이디 shin과 비밀번호 123456은 회원 DB에 
    //이미 등록되어 있으므로 로그인 성공화면을 확인할수 있습니다.
    if(u_id.equals("shin") && u_pw.equals("123456"))
    {
      //memberId라는 이름을 갖는 키에 u_id를 저장합니다.
      //memberPw라는 이름을 갖는 키에 u_pw를 저장합니다.
      session.setAttribute("memberId", u_id);
      session.setAttribute("memberPw", u_pw);
      
      out.println("새로운 세션 생성 성공 ! <br>");
      out.println("관리자 [ " + u_id + " ]님이 입장하셨습니다. <p>");
    }
    else
    {
      response.sendRedirect("loginErr.jsp");
    }
  %>
  <table border="0">
    <tr>
      <td>
        <form action="memberList.jsp" method="post" >
          <input type="submit" value=" ◀ 등록 회원 관리하기 " >
        </form>
      </td>
      <td>
        <form action="logout.jsp" method="post" >
          <input type="submit" value=" 로그아웃 ▶" >
        </form>
      </td>
  </table>
</body>
</html>