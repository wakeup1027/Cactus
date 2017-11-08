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
	 * �ҵĲ�������
	 */
	public List<myText> listText(){
		List<myText> list = dao.find("FROM myText ORDER BY creantime DESC");
		return list;
	}
	
	/**
	 * ��ȡ������������������
	 */
	public myText TextDalit(String id){
		List<myText> list = dao.find("FROM myText WHERE id='"+id+"'");
		return list.get(0);
	}
	
}
