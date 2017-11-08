package com.lxq.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.lxq.beans.kehuan;
import com.lxq.service.KehuanService;

@Controller
@RequestMapping("/framework/kehuan")
public class KehuanController {
	
	
	@Autowired
	private KehuanService khuan;
	
	@RequestMapping(value = "/khList.action", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> showsMyText(int page, int rows) {
	 	  Map<String, Object> map = new HashMap<String, Object>();
	 	  map = khuan.kehuanList(page, rows);
	      return map;
	}
	
	@RequestMapping(value = "/addKehuan.action", method = RequestMethod.POST)
	@ResponseBody
	public int addDyInfo(@RequestParam(value="fenMian") MultipartFile file, kehuan kh, HttpServletRequest request){
		try {
			kh.setCreateTime(new Timestamp(new Date().getTime()));
			kh.setImagefm("uploadImg/"+khuan.upImages(file, request));
			khuan.add(kh);
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}
	
	@RequestMapping(value = "/upDyInfo.action", method = RequestMethod.POST)
	@ResponseBody
	public int upDyInfo(@RequestParam(value="fenMian") MultipartFile file, kehuan kh, HttpServletRequest request){
		try {
			kh.setCreateTime(new Timestamp(new Date().getTime()));
			kh.setImagefm("uploadImg/"+khuan.upImages(file, request));
			khuan.update(kh);
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}

}
