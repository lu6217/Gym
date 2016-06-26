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
		<base href="<%=basePath%>pages/yjgb/">
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">
		
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
		
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/your_style.css">
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap-datetimepicker.min.css">
		
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap-select.min.css">
	</head>

	<!--
	The ID "widget-grid" will start to initialize all widgets below 
	You do not need to use widgets if you dont want to. Simply remove 
	the <section></section> and you can use wells or panels instead 
	-->
<body>

<div class="container">
	<!-- row -->
	<div class="row">
		
		<!-- NEW WIDGET START -->
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div>
				<div class="widget-body">
					<form class="form-horizontal">
						<input type="hidden" name="id" value="${activity.id}">
	                     <table class="bs-table">
	                     	<tr>
	                     		<td width="70">开始时间</td>
	                     		<td><input class="form-control" onfocus="WdatePicker()" name ="beginTime" type="text" value="<fmt:formatDate value="${activity.beginTime}" pattern="yyyy-MM-dd"/>"/></td>
	                     	</tr>
	                     	<tr>
	                     		<td width="70">结束时间</td>
	                     		<td><input class="form-control" onfocus="WdatePicker()" name ="endTime" type="text" value="<fmt:formatDate value="${activity.endTime}" pattern="yyyy-MM-dd"/>"/></td>
	                     	</tr>
	                     	<tr>
	                     		<td width="70">活动介绍</td>
	                     		<td>
	                     			<textarea class="form-control" rows="4" name="summary">${activity.summary}</textarea>
	                     		</td>
	                     	</tr>
	                     	<tr>
	                     		<td>活动详细</td>
	                     		<td>
	                     			<textarea class="form-control" rows="7" name="info">${activity.info}</textarea>
	                     		</td>
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

		<script src="../../js/libs/jquery-2.1.1.min.js"></script>
		<script src="../../js/bootstrap/bootstrap.min.js"></script>
		<!-- JARVIS WIDGETS -->
		<script src="../../js/smartwidgets/jarvis.widget.min.js"></script>
		<!-- JQUERY VALIDATE -->
		<script src="../../js/plugin/jquery-validate/jquery.validate.min.js"></script>

		<!-- JQUERY MASKED INPUT -->
		<script src="../../js/plugin/masked-input/jquery.maskedinput.min.js"></script>

		<!-- JQUERY SELECT2 INPUT -->
		<script src="../../js/plugin/select2/select2.min.js"></script>
		
		<!-- 时间选择器 -->
		<script src="../../js/plugin/My97DatePicker/WdatePicker.js"></script>
		<!-- 下拉选择框 -->
		<script src="../../js/plugin/bootstrap-select/bootstrap-select.min.js"></script>
		
		<!--[if IE 8]>
			<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
		<![endif]-->
		
		
		<script type="text/javascript">
		$(function() {
		});
		</script>

	</body>

</html>
