<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.kzw.com/mytag" prefix="k"%>
<!-- Bread crumb is created dynamically -->


<!--
	The ID "widget-grid" will start to initialize all widgets below 
	You do not need to use widgets if you dont want to. Simply remove 
	the <section></section> and you can use wells or panels instead 
-->

<!-- widget grid -->
<section id="dataImport-widget" class="">
	<div class="row">
		<div class="col-md-12 well">
		<form class="form-inline form-search" method="post">
		  	<div class="form-group">
		    	导入时间 <input type="text" style="width:120px;" class="form-control" onfocus="WdatePicker()" name="Q_GED_inTime">
		    	至 <input type="text" style="width:120px;" class="form-control" onfocus="WdatePicker()" name="Q_LED_inTime">
		  	</div>
		  	<a class="btn btn-primary btn-sm btn-submit"><span class="glyphicon glyphicon-search"></span> 查询</a>
		  	<a class="btn btn-default btn-sm btn-clear"><span class="glyphicon glyphicon-remove"></span> 清除</a>
		</form>
		</div>
	</div>
	<!-- row -->
	<div class="row">
		
		<!-- NEW WIDGET START -->
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				
				<table id="dataImport-grid"></table>
				<div id="dataImport-pager"></div>

		</article>
		<!-- WIDGET END -->
		
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
		var widget = $('#dataImport-widget');
		var grid   = $('#dataImport-grid');
		var searchForm = widget.find('.form-search');
		var submitBtn  = searchForm.find('.btn-submit');
		var clearBtn   = searchForm.find('.btn-clear');
		
		// JS加载完成之后
		grid.jqGrid({
			url: 'dataImport/list',
			caption: '<span class="glyphicon glyphicon-list"></span> 干部信息列表',
			colModel: [
				{label: 'ID', name: 'id', hidden: true},
				{label: '操作', name: 'id', width: 120, formatter: function(v) {
					return '<a href="javascript:editfunc('+v+')" class="btn btn-primary btn-xs">编辑</a>' +
							'<a href="javascript:del('+v+')" style="margin-left:10px;" class="btn btn-danger btn-xs">删除</a>';			
				}},
				{label: '导入时间', name: 'ctime', width: 100},
				{label: '上传单位', name: 'fromDept.dname', width: 100},
				{label: '上传文件的路径', name: 'uploadFile', width: 200},
				{label: '导入干部数', name: 'leaderCnt', width: 100},
				{label: '导入家庭成员数', name: 'memberCnt', width: 100},
				{label: '导入工作纪要数', name: 'activityCnt', width: 100},
				{label: '备注', name: 'note', width: 100}
				
			],
			pager: '#dataImport-pager',
			multiboxonly: true
		});
		grid.navGrid('#dataImport-pager',
			{addfunc: addfunc, edit:false, search:false,
			addtext:'增加', deltext:'删除', refreshtext:'刷新'}, //参数配置
			{}, //prmEdit 
			{}, //prmAdd 
			{}, //prmDel 
			{}, //prmSearch 
			{}  //prmView
		);
		
		
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
		
		// "增加"弹出框
		function addfunc() {
			layer.open({
				type: 2,
				title: '干部信息详情',
				area: ['500px', '340px'],
				maxmin: true,
			    content: 'pages/yjgb/dataImport_form.jsp',
			    btn: ['保存', '关闭'],
			    btn1: function(index, layero) {
			    	var form = layer.getChildFrame('form', index);
			    	$.post('./dataImport/save', form.serialize(), function(json){
			    		if(json.success) {
			    			grid.trigger("reloadGrid", [{page: 1}]);
			    			layer.msg('保存成功', {icon: 1});
			    		} else {
			    			layer.msg('保存失败', {icon: 2});
			    		}
			    	}, 'json');
			    }
			});		
		}
		// "删除"功能
		function del(rowid) {
			layer.confirm('确定删除该条记录吗？', {icon:3, title:'温馨提示'}, function(index) {
				$.getJSON('./leader/del/' + rowid, function(json) {
					if(json.success) {
						grid.trigger("reloadGrid", [{page: 1}]);
		    			layer.msg('操作成功！', {icon: 1});		
					} else {
						layer.msg('操作失败！', {icon: 2});					
					}
				});
				layer.close(index);
			});
		}
		
		// end jquery
	});
	
</script>
