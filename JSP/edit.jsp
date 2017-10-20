<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>改</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentDB?useUnicode=true&characterEncoding=utf-8","root","aqst98987");
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

Statement stmt = con.createStatement();
String id = request.getParameter("id");
String str = "select * from students where number='"+id+"'";
ResultSet rs = stmt.executeQuery(str);
rs.next();
%>
	<form action="update.jsp" method="post">
	<table align="center" width="50%" border="1">
	<caption style="font-size:24px">修改学生信息</caption>
	<tr>
		<th width="30%" height="123" style="font-size:24px">学号：</th>
		<td width="70%"><input name="number" type="text"value="<%=rs.getString(1)%>"></td>
	</tr>
	<tr>
		<th  width="30%" height="95" style="font-size:24px">姓名：</th>
		<td width="70%"><input name="name" type="text" value="<%=rs.getString(2)%>"></td>
	</tr>
	<tr>
		<th height="99" style="font-size:24px">性别：</th>
		<td><input name="sex" type="text" value="<%=rs.getString(3)%>"></td>
	</tr>
	<tr>
		<th height="113" style="font-size:24px">年龄：</th>
		<td><input name="age"type="text" value="<%=rs.getString(4)%>"></td>
	</tr>
	<tr>
		<th height="117" style="font-size:24px">Tel：</th>
		<td><input name="tel"type="text" value="<%=rs.getString(5)%>"></td>
	</tr>
	<tr>
		<th colspan="2">
		<input type="hidden" name="id" value="<%=id%>">
		<input type="submit" name="submit" value="修改">
		<input type="reset" value="重置">
		</th>
	</tr>
	</table>
	</form>
<%
	rs.close();
	stmt.close();
	con.close();
	/*
	String submit=(request.getParameter("submit"));
	if(submit != null && !submit.equals(" ")){
		System.out.print("修改成功，正在返回");
	}*/
%>
</body>
</html>