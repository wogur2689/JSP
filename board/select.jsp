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
	<h2> 회사정보 조회</h2>
	
	<jsp:useBean id="univdb" class="univ.company" scope="page"/>
	
	<%
	ArrayList<CompanyEntity>list = univdb.getCompanyList();
	int counter = list.size();
	if(counter >0) {
	%>
	<table border="1">
	<tr>
		<td align=center><b>회사명</b></td>
		<td align=center><b>회사 소재지</b></td>
		<td align=center><b>대표자 이름</b></td>
		<td align=center><b>사업분야</b></td>
		<td align=center><b>매출액</b></td>
		<td align=center><b>직원수</b></td>
		<td align=center><b>2021년도 신규채용인원 규모</b></td>
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
	<p><hr>조회된 회사의 갯수: <%=counter%>
	
</body>
</html>