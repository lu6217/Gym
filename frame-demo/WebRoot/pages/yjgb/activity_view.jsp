<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.kzw.com/mytag" prefix="k"%>
<!-- Bread crumb is created dynamically -->


<!--
	The ID "widget-grid" will start to initialize all widgets below 
	You do not need to use widgets if you dont want to. Simply remove 
	the <section></section> and you can use wells or panels instead 
-->

<!-- widget grid -->
<section id="activity-widget" class="">
	<div class="row">
		<div class="col-md-12 well">
		<form class="form-inline form-search" method="post">
  			<div class="form-group">
		    	姓名 <input type="text" style="width:120px;" class="form-control" name="Q_LKS_name">
		  	</div>
		  	<div class="form-group">
		    	性别 <k:dictSelect name="Q_EQI_sex.id" className="form-control" itemName="性别" headerKey=""/>
		  	</div>
		  	<div class="form-group">
		    	入疆时间 <input type="text" style="width:120px;" class="form-control" onfocus="WdatePicker()" name="Q_GTD_inTime">
		  	</div>
		  	<a class="btn btn-primary btn-sm btn-submit"><span class="glyphicon glyphicon-search"></span> 查询</a>
		  	<a class="btn btn-default btn-sm btn-clear"><span class="glyphicon glyphicon-remove"></span> 清除</a>
		</form>
		</div>
	</div>
	<!-- row -->
	<div class="row">
		
		<!-- NEW WIDGET START -->
			<div class="col-md-5">
				<table id="master-grid2"></table>
				<div id="master-pager2"></div>
			</div>	
			<div class="col-md-7">
				<table id="detail-grid2"></table>
				<div id="detail-pager2"></div>				
			</div>
		<!-- WIDGET END -->
		
		<!--  
		<table width="100%">
			<tr>
				<td width="45%" style="padding-left: 15px">
					<table id="master-grid"></table>
					<div id="master-pager"></div>
				</td>
				<td style="padding-left: 15px">
					<table id="detail-grid"></table>
					<div id="detail-pager"></div>		
				</td>
			</tr>
		</table>
		-->
		
	</div>

	<!-- end row -->

</section>
<!-- end widget grid -->

<script type="text/javascript">
	 
	/* DO NOT REMOVE : GLOBAL FUNCTIONS!
	 *
	 * pageSetUp(); WILL CALL THE FOLLOWING FUNCTIONS
	 *
	 * // activate tooltips
	 * $("[rel=tooltip]").tooltip();
	 *
	 * // activate popovers
	 * $("[rel=popover]").popover();
	 *
	 * // activate popovers with hover states
	 * $("[rel=popover-hover]").popover({ trigger: "hover" });
	 *
	 * // activate inline charts
	 * runAllCharts();
	 *
	 * // setup widgets
	 * setup_widgets_desktop();
	 *
	 * // run form elements
	 * runAllForms();
	 *
	 ********************************
	 *
	 * pageSetUp() is needed whenever you load a page.
	 * It initializes and checks for all basic elements of the page
	 * and makes rendering easier.
	 *
	 */

	pageSetUp();
	
	/*
	 * ALL PAGE RELATED SCRIPTS CAN GO BELOW HERE
	 * eg alert("my home function");
	 * 
	 * var pagefunction = function() {
	 *   ...
	 * }
	 * loadScript("js/plugin/_PLUGIN_NAME_.js", pagefunction);
	 * 
	 */
	 
	 $(function() {
		// 查询
		var widget = $('#activity-widget');
		var grid   = $('#master-grid2');
		var form   = widget.find('.form-search');
		var submitBtn = form.find('.btn-submit');
		var clearBtn  = form.find('.btn-clear');
		// 从表
		var detailGrid  = $('#detail-grid2');
		
		// 设置gird
		grid.jqGrid({
			url: 'leader/list',
			caption: '<span class="glyphicon glyphicon-list"></span> 领导信息列表',
			colModel: [
				{label: 'ID', name: 'id', hidden: true},
				{label: '姓名', name: 'name', width: 100},
				{label: '性别', name: 'sex.itemValue', width: 100},
				{label: '民族', name: 'nation.itemValue', width: 100},
				{label: '身份证', name: 'cardNo', width: 100}
			],
			pager: '#master-pager2',
			multiselect: false,
			onSelectRow: showDetail,
			onSortCol: clearDetail,
			onPaging: clearDetail,
		});
		// 设置导航条
		grid.navGrid('#master-pager2',{add:false, edit:false, del:false, search:false});
		
		// detail-grid
		detailGrid.jqGrid({			
			caption: '<span class="glyphicon glyphicon-list"></span> 所属领导：无',
			colModel: [
				{label: 'ID', name: 'id', hidden: true},
				{label: '开始时间', name: 'beginTime', width: 100},
				{label: '结束时间', name: 'endTime', width: 100},
				{label: '活动介绍', name: 'summary', width: 100},
				{label: '活动详细', name: 'info', width: 300}
			],
			pager: '#detail-pager2'
		});
		// 设置导航条
		detailGrid.navGrid('#detail-pager2', 
				{addfunc: addfunc, editfunc: editfunc, delfunc: delfunc, search:false});
		
		// "add"
		function addfunc() {
			var id = grid.jqGrid('getGridParam', 'selrow');
			if(!id) {
				layer.msg('请先选择左侧的领导！', {icon: 5});
				return;
			}
			layer.open({
				type: 2,
				title: '工作纪要信息详情',
				area: ['500px', '450px'],
				maxmin: true,
			    content: 'pages/yjgb/activity_form.jsp',
			    btn: ['保存', '关闭'],
			    yes: function(index, layero) {
			    	var form = layer.getChildFrame('form', index);
			    	$.post('./activity/save/' + id, form.serialize(), function(json){
			    		//刷新表格
			    		if(json.success) {
			    			detailGrid.trigger("reloadGrid", [{page: 1}]);
			    			layer.msg('保存成功', {icon: 1});
			    		} else {
			    			layer.msg('保存失败', {icon: 2});
			    		}
			    		layer.close(index);
			    	}, 'json');
			    }
			});		
		};
		// "edit"
		function editfunc(rowid) {
			var id = grid.jqGrid('getGridParam', 'selrow');
			if(!id) {
				layer.msg('请先选择左侧的领导！', {icon: 5});
				return;
			}
			layer.open({
				type: 2,
				title: '工作纪要信息详情',
				area: ['500px', '450px'],
				maxmin: true,
			    content: './activity/get/' + rowid,
			    btn: ['保存', '关闭'],
			    btn1: function(index, layero) {
			    	var form = layer.getChildFrame('form', index);
			    	$.post('./activity/save/' + id, form.serialize(), function(json){
			    		if(json.success) {
			    			detailGrid.trigger("reloadGrid", [{page: 1}]);
			    			layer.msg('保存成功', {icon: 1});
			    		} else {
			    			layer.msg('保存失败', {icon: 2});
			    		}		    		
			    	}, 'json');
			    }
			});		
		}
		// "del"
		function delfunc() {
			
			
		}
		
		// 提交
		submitBtn.click(function() {
			var params = form.serializeObject();
			var postData = grid.jqGrid('getGridParam', 'postData') || {};
			$.extend(postData, params);
			grid.jqGrid('setGridParam', {postData: postData}).trigger("reloadGrid", [{page: 1}]);
		});		
		// 清除
		clearBtn.click(function() {
			form[0].reset();
		});
		
		// 显示detail		
		function showDetail(rowId, selected) {
			if(rowId != null) {
				//获得该行信息
				var row = grid.jqGrid('getRowData', rowId);
				detailGrid.jqGrid('setGridParam', {url: 'activity/list/'+rowId});
				detailGrid.jqGrid('setCaption', '<span class="glyphicon glyphicon-list"></span> 所属领导：'+row.name);
				detailGrid.trigger("reloadGrid");
			}						
		};
		// 清除detail
		function clearDetail() {
			detailGrid.jqGrid('setGridParam',{url: "about:blank"}); //todo: 
			detailGrid.jqGrid('setCaption', '<span class="glyphicon glyphicon-list"></span> 所属领导：无');
			detailGrid.trigger("reloadGrid");
		}
		
	});
	
</script>
