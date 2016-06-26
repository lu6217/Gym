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
		<form id="form-search" class="form-inline" method="post">
  			<div class="form-group">
		    	姓名 <input type="text" style="width:120px;" class="form-control" name="Q_LKS_name">
		  	</div>
		  	<div class="form-group">
		    	民族 <k:dictSelect name="Q_EQI_nation.id" className="form-control" itemName="民族" headerKey=""/>
		  	</div>
		  	<!-- 增加性别搜索功能 -->
		  	<div class="form-group">
		    	性别 <k:dictSelect name="Q_EQI_sex.id" className="form-control" itemName="性别" headerKey=""/>
		  	</div>
		  	
		  	<div class="form-group">
		    	注册时间 <input type="text" style="width:120px;" class="form-control" onfocus="WdatePicker()" name="Q_GTD_ctime">
		    	~ <input type="text" style="width:120px;" class="form-control" onfocus="WdatePicker()" name="Q_LTD_ctime">
		  	</div>
		  	<a id="btn-submit" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-search"></span> 查询</a>
		  	<a id="btn-clear" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-remove"></span> 清除</a>
		</form>
		</div>
	</div>
	<!-- row -->
	<div class="row">
		
		<!-- NEW WIDGET START -->
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				
				<table id="jq-grid"></table>
				<div id="jq-pager"></div>

		</article>
		<!-- WIDGET END -->
		
	</div>

	<!-- end row -->

</section>
<!-- end widget grid -->

<script type="text/javascript">

	var grid   = $('#jq-grid');
	var searchForm = $('#form-search');
	var submitBtn  = $('#btn-submit');
	var clearBtn   = $('#btn-clear');
	
	$(function() {
		// JS加载完成之后
		grid.jqGrid({//用jqGrid绘制表格
			height: $(document).height() - 300,
			url: 'student/list',//从指定服务器获得数据请求
			caption: '<i class="glyphicon glyphicon-list"></i> 学生信息列表',//标题信息
			colModel: [//表格列属性
				{label: 'ID', name: 'id', hidden: true, key: true},
				{label: '操作', name: 'id', width: 120, sortable: false, formatter: function(v) {//sortable指定是否支持排序
					return '<a href="javascript:editfunc('+v+')" class="btn btn-primary btn-xs">编辑</a>' +//这里v应该是该行的id
							'<a href="javascript:delfunc('+v+')" style="margin-left:10px;" class="btn btn-danger btn-xs">删除</a>';			
				}},
				{label: '姓名', name: 'name', width: 100},
				{label: '学号', name: 'sno', width: 100},
				{label: '性别', name: 'sex.itemValue', width: 100},
				{label: '民族', name: 'nation.itemValue', width: 100},
				{label: '年龄', name: 'age', width: 100},
				{label: '注册时间', name: 'ctime', width: 100}
			],
			pager: '#jq-pager',
			multiboxonly: false,//当multiboxonly 为ture时只有选择checkbox才会起作用
			ondblClickRow: editfunc//双击触发编辑属性
		});
		grid.navGrid('#jq-pager',
			{addfunc: addfunc, editfunc: editfunc, delfunc: delfunc, search: false,
			addtext:'增加', edittext:'编辑', deltext:'删除', refreshtext:'刷新'}
		);
		
		
		// 查询
		submitBtn.click(function() {
			var params = searchForm.serializeObject();//将form表单序列化为JSON对象
			var postData = grid.jqGrid('getGridParam', 'postData') || {};
			//扩展方法extend
			/*
			var result=$.extend({},{name:"Tom",age:21},{name:"Jerry",sex:"Boy"})
			那么合并后的结果
  			result={name:"Jerry",age:21,sex:"Boy"}
			如果后面的属性与前面的有冲突，则覆盖
			*/
			$.extend(postData, params);
			//触发器重新加载数据，设置搜索结果起始页为1
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
				title: '学生信息详情',
				area: ['500px', '250px'],
				maxmin: true,
			    content: ['pages/xsbm/student_form.jsp', 'yes'],
			    btn: ['保存', '关闭'],
			    btn1: function(index, layero) {
			    	var form = layer.getChildFrame('form', index);
			    	$.post('./student/save', form.serialize(), function(json){
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
			title: '学生信息详情',
			area: ['500px', '250px'],
			maxmin: true,
		    content: './student/get/' + rowid,
		    btn: ['保存', '关闭'],
		    btn1: function(index, layero) {
		    	var form = layer.getChildFrame('form', index);
		    	//$.post() 方法通过 HTTP POST 请求从服务器上请求数据。
		    	/*
		    	$.post(URL,data,callback);
				必需的 URL 参数规定您希望请求的 URL。
				可选的 data 参数规定连同请求发送的数据。
				可选的 callback 参数是请求成功后所执行的函数名。
		    	*/
		    	$.post('./student/save', form.serialize(), function(json){
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
			$.getJSON('./student/delete', {ids: rowid+''}, function(json) {
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
