package com.lxq.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.lxq.beans.kehuan;
import com.lxq.dao.Dao;

@Service
@Transactional
public class KehuanService {
	private static final int FILE_SIZE = 16*1024;  //16K
	
	@Resource
	private Dao dao;
	
	public Map<String, Object> kehuanList(int page, int rows){
		Map<String, Object> map = new HashMap<String, Object>();
		String hql = "FROM kehuan ORDER BY createTime DESC";
		List<kehuan> orders = this.dao.findByPage(hql, Integer.valueOf(page), Integer.valueOf(rows));
		Long total = this.dao.count(kehuan.class,hql);
		map.put("rows", orders);
	    map.put("total", total);
	    return map;
	}
	
	public List<kehuan> getfind(){
		List<kehuan> kh = dao.find("FROM kehuan ORDER BY createTime DESC");
		return kh;
	}
	
	public void add(kehuan sd){
		dao.save(sd);
	}
	
	public void update(kehuan sd){
		dao.update(sd);
	}
	
	/**
	 * �ϴ�����ķ���
	 * @param file
	 * @param request
	 * @return
	 */
	public String upImages(MultipartFile file, HttpServletRequest request){
		//�Զ������·��
		String fileName = file.getOriginalFilename();  //��ȡ���ϴ��ļ����ļ���
		System.out.println("��ȡ���ϴ����ļ�����"+fileName); 
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
		return chuangeName;
	}

}
