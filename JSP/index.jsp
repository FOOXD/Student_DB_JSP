<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学生信息管理系统</title>
</head>
<body>
	<a href=add.jsp style="font-size:24px">添加</a><p>
	<table align="center" width="50%" border=1>
		<tr><th height="50" style="font-size:16px">学号</th>
		<th style="font-size:16px">姓名</th>
		<th style="font-size:16px">性别</th>
		<th style="font-size:16px">年龄</th>
		<th style="font-size:16px">Tel</th>
		<th style="font-size:16px">管理</th>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentDB?useUnicode=true&characterEncoding=utf-8","root","aqst98987");
		Statement stmt = con.createStatement();
		String str = "select * from students";
		ResultSet rs = stmt.executeQuery(str);
		while(rs.next()){
			String id = rs.getString(1);
			out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td><a href='edit.jsp?id="+id+"'>修改</a> <a href='del.jsp?id="+id+"'>删除</a></td></tr>");
		}
		rs.close();
		stmt.close();
		con.close();
	%>
	</table>
</body>
</html>