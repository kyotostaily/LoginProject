<%@ page import = "java.sql.*" %>    
<%
    //java.sql.*로 선언하여 sql관련 클래스를 모두 import 한 후 커넥션 변수로 사용할 conn변수를 null 값으로 초기화 합니다.
	Connection conn = null;
	
    //shin 데이터베이스의 URL 주소를 파라미터로 전달하기 위해 변수에 대입합니다.
	String url = "jdbc:mysql://localhost:3306/shin";
    
    //MySQL 접속을 위한 계정 이름과 비밀번호를 파라미터로 전달하기 위해 각각 변수에 대입합니다.
	String user = "root";
	String passwd = "123456";
	
	//MySQL 드라이버를 메모리에 올리기 위해 com.mysql.jdbc.Driver를 Class.forName()메소드의 파라미터로 사용합니다.
	Class.forName("com.mysql.jdbc.Driver");
	
	//7,10,11행에서 선언한 변수를 DriverManager.getConnection() 메소드의 파라미터로 사용하여 객체 conn을 생성합니다.
	conn = DriverManager.getConnection(url, user, passwd);
	
	//이 소스 코드는 별도로 실행하진 않고 데이터베이스와 연동이 필요할때 include로 파일을 가져와 사용합니다.
%>    