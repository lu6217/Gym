package com.kzw.system.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kzw.system.entity.Dictionary;
import com.kzw.system.service.DictionaryService;

@Controller
@RequestMapping("/dict")
public class DictionaryAction {

	@Autowired
	private DictionaryService dictionaryService;
	
	@RequestMapping("save")
	public String save(Dictionary dict) {
		System.out.println(dict.getItemName() + ", " + dict.getItemValue());
		
		dictionaryService.saveOrUpdate(dict);
		
		return "redirect:/dict/list";
	}
	
	@RequestMapping("list")
	public String list(Model model) {
		
		List<Dictionary> list = dictionaryService.getAll();
		model.addAttribute("dicts", list);
		
		return "dict/view";
	}
}
