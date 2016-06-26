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
						<input type="hidden" name="id" value="${dataImport.id}">
	                     <table class="bs-table">
	                     	<tr>
	                     		<td width="70">导入时间</td>
	                     		<td><input class="form-control" onfocus="WdatePicker()" name ="ctime" type="text" value="<fmt:formatDate value="${activity.beginTime}" pattern="yyyy-MM-dd"/>"/></td>
	                     	</tr>
	                     	<tr>
	                     		<td width="70">上报部门</td>
	                     		<td> 
	                     			<input name="deptIds" id="deptIds" type="hidden">
	                     			<input id="deptNames" name ="deptNames" class="form-control" style="width:78%;display:inline;float:left;"/>
	                     			<a href="javascript:selectDept()" class="btn btn-default"><span class="glyphicon glyphicon-search"></span> 选择</a>
	                     		</td>
	                     	</tr>
	                     	<tr>
	                     		<td width="70">选择文件</td>
	                     		<td> 
	                     			<input class="form-control" style="width:78%;display:inline;float:left;" name ="endTime" type="text" value=""/>
	                     			<a href="javascript:selectFileAttach()" class="btn btn-default"><span class="glyphicon glyphicon-search"></span> 选择</a>
	                     		</td>
	                     	</tr>
	                     	<tr>
	                     		<td>备注</td>
	                     		<td>
	                     			<textarea class="form-control" rows="4" name="note">${dataImport.note}</textarea>
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
		
		<script type="text/javascript" src="../../js/plugin/layer/layer.js"></script>
		
		<!--[if IE 8]>
			<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
		<![endif]-->
		
		
		<script type="text/javascript">
		function selectDept() {
			// 传递的参数
			top.layer.params = {
				selectDeptIds: '2,3'
			};
			top.layer.open({
				type: 2,
				title: '部门选择器',
				content: '<%=path%>/pages/selector/dept_selector.jsp',
				area: ['420px', '620px'],
				maxmin: true,
				btn: ['确定', '取消'],
				btn1: function(index, layero) {
					// 获得值
					var arr = layero.find('iframe')[0].contentWindow.getSelectDept(true);
					$('#deptIds').val(arr[0]);
					$('#deptNames').val(arr[1]);
				}
			});
		}
		
		// 选择附件
		function selectFileAttach() {
			top.layer.open({
				type: 2,
				title: '文件选择器',
				content: '<%=path%>/pages/selector/fileAttach_selector_pic.jsp',
				area: ['800px', '600px'],
				maxmin: true,
				btn: ['确定', '取消'],
				btn1: function(index, layero) {
					// 获得值
					var arr = layero.find('iframe')[0].contentWindow.getSelectDept(true);
					$('#deptIds').val(arr[0]);
					$('#deptNames').val(arr[1]);
				}
			});	
		}
		</script>

	</body>

</html>
