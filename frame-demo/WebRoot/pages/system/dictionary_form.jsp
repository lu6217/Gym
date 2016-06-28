<%@ page language="java" pageEncoding="UTF-8"%>
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
			<h1>数据字典编辑</h1><hr>
			<form action="<%=path%>/dict/save" method="post">
				<table>
					<tr>
						<td>名称：</td>
						<td><input type="text" name="itemName"></td>
					</tr>
					<tr>
						<td>值：</td>
						<td><input type="text" name="itemValue"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="提交">
							<input type="reset" value="重置">
						</td>
					</tr>
				</table>
			</form>
		</center>
	</body>
</html>
