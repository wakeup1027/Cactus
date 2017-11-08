package com.lxq.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lxq.beans.Tab;
import com.lxq.service.TabService;

@Controller
@RequestMapping("/framework/tab")
public class TabController {
	@Autowired
	private TabService Tab;
	
	@RequestMapping(value = "/TabList.action", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> showsTab(int page, int rows) {
	 	  Map<String, Object> map = new HashMap<String, Object>();
	 	  map = Tab.TabList(page, rows);
	      return map;
	}
	
	@RequestMapping(value = "/addTab.action", method = RequestMethod.POST)
	@ResponseBody
	public int addTab(Tab tb){
		try {
			Tab.add(tb);
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}
	
	@RequestMapping(value = "/getTab.action")
	@ResponseBody
	public List<Tab> getTab(){
		List<Tab> listTab = Tab.getfind();
		return listTab;
	}

}
