package com.kzw.demo.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

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
import com.kzw.core.util.JSON;
import com.kzw.core.util.web.ResponseUtils;
import com.kzw.demo.entity.DataImport;
import com.kzw.demo.service.DataImportService;

@Controller
@RequestMapping("/dataImport")
public class DataImportAction {

	@Autowired
	private DataImportService importService;
	
	@RequestMapping("view")
	public String view() {
		return "yjgb/dataImport_view";
	}
	
	@RequestMapping("list")
	public void list(PageRequest pageRequest, HttpServletResponse response) {
		Page<DataImport> page = importService.getAll(pageRequest);
		String json = new JSON(page).buildWithFilters(3);
		ResponseUtils.renderJson(response, json);
	}
	
	/**
	 * 保存
	 * */
	@RequestMapping("save")
	@ResponseBody
	public Msg save(DataImport dataImport) {
		importService.saveOrUpdate(dataImport);
		return new Msg(true);
	}
	
	@RequestMapping("get/{id}")
	public String get(@PathVariable("id")int id, Model model) {
		DataImport dataImport = importService.get(id);
		model.addAttribute("dataImport", dataImport);
		return "yjgb/dataImport_form";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(df, true));
	}
}
