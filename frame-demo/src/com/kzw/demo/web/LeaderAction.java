package com.kzw.demo.web;

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
import com.kzw.demo.entity.Leader;
import com.kzw.demo.service.LeaderService;
import com.kzw.system.entity.Dictionary;

@Controller
@RequestMapping("/leader")
public class LeaderAction {
	
	@Autowired
	private LeaderService leaderService;

	@RequestMapping("view")
	public String view() {
		return "yjgb/leader_view";
	}
	
	/**
	 * 处理ajax请求
	 * search=false&nd=1458295769589&rows=20&page=1&sidx=&sord=asc 
	 * */
	@RequestMapping("list")
	public void list(PageRequest pageRequest, HttpServletRequest request, HttpServletResponse response) {
		// 获得查询条件
		List<StringPropertyFilter> filters = StringPropertyFilter.buildFromHttpRequest(request);
		Page<Leader> page = leaderService.search2(pageRequest, filters);
		
		String json = new JSON(page).buildWithFilters(3, "members", "activitys", "recordUser");
		ResponseUtils.renderJson(response, json);		
	}
	
	/**
	 * 保存
	 * */
	@RequestMapping("save")
	@ResponseBody
	public Msg save(Leader leader) {
		if (leader.getId() == null) {
			leaderService.saveOrUpdate(leader);
		} else {
			Leader orgLeader = leaderService.get(leader.getId());
			try {
				BeanUtil.copyNotNullProperties(orgLeader, leader);
				// 时间无法正常复制
				orgLeader.setInTime(leader.getInTime());
				orgLeader.setOutTime(leader.getOutTime());
				
				leaderService.saveOrUpdate(orgLeader);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return new Msg(true);
	}
	
	@RequestMapping("get/{id}")
	public String get(@PathVariable("id")int id, Model model) {
		Leader leader = leaderService.get(id);
		model.addAttribute("leader", leader);
		return "yjgb/leader_form";
	}
	
	@RequestMapping("delete")
	@ResponseBody
	public Msg delete(String ids) {
		leaderService.remove(ids);
		return new Msg(true);
	}
	
	
	
	@RequestMapping("init")
	public void init() {
		for(int i=0; i<100; i++) {
			Leader leader = new Leader();
			leader.setBatchNo(new Dictionary(229));
			leader.setCardNo("100000" + i);
			leader.setEndService(new Dictionary(226));
			leader.setHelpType(new Dictionary(205));
			leader.setInTime(new Date());
			leader.setName("领导" + i);
			leader.setNation(new Dictionary(104));
			leader.setSex(new Dictionary(187));
			leader.setStateType(new Dictionary(207));
			leader.setXueli(new Dictionary(174));
			leader.setZzmm(new Dictionary(160));
			
			leaderService.saveOrUpdate(leader);
		}
	}
	
	@InitBinder
	public void initBinder1(WebDataBinder binder) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(df, true));
	}
	
}
