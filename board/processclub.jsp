<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 기본 예제: 게시 등록 수정 삭제 처리</title>
</head>
<body>
	<!-- 게시의 등록, 수정, 삭제를 위한 자바빈즈 이용 선언-->
	<jsp:useBean id="univ" class="univ.clubEntity" scope="page" />
	<jsp:useBean id="univdb" class="univ.clubDBCP" scope="page" />
	<% 
		//한글 처리를 위해 문자인코딩 지정
		request.setCharacterEncoding("euc-kr");
		//등록(inser), 수정(update), 삭제(delete) 중 하나를 저장
	 	String menu = request.getParameter("menu"); 
		// 등록 또는 수정 처리 모듈 
	 	if ( menu.equals("delete") || menu.equals("update") ) { 
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			int idnum = Integer.parseInt(id);	
			//데이터베이스 자바빈즈에 구현된 메소드 isPasswd()로 id와 암호가 일치하는지 검사
			if ( !univdb.isPassword(idnum, password) ) {
	%>
				<!-- 암호가 틀리면 이전 화면으로 이동 -->
				<script>alert("비밀번호가 다릅니다."); history.go(-1);</script>
	<%
			} else {
				if ( menu.equals("delete") ) {
					//삭제를 위해 데이터베이스 자바빈즈에 구현된 메소드 deleteDB() 실행 			
					univdb.deleteDB(idnum);
				} else if ( menu.equals("update") ) { 
	%>
					<!-- 수정 시 clubEntity에 지정해야 하는 필드 id -->
					<!--
					<jsp:setProperty name="univ" property="id" />
					<jsp:setProperty name="univ" property="name" />
					<jsp:setProperty name="univ" property="title" />
					<jsp:setProperty name="univ" property="email" />
					<jsp:setProperty name="univ" property="content" />
					를 EL로 변환
					-->
					${univ['id']}
					${univ['name']}
					${univ['title']}
					${univ['email']}
					${univ['content']} 
	<%		
					//수정를 위해 데이터베이스 자바빈즈에 구현된 메소드 updateDB() 실행 			
					univdb.updateDB(univ);
				}
				//기능 수행 후 다시 게시 목록 보기로 이동
				response.sendRedirect("listclub.jsp");					 		
			}
	 	} else if ( menu.equals("insert") ) {
	%>
			<!-- 등록 시 clubEntity에 지정해야 하는 필드 password -->
			<jsp:setProperty name="univ" property="name" />
			<jsp:setProperty name="univ" property="title" />
			<jsp:setProperty name="univ" property="email" />
			<jsp:setProperty name="univ" property="content" />
			<jsp:setProperty name="univ" property="password" />
	<%		
			//등록를 위해 데이터베이스 자바빈즈에 구현된 메소드 insertDB() 실행 			
			univdb.insertDB(univ);
			//기능 수행 후 다시 게시 목록 보기로 이동
			response.sendRedirect("listclub.jsp");					 		
	 	}
	%>
</body>
</html>