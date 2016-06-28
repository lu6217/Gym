<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>pages/dict/">
		<title>数据字典编辑</title>
		<link rel="stylesheet" type="text/css" href="../../css/styles.css">
	</head>

	<body>
		<center>
			<h1>数据字典列表</h1><hr>
			<table>
				<tr>
					<th>序号</th>
					<th>ID</th>
					<th>名称</th>
					<th>值</th>
					<th>操作</th>
				</tr>
				<c:forEach var="dict" items="${dicts}" varStatus="idx">
				<tr>
					<td>${idx.index+1}</td>
					<td>${dict.id}</td>
					<td>${dict.itemName}</td>
					<td>${dict.itemValue }</td>
					<td></td>
				</tr>
				</c:forEach>
			</table>
		</center>
	</body>
</html>
