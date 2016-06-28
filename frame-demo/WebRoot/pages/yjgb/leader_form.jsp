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
						<input type="hidden" name="id" value="${leader.id}">
	                     <table class="bs-table">
	                     	<tr>
	                     		<td width="70">姓名</td>
	                     		<td><input class="form-control" id="name" name="name" type="text" value="${leader.name}"/></td>
	                     		<td width="70">性别</td>
	                     		<td>
	                     			<k:dictSelect name="sex.id" itemName="性别" className="form-control selectpicker" headerKey="-1" value="${leader.sex.id}"/>
	                     		</td>
	                     		<td width="70">民族</td>
	                     		<td>
	                     			<k:dictSelect name="nation.id" itemName="民族" className="form-control selectpicker" value="${leader.nation.id}"/>
	                     		</td>
	                     	</tr>
	                     	<tr>
	                     		<td>学历</td>
	                     		<td>
	                     			<k:dictSelect name="xueli.id" itemName="学历" className="form-control selectpicker" value="${leader.xueli.id}"/>
	                     		</td>
	                     		<td>政治面貌</td>
	                     		<td>
	                     			<k:dictSelect name="zzmm.id" itemName="政治面貌" className="form-control selectpicker" value="${leader.zzmm.id}"/>
	                     		</td>
	                     		<td>身份证</td>
	                     		<td><input class="form-control" id="cardNo" name="cardNo" type="text" value="${leader.cardNo}"/></td>
	                     	</tr>
	                     	<tr>
	                     		<td>援疆批次</td>
	                     		<td>
	                     			<k:dictSelect name="batchNo.id" itemName="援疆批次" className="form-control selectpicker" value="${leader.batchNo.id}"/>
	                     		</td>
	                     		<td>服务期限</td>
	                     		<td>
	                     			<k:dictSelect name="endService.id" itemName="服务期限" className="form-control selectpicker" value="${leader.endService.id}"/>
	                     		</td>
	                     		<td>进疆时间</td>
	                     		<td><input class="form-control" onfocus="WdatePicker()" id="inTime" name ="inTime" type="text" value="<fmt:formatDate value="${leader.inTime}" pattern="yyyy-MM-dd"/>"/></td>
	                     		
	                     	</tr>
	                     	<tr>
	                     		<td>离疆时间</td>
	                     		<td><input class="form-control" onfocus="WdatePicker()" id="outTime" name="outTime" type="text" value="<fmt:formatDate value="${leader.outTime}" pattern="yyyy-MM-dd"/>"/></td>
	                     		<td>援疆形式</td>
	                     		<td>
	                     			<k:dictSelect name="helpType.id" itemName="援疆形式" className="form-control selectpicker" value="${leader.helpType.id}"/>
	                     		</td>
	                     		<td>援疆状态</td>
	                     		<td>
	                     			<k:dictSelect name="stateType.id" itemName="援疆状态" className="form-control selectpicker" value="${leader.stateType.id}"/>
	                     		</td>
	                     	</tr>
	                     </table>
						
						<!--  
						<div class="form-actions">
							<div class="row">
								<div class="col-md-12">
									<button class="btn btn-default" type="submit">
										取消
									</button>
									<button class="btn btn-primary" type="submit">
										<i class="fa fa-save"></i>
										保存
									</button>
								</div>
							</div>
						</div>
						-->
	
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
