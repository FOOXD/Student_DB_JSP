<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>update</title>
</head>
<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentDB?useUnicode=true&characterEncoding=utf-8","root","aqst98987");
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");

	Statement stmt = con.createStatement();
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String sex = request.getParameter("sex");
	String age = request.getParameter("age");
	String tel = request.getParameter("tel");
	String str = "update students set name='"+name+"',sex='"+sex+"',age='"+age+"',tel='"+tel+"' where number='"+id+"'";
	stmt.executeUpdate(str);
	stmt.close();
	con.close();
	System.out.print("修改成功，正在返回");	
	response.setHeader("refresh", "1;url=index.jsp");
%>
</body>
</html>