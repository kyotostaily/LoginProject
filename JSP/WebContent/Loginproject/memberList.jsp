<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title> Members List </title>
</head>
<body>
  Home > 등록 회원 관리
  <hr>
  <%
    //회원 가입 화면에서 입력한 내용을 request.getParameter()메소드를 사용하여 각각 변수에 저장합니다.
    String u_id = request.getParameter("userID");
    String u_pw = request.getParameter("userPW");
    String u_mail = request.getParameter("userMAIL");
    
    //SQL쿼리문을 보내기 위한 객체 sm을 생성합니다.
    Statement sm = conn.createStatement();
    
    //Statement 객체의 executeQuery()메소드를 선언하여 수행할 SQL 명령문을 ResultSet 유형의 변수 rs에 저장합니다.
    ResultSet rs = sm.executeQuery("SELECT id, email, signuptime FROM members");
    
    //행과 열로 구성된 2차원 배열 형태의 실행 결과를 바탕으로 테이블에 존재하는 정보를 리스트 형태로 출력합니다.
    String str = "";
    int count = 1;
    
    while(rs.next()) {
    	str += count + " : " + rs.getString("id") + " / " + rs.getString("email")
    	      + " / " + rs.getString("signuptime") + "<br>";
    	count++;
    }
    out.print(str);
    
    //사용한 객체를 닫습니다.
    rs.close();
    sm.close();
    conn.close();
  %>
  <hr>
  <table border="0">
    <tr>
      <td>
        <form action="withdraw.jsp" method="post" >
          <input type="submit" value=" ◀ 회원 탈퇴시키기 " >
        </form>
      </td>
      <td>
        <form action="logout.jsp" method="post" >
          <input type="submit" value=" 로그 아웃 ▶" >
        </form>
      </td>
    </tr>
  </table>
</body>
</html>