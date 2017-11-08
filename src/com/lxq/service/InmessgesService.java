package com.lxq.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lxq.beans.myText;
import com.lxq.dao.Dao;

@Service
@Transactional
public class InmessgesService {
	@Resource
	private Dao dao;
	
	/**
	 * 我的博文链表
	 */
	public List<myText> listText(){
		List<myText> list = dao.find("FROM myText ORDER BY creantime DESC");
		return list;
	}
	
	/**
	 * 获取到单个博文新闻详情
	 */
	public myText TextDalit(String id){
		List<myText> list = dao.find("FROM myText WHERE id='"+id+"'");
		return list.get(0);
	}
	
}
