<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>增</title>
</head>
<body>
	<form action="add.jsp" method="post">
	<table align="center" width="50%" border="1">
	<caption style="font-size:24px">添加学生信息</caption>
	<tr>
		<th width="30%" height="111" style="font-size:24px">学号：</th>
		<td width="70%"><input name="number" type="text"></td>		
	</tr>
	<tr>
		<th height="95" style="font-size:24px">姓名：</th>
		<td><input name="name" type="text"></td>
	</tr>
	<tr>
		<th height="99" style="font-size:24px">性别：</th>
		<td><input name="sex" type="text"></td>
	</tr>
	<tr>
		<th height="113" style="font-size:24px">年龄：</th>
		<td><input name="age"type="text"></td>
	</tr>
	<tr>
		<th height="117" style="font-size:24px">Tel：</th>
		<td><input name="tel"type="text"></td>
	</tr>
	<tr>
		<th colspan="2">
		<input type="submit" name="submit" value="添加">
		<input type="reset" value="重置">
		</th>
	</tr>
	</table>
	</form>
</body>
</html>

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String submit=(request.getParameter("submit"));
if(submit != null && !submit.equals(" ")){
	String number = request.getParameter("number");
	String name = request.getParameter("name");
	String sex = request.getParameter("sex");
	String age = request.getParameter("age");
	String tel = request.getParameter("tel");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentDB?useUnicode=true&characterEncoding=utf-8","root","aqst98987");
	Statement stmt = con.createStatement();
	String sql = "insert into students(number, name, sex, age, tel) values('"+number+"', '"+name+"', '"+sex+"', '"+age+"', '"+tel+"')";
	int i = stmt.executeUpdate(sql);
	if(i == 1){
		response.setHeader("refresh", "1;url=index.jsp");
	}else{
		response.setHeader("refresh", "1;url=add.jsp");
	}
	stmt.close();
	con.close();
}


%>