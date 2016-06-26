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
import com.kzw.demo.entity.FamilyMember;
import com.kzw.demo.entity.Leader;
import com.kzw.demo.service.FamilyMemberService;

@Controller
@RequestMapping("/member")
public class FamilyMemberAction {

	@Autowired
	private FamilyMemberService memberService;
	
	@RequestMapping("view")
	public String view() {
		return "yjgb/member_view";
	}
	
	@RequestMapping("list/{leadId}")
	public void list(@PathVariable("leadId")int leaderId, PageRequest pageRequest, HttpServletResponse response) {
		// 获得查询条件
		Page<FamilyMember> page = memberService.search(pageRequest, new PropertyFilter("leader.id", leaderId));
		
		String json = new JSON(page).buildWithFilters(3);
		ResponseUtils.renderJson(response, json);
	}
	
	/**
	 * 保存
	 * */
	@RequestMapping("save/{leadId}")
	@ResponseBody
	public Msg save(FamilyMember member, @PathVariable("leadId") Integer leaderId) {
		Leader leader = new Leader(leaderId);
		member.setLeader(leader);
		memberService.saveOrUpdate(member);
		return new Msg(true);
	}
	
	@RequestMapping("get/{id}")
	public String get(@PathVariable("id")int id, Model model) {
		FamilyMember member = memberService.get(id);
		model.addAttribute("member", member);
		return "yjgb/member_form";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(df, true));
	}
}
