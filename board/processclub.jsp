<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� �⺻ ����: �Խ� ��� ���� ���� ó��</title>
</head>
<body>
	<!-- �Խ��� ���, ����, ������ ���� �ڹٺ��� �̿� ����-->
	<jsp:useBean id="univ" class="univ.clubEntity" scope="page" />
	<jsp:useBean id="univdb" class="univ.clubDBCP" scope="page" />
	<% 
		//�ѱ� ó���� ���� �������ڵ� ����
		request.setCharacterEncoding("euc-kr");
		//���(inser), ����(update), ����(delete) �� �ϳ��� ����
	 	String menu = request.getParameter("menu"); 
		// ��� �Ǵ� ���� ó�� ��� 
	 	if ( menu.equals("delete") || menu.equals("update") ) { 
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			int idnum = Integer.parseInt(id);	
			//�����ͺ��̽� �ڹٺ�� ������ �޼ҵ� isPasswd()�� id�� ��ȣ�� ��ġ�ϴ��� �˻�
			if ( !univdb.isPassword(idnum, password) ) {
	%>
				<!-- ��ȣ�� Ʋ���� ���� ȭ������ �̵� -->
				<script>alert("��й�ȣ�� �ٸ��ϴ�."); history.go(-1);</script>
	<%
			} else {
				if ( menu.equals("delete") ) {
					//������ ���� �����ͺ��̽� �ڹٺ�� ������ �޼ҵ� deleteDB() ���� 			
					univdb.deleteDB(idnum);
				} else if ( menu.equals("update") ) { 
	%>
					<!-- ���� �� clubEntity�� �����ؾ� �ϴ� �ʵ� id -->
					<!--
					<jsp:setProperty name="univ" property="id" />
					<jsp:setProperty name="univ" property="name" />
					<jsp:setProperty name="univ" property="title" />
					<jsp:setProperty name="univ" property="email" />
					<jsp:setProperty name="univ" property="content" />
					�� EL�� ��ȯ
					-->
					${univ['id']}
					${univ['name']}
					${univ['title']}
					${univ['email']}
					${univ['content']} 
	<%		
					//������ ���� �����ͺ��̽� �ڹٺ�� ������ �޼ҵ� updateDB() ���� 			
					univdb.updateDB(univ);
				}
				//��� ���� �� �ٽ� �Խ� ��� ����� �̵�
				response.sendRedirect("listclub.jsp");					 		
			}
	 	} else if ( menu.equals("insert") ) {
	%>
			<!-- ��� �� clubEntity�� �����ؾ� �ϴ� �ʵ� password -->
			<jsp:setProperty name="univ" property="name" />
			<jsp:setProperty name="univ" property="title" />
			<jsp:setProperty name="univ" property="email" />
			<jsp:setProperty name="univ" property="content" />
			<jsp:setProperty name="univ" property="password" />
	<%		
			//��ϸ� ���� �����ͺ��̽� �ڹٺ�� ������ �޼ҵ� insertDB() ���� 			
			univdb.insertDB(univ);
			//��� ���� �� �ٽ� �Խ� ��� ����� �̵�
			response.sendRedirect("listclub.jsp");					 		
	 	}
	%>
</body>
</html>