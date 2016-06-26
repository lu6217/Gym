<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.kzw.com/mytag" prefix="k"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html>
<html lang="en-us">	
	<head>
		<meta charset="utf-8">
		<base href="<%=basePath%>pages/xsbm/">
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/your_style.css">
	</head>
<body>

<div class="container">
	<!-- row -->
	<div class="row">
		
		<!-- NEW WIDGET START -->
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div>
				<div class="widget-body">
					<form class="form-horizontal">
						<input type="hidden" name="id" value="${student.id}">
	                     <table class="bs-table">
	                     	<tr>
	                     		<td width="70">姓名</td>
	                     		<td><input class="form-control" name="name" type="text" value="${student.name}"/></td>
	                     		<td width="70">学号</td>
	                     		<td><input class="form-control" name="sno" type="text" value="${student.sno}"/></td>
	                     	</tr>
	                     	<tr>
	                     		<td>性别</td>
	                     		<td>
	                     			<k:dictSelect name="sex.id" itemName="性别" className="form-control" headerKey="-1" value="${student.sex.id}"/>
	                     		</td>
	                     		<td>民族</td>
	                     		<td>
	                     			<k:dictSelect name="nation.id" itemName="民族" className="form-control" value="${student.nation.id}"/>
	                     		</td>
	                     	</tr>
	                     	<tr>
	                     		<td>年龄</td>
	                     		<td><input class="form-control" name="age" type="text" value="${student.age}"/></td>
	                     		<td>注册时间</td>
	                     		<td><input class="form-control" onfocus="WdatePicker()" name ="ctime" type="text" value="<fmt:formatDate value="${student.ctime}" pattern="yyyy-MM-dd"/>"/></td>
	                     	</tr>
	                     </table>
	
					</form>
	
				</div>
			</div>
	
		</article>
		<!-- WIDGET END -->
		
	</div>
	<!-- end row -->
</div>
		<!-- 时间选择器 -->
		<script src="../../js/plugin/My97DatePicker/WdatePicker.js"></script>
	</body>

</html>
