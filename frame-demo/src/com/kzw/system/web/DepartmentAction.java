package com.kzw.system.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kzw.core.orm.StringPropertyFilter;
import com.kzw.core.util.JSON;
import com.kzw.core.util.web.ResponseUtils;
import com.kzw.system.entity.Department;
import com.kzw.system.service.DepartmentService;

@Controller
@RequestMapping("/department")
public class DepartmentAction {

	@Autowired
	private DepartmentService departmentService;
	
	@RequestMapping("list")
	public void list(HttpServletRequest request, HttpServletResponse response) {
		List<StringPropertyFilter> filters = StringPropertyFilter.buildFromHttpRequest(request);
		List<Department> list = departmentService.search(filters);
		String json = new JSON(list).buildWithFilters(3);
		ResponseUtils.renderJson(response, json);
	}
}
