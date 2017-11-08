package com.lxq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lxq.beans.myText;
import com.lxq.service.InmessgesService;

@Controller
@RequestMapping("/framework/user")
public class InmessgesController {
	@Autowired
	private InmessgesService userser;
	
	@RequestMapping(value = "/findOne.action", method = RequestMethod.POST)
	@ResponseBody
	public myText findOne(String id){
		return userser.TextDalit(id);
	}
}
