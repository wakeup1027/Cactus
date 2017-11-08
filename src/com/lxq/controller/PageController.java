package com.lxq.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lxq.beans.kehuan;
import com.lxq.service.KehuanService;

@Controller
@RequestMapping("/console/page")
public class PageController {
	@Autowired
	private KehuanService khuan;
	
	@RequestMapping(value = "/index.action")
	public String showsMyText(Map<String, Object> map) {
		System.out.println("sadasdasd");
		List<kehuan> kl = khuan.getfind();
		map.put("sysMenus", kl); 
	    return "index";
	}
}
