package com.kzw.xsbm.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kzw.comm.vo.Msg;
import com.kzw.core.orm.Page;
import com.kzw.core.orm.PageRequest;
import com.kzw.core.orm.StringPropertyFilter;
import com.kzw.core.util.BeanUtil;
import com.kzw.core.util.JSON;
import com.kzw.core.util.web.ResponseUtils;
import com.kzw.system.entity.Dictionary;
import com.kzw.xsbm.entity.Student;
import com.kzw.xsbm.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentAction {

	@Autowired
	private StudentService studentService;
	
	@RequestMapping("view")
	public String view() {
		return "xsbm/student_view";
	}
	
	@RequestMapping("list")
	public void list(PageRequest pageRequest, HttpServletRequest request, HttpServletResponse response) {
		List<StringPropertyFilter> filters = StringPropertyFilter.buildFromHttpRequest(request);
		Page<Student> page = studentService.search2(pageRequest, filters);
		String json = new JSON(page).buildWithFilters(3);
		ResponseUtils.renderJson(response, json);
	}
	
	@ResponseBody
	@RequestMapping("save")
	public Msg save(Student student) {
		if (student.getId() == null) {
			studentService.saveOrUpdate(student);
		} else {
			Student orgStudent = studentService.get(student.getId());
			try {
				// 注意：将表单对象的非空值赋给数据库中的记录
				BeanUtil.copyNotNullProperties(orgStudent, student);
				studentService.saveOrUpdate(orgStudent);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return new Msg(true);
	}
	
	@RequestMapping("get/{id}")
	public String get(@PathVariable("id")int id, Model model) {
		Student student = studentService.get(id);
		model.addAttribute("student", student);
		return "xsbm/student_form";
	}
	
	@RequestMapping("delete")
	@ResponseBody
	public Msg delete(String ids) {
		studentService.remove(ids);
		return new Msg(true);
	}
	
	@RequestMapping("init")
	public void init() {
		for(int i=0; i<100; i++) {
			Student stu = new Student();
			stu.setName("学生" + i);
			stu.setSno(10000+i + "");
			stu.setAge((20+i) % 30);
			stu.setCtime(new Date());
			stu.setSex(new Dictionary(187 + i%2));
			stu.setNation(new Dictionary(104));
			studentService.saveOrUpdate(stu);
		}
	}
	
//	@RequestMapping("test")
//	public void test() {
//		Student s = new Student();
//		s.setName("学生"+ 0);
//		s.setSno("10111");
//		s.setAge(18);
//		s.setCtime(new Date());
//		s.setSex(new Dictionary(187 + 1%2));
//		s.setNation(new Dictionary(104));
//		studentService.saveOrUpdate(s);
//	}
	
	@InitBinder
	public void initBinder1(WebDataBinder binder) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(df, true));
	}
}
