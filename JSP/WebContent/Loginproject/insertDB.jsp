<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<% 
    //회원 가입 화면에서 입력한 내용을 request.getParameter()메소드를 사용하여 각각 변수에 저장합니다.
	String u_id = request.getParameter("userID");
	String u_pw = request.getParameter("userPW");
	String u_mail = request.getParameter("userMAIL");
	
	//INSERT INTO 명령으로 members테이블에 데이터를 등록하기 위한 SQL 명령문을 선언
	String sql = "INSERT INTO members(id, passwd, email) VALUES";
	sql += "('" + u_id + "','" + u_pw + "','" + u_mail + "')";

	//SQL쿼리문을 보내기 위한 객체 sm을 생성합니다.
	Statement sm = conn.createStatement();
	
	//SQL명령문을 수행하기 위해 executeUpdate()메소드를 호출하여 count변수에 저장합니다.
	int count = sm.executeUpdate(sql);
	
	//if문의 조건식에서 count변수가 1일 경우에 회원가입이 성공하며 그 외에는 회원가입 실패 메시지를 출력합니다.
	if(count == 1){
		response.sendRedirect("signupSuccess.jsp");
	}else{
		out.println("회원가입 실패!");
		response.sendRedirect("signup.jsp");
	}
	
	//close()메소드를 이용하여 shin 데이터베이스에 접근해서 사용한 모든 객체들을 닫습니다.
	sm.close();
	conn.close();	
%>