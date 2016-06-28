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
		<base href="<%=basePath%>pages/selector/">
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
		
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/jqgrid/ui.jqgrid-bootstrap.css">
		<link rel="stylesheet" type="text/css" media="screen" href="../../css/your_style.css">
	</head>
<body>

<section id="deptSelector" class="container">
	<div class="row">
		<div class="col-xs-12 well">
		<form class="form-inline form-search" method="post">
			<table>
				<tr>
					<td>
						部门名称 <input type="text" style="width:120px;height:30px;" name="Q_LKS_dname">
		  				<a class="btn btn-primary btn-sm btn-submit"><span class="glyphicon glyphicon-search"></span> 查询</a>
		  				<a class="btn btn-default btn-sm btn-clear"><span class="glyphicon glyphicon-remove"></span> 清除</a>
					</td>
				</tr>
			</table>
		  	
		</form>
		</div>
	</div>
	
	<!-- row -->
	<div class="row">
		<!-- NEW WIDGET START -->
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<table id="deptSelector-grid"></table>
			<div id="deptSelector-pager"></div>	
		</article>
		<!-- WIDGET END -->
	</div>
	<!-- end row -->
	
</section>

		<script src="../../js/libs/jquery-2.1.1.min.js"></script>
		<script src="../../js/bootstrap/bootstrap.min.js"></script>
		<!-- jqGrid -->
		<script src="../../js/plugin/jqgrid/jquery.jqGrid.min.js"></script>
		<script src="../../js/plugin/jqgrid/grid.locale-cn.js"></script>
		<script src="../../js/KeExt.js"></script>
		
		<script type="text/javascript">
		//获得父窗口的变量
		var params = parent.layer.params || {};
		
		$(function() {
			// 查询
			var widget = $('#deptSelector');
			var grid   = $('#deptSelector-grid');
			var searchForm = widget.find('.form-search');
			var submitBtn  = searchForm.find('.btn-submit');
			var clearBtn   = searchForm.find('.btn-clear');
			
			grid.jqGrid({
				url: '<%=path%>/department/list',
				caption: '<span class="glyphicon glyphicon-list"></span> 部门信息列表',
				colModel: [
					{label:'ID', name: 'id', hidden: true},
					{label: '部门名称', name: 'dname', width: 100, sortable:false}
				],
				height: params.height || 200,
				pager: '#deptSelector-pager',
				
				multiselect: false,
				treeGrid: true,
				treeIcons: {leaf: 'glyphicon-link'},
				rownumbers: false,	//treeGrid：必须设置成false
				ExpandColumn: 'dname',
				ExpandColClick: false,
				treeGridModel: "adjacency", //使用parent_id时需要使用该模式
				treeReader: {
					level_field: "deepth",
				   	parent_id_field: "parentId", 
				   	leaf_field: "leaf"
				}
			});
			grid.navGrid('#deptSelector-pager', {add:false, edit:false, search:false, del:false});
			$('.ui-th-div').css('height', 24);
						
			
			// 查询
			submitBtn.click(function() {
				var params = searchForm.serializeObject();
				var postData = grid.jqGrid('getGridParam', 'postData') || {};
				$.extend(postData, params);
				grid.jqGrid('setGridParam', {postData: postData}).trigger("reloadGrid", [{page: 1}]);
			});
			// 清除
			clearBtn.click(function() {
				searchForm[0].reset();
			});			
		
			// end jquery
		});
		
		
		
		</script>

	</body>

</html>
