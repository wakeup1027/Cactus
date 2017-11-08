package com.lxq.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.lxq.beans.Tab;
import com.lxq.dao.Dao;

@Service
@Transactional
public class TabService {

	@Resource
	private Dao dao;
	
	public Map<String, Object> TabList(int page, int rows){
		Map<String, Object> map = new HashMap<String, Object>();
		String hql = "FROM Tab ORDER BY id ASC";
		List<Tab> orders = this.dao.findByPage(hql, Integer.valueOf(page), Integer.valueOf(rows));
		Long total = this.dao.count(Tab.class,hql);
		map.put("rows", orders);
	    map.put("total", total);
	    return map;
	}
	
	public List<Tab> getfind(){
		List<Tab> kh = dao.find("FROM Tab");
		return kh;
	}
	
	public void add(Tab sd){
		dao.save(sd);
	}
	
	public void update(Tab sd){
		dao.update(sd);
	}
	
}
