package com.lxq.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp; 
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.lxq.beans.myText;
import com.lxq.service.adminService;

@Controller
@RequestMapping("/framework/admin")
public class adminController {
	private static final int FILE_SIZE = 16*1024;  //16K
	
	@SuppressWarnings("rawtypes")
	@Autowired
	private adminService admins;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/khList.action", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> showsMyText(int page, int rows) {
	 	  Map<String, Object> map = new HashMap<String, Object>();
	 	  map = admins.showsMyText(page, rows);
	      return map;
	}
		
	/**
	* ���ӡ��ҵĲ��ġ�
	*/
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/addMyText.action", method = RequestMethod.POST)
	@ResponseBody
	public int addMyText(@RequestParam(value="fenMian") MultipartFile file, myText myMa, HttpServletRequest request){
		//�Զ������·��
		String fileName = file.getOriginalFilename();  //��ȡ���ϴ��ļ����ļ���
		String fileType = fileName.substring(fileName.lastIndexOf(".")); //��ȡ���ϴ��ļ�������
		String chuangeName = System.currentTimeMillis()+fileType;
		String path = request.getSession().getServletContext().getRealPath("uploadImg"); //���ñ���·��
		String savePath = path+File.separator+chuangeName;
		InputStream inp = null;
		OutputStream out = null;
		try {
			inp = file.getInputStream();
			
			/*��������ļ���*/
			File files =  new File(savePath);
			FileOutputStream fout = new FileOutputStream(files);
			out = new BufferedOutputStream(fout); //ָ����������С
			
			/*�ֽ������ļ���*/
			byte[] buffer = new byte[FILE_SIZE];
			int length = 0;
			while((length = inp.read(buffer))>0){
				out.write(buffer, 0, length);  //��ʼд�뵽����ļ���
			}
			
			//��ʼ��������
			myMa.setCreantime(new Timestamp(new Date().getTime()));
			myMa.setImgPath("uploadImg/"+chuangeName);
			admins.add(myMa);
			
			return 1;
		} catch (IOException e1) {
			e1.printStackTrace();
		} finally{
			try {
				inp.close();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return 0;
	}
		
	/**
	* ɾ�����ҵĲ��ġ�
	*/
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/deletMyText.action", method = RequestMethod.POST)
	@ResponseBody
	public int deletMyText(String idstr){
		List<myText> mmjor = new ArrayList<myText>();
		String[] idstrCh = idstr.split(","); 
		for(String ids : idstrCh){
			myText mmjc = new myText();
			mmjc.setId(ids);
			mmjor.add(mmjc); 
		}
		try{
			admins.delet(mmjor);
			return 1;
		}catch(Exception e){
			return 0;
		}
	}
	
}
