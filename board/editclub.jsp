<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� �⺻ ���� : �Խ� �� �ۼ�</title>
</head>
<body>
<!-- ���� boardform.js : ���� �� �Է� ���� �ִ����� �����ϴ� �Լ� ���� -->
<script language=JavaScript src="clubform.js"></script>

<body>

	<%@ page import="univ.*" %>
	<%
		String name = ""; 
		String email = ""; 
		String title = ""; 
		String content = ""; 
		String headline = "���";
		
		String id = request.getParameter("id");
		if (id != null) {
			//����� �ƴ� ���, ����� ���� ������ �Խ��� �� �ʵ� ������ ���� 
			int idnum = Integer.parseInt(id);
			clubDBCP univdb = new clubDBCP(); 
			clubEntity univ = univdb.getclub(idnum);
			name = univ.getName();
			email = univ.getEmail();
			title = univ.getTitle();
			content = univ.getContent();
			headline = "���� ����";
		};
	%>

<h2>�Խ��� <%=headline %> ���α׷� </h2> <hr>

<center><form name=clubform method=post action="processclub.jsp" >
<!-- menu : ���, ���� �Ǵ� ���� ������ ���� �Ű������� �̿� -->
<input type=hidden name="menu" value="insert">
<!-- ���� �Ǵ� ������ ���� �Խ� id�� hidden���� ���� -->
<input type=hidden name="id" value=<%=id %>>

<table width=100% border=0 cellspacing=0 cellpadding=7>
 <tr><td align=center>

   <table border=0>
	<tr> <td colspan=2>
		<table>
		    <tr>
		     <td width=50>�� �� : </td>
		     <td width=100>
				<input type=text name=name value="<%=name%>" size=30 maxlength=20></td>
		     <td width=80>���ڸ��� :</td>
		     <td width=100>
				<input type=text name=email size=30 value="<%=email%>" maxlength=30></td>
		    </tr>	
			<tr >
		     <td width=50>�� �� : </td>
		     <td colspan=3>
				<input type=text name=title size=80 value="<%=title%>" maxlength=100></td>
			</tr>
		</table>
	</td> </tr>

    <tr><td colspan=2>
			<textarea name=content rows=10 cols=90><%=content%></textarea></td></tr>
	<tr>
     <td colspan=2>��й�ȣ :
	     <input type=password name=password size=20 maxlength=15><font color=red>  
         	���� �Խ� ������ ���� �Ǵ� �����Ϸ��� �̹� ����� ��й�ȣ�� �ʿ��մϴ�.</font></td>
    </tr>
	<tr>
     <td colspan=2 height=5><hr size=2></td>
    </tr>
	<tr>
     <td colspan=2>
		<% if (id == null) { %>
		       	<!-- ��ư�� ������ boardform.js�� �Լ��� �����Ͽ� processboard.jsp�� �̵� -->
		 		<input type=button value="���" onClick="insertcheck()">
		<% } else { %>
		       	<!-- ��ư�� ������ boardform.js�� �� �Լ��� �����Ͽ� processboard.jsp�� �̵� -->
		  		<input type=button value="�����Ϸ�" onClick="updatecheck()">
		    	<input type=button value="����" onClick="deletecheck()"> 
		<% } %>
		<!-- ��Ϻ��� ��ư�� listboard.jsp�� �̵� -->
		<input type=button value="��Ϻ���" onClick="location.href='listclub.jsp'"> 
      	<input type=reset value="���"> 
	 </td>
    </tr> 
   </table>
  </td></tr>
</table>

</form>
</center>
</body>
</html>