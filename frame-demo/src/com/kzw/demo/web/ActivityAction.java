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
import com.kzw.core.orm.PropertyFilter;
import com.kzw.core.util.JSON;
import com.kzw.core.util.web.ResponseUtils;
import com.kzw.demo.entity.Activity;
import com.kzw.demo.entity.Leader;
import com.kzw.demo.service.ActivityService;

@Controller
@RequestMapping("/activity")
public class ActivityAction {

	@Autowired
	private ActivityService activityService;
	
	@RequestMapping("view")
	public String view() {
		return "yjgb/activity_view";
	}
	
	@RequestMapping("list/{leadId}")
	public void list(@PathVariable("leadId")int leaderId, PageRequest pageRequest, HttpServletResponse response) {
		// 获得查询条件
		Page<Activity> page = activityService.search(pageRequest, new PropertyFilter("leader.id", leaderId));
		
		String json = new JSON(page).buildWithFilters(3);
		ResponseUtils.renderJson(response, json);
	}
	
	/**
	 * 保存
	 * */
	@RequestMapping("save/{leadId}")
	@ResponseBody
	public Msg save(Activity activity, @PathVariable("leadId") Integer leaderId) {
		Leader leader = new Leader(leaderId);
		activity.setLeader(leader);
		activityService.saveOrUpdate(activity);
		return new Msg(true);
	}
	
	@RequestMapping("get/{id}")
	public String get(@PathVariable("id")int id, Model model) {
		Activity activity = activityService.get(id);
		model.addAttribute("activity", activity);
		return "yjgb/activity_form";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(df, true));
	}
}
