<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.kzw.com/mytag" prefix="k"%>
<!-- Bread crumb is created dynamically -->

<!--
	The ID "widget-grid" will start to initialize all widgets below 
	You do not need to use widgets if you dont want to. Simply remove 
	the <section></section> and you can use wells or panels instead 
-->

<!-- widget grid -->
<section id="widget-grid" class="">
	<div class="row">
		<div class="well" style="margin-left: 15px;">
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
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				
				<table id="leader-grid"></table>
				<div id="leader-pager"></div>

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
	var widget = $('#widget-grid');
	var grid   = $('#leader-grid');
	var searchForm = widget.find('.form-search');
	var submitBtn  = searchForm.find('.btn-submit');
	var clearBtn   = searchForm.find('.btn-clear');
	
	$(function() {
		// JS加载完成之后
		grid.jqGrid({
			height: $(document).height() - 300,
			url: 'leader/list',
			caption: '<i class="glyphicon glyphicon-list"></i> 干部信息列表',
			colModel: [
				{label: 'ID', name: 'id', hidden: true, key: true},
				{label: '操作', name: 'id', width: 120, formatter: function(v) {
					return '<a href="javascript:editfunc('+v+')" class="btn btn-primary btn-xs">编辑</a>' +
							'<a href="javascript:delfunc('+v+')" style="margin-left:10px;" class="btn btn-danger btn-xs">删除</a>';			
				}},
				{label: '姓名', name: 'name', width: 100, editable: true},
				{label: '性别', name: 'sex.itemValue', width: 100},
				{label: '民族', name: 'nation.itemValue', width: 100},
				{label: '学历', name: 'xueli.itemValue', width: 100},
				{label: '政治面貌', name: 'zzmm.itemValue', width: 100},
				{label: '身份证', name: 'cardNo', width: 100},
				{label: '援疆批次', name: 'batchNo.itemValue', width: 100},
				{label: '服务期限', name: 'endService.itemValue', width: 100},
				{label: '进疆时间', name: 'inTime', width: 100},
				{label: '离疆时间', name: 'outTime', width: 100},
				{label: '援疆形式', name: 'helpType.itemValue', width: 100},
				{label: '状态', name: 'stateType.itemValue', width: 100}
			],
			pager: '#leader-pager',
			multiboxonly: false,
			ondblClickRow: editfunc
		});
		grid.navGrid('#leader-pager',
			{addfunc: addfunc, editfunc: editfunc, delfunc: delfunc, search: false,
			addtext:'增加', edittext:'编辑', deltext:'删除', refreshtext:'刷新'}, //参数配置
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
				area: ['700px', '300px'],
				maxmin: true,
			    content: ['pages/yjgb/leader_form.jsp', 'yes'],
			    btn: ['保存', '关闭'],
			    btn1: function(index, layero) {
			    	var form = layer.getChildFrame('form', index);
			    	$.post('./leader/save', form.serialize(), function(json){
			    		//刷新表格
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
		// end jquery
	});
	
	// "编辑"弹出框
	function editfunc(rowid) {
		//获得编辑行, 只能选中一行
		layer.open({
			type: 2,
			title: '家庭成员信息详情',
			area: ['700px', '300px'],
			maxmin: true,
		    content: './leader/get/' + rowid,
		    btn: ['保存', '关闭'],
		    btn1: function(index, layero) {
		    	var form = layer.getChildFrame('form', index);
		    	$.post('./leader/save', form.serialize(), function(json){
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
	function delfunc(rowid) {
		layer.confirm('确定删除该条记录吗？', {icon:3, title:'温馨提示'}, function(index) {
			$.getJSON('./leader/delete', {ids: rowid+''}, function(json) {
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
	
</script>
