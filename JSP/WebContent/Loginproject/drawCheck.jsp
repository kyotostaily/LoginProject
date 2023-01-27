<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<% 
    //회원 탈퇴 화면에서 입력한 아이디에 대한 정보를 가져와서 u_id변수에 저장합니다.
	String u_id = request.getParameter("userID");

    //http로 전달받은 아이디에 대한 정보를 members 테이블에서 삭제하기 위한 DELETE 명령문을 sql 변수에 저장합니다.
    //회원 탈퇴 화면에서 전달되는 파라미터를 이용하기 위해 '?'를 정의합니다. id는 members 테이블에 존재하는 컬럼명입니다.
	String sql = "DELETE FROM members WHERE id = ?";
	
	PreparedStatement sm = conn.prepareStatement(sql);
	sm.setString(1, u_id);

	//SQL명령문을 수행하기 위해 executeUpdate()메소드를 호출하여 count변수에 저장합니다.
	int count = sm.executeUpdate();
	
	//if문의 조건식에서 count변수가 1일 경우에 탈퇴성공의 페이지로 이동하며 그 외에는 실패로 이동합니다.
	if(count == 1){
		response.sendRedirect("drawSuccess.jsp");
	}else{
		response.sendRedirect("drawErr.jsp");
	}
	
	//close()메소드를 이용하여 shin 데이터베이스에 접근해서 사용한 모든 객체들을 닫습니다.
	sm.close();
	conn.close();	
%>