<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.util.ArrayList, univ.CompanyEntity" %>
	<h2> ȸ������ ��ȸ</h2>
	
	<jsp:useBean id="univdb" class="univ.company" scope="page"/>
	
	<%
	ArrayList<CompanyEntity>list = univdb.getCompanyList();
	int counter = list.size();
	if(counter >0) {
	%>
	<table border="1">
	<tr>
		<td align=center><b>ȸ���</b></td>
		<td align=center><b>ȸ�� ������</b></td>
		<td align=center><b>��ǥ�� �̸�</b></td>
		<td align=center><b>����о�</b></td>
		<td align=center><b>�����</b></td>
		<td align=center><b>������</b></td>
		<td align=center><b>2021�⵵ �ű�ä���ο� �Ը�</b></td>
	</tr>
	<%
		for(CompanyEntity com : list) {
	%>
	<tr>
		<td align=center><%= com.getCname() %></td>
		<td align=center><%= com.getAddress() %></td>
		<td align=center><%= com.getJuname() %></td>
		<td align=center><%= com.getJuje() %></td>
		<td align=center><%= com.getMoney() %></td>
		<td align=center><%= com.getCnt() %></td>
		<td align=center><%= com.getNewcnt() %></td>
	</tr>
	<%
		}
	%>
	</table>
	<%
	}
	%>
	<p><hr>��ȸ�� ȸ���� ����: <%=counter%>
	
</body>
</html>