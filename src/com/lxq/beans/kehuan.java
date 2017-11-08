package com.lxq.beans;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="DY_KEHUAN")
public class kehuan {
	@Id
	@GeneratedValue(generator="system-uuid")
	@GenericGenerator(name = "system-uuid",strategy="uuid")
	@Column(name = "uuid", length=32)
	private String uuid;
	
	@Column(name = "dyName")
	private String dyName;
	
	@Column(name = "dyType")
	private String dyType;
	
	@Column(name = "dyDate")
	private String dyDate;
	
	@Column(name = "imagefm")
	private String imagefm;
	
	@Column(name = "linkName")
	private String linkName;
	
	@Column(name = "linkAdd")
	private String linkAdd;
	
	@Column(name = "smallText")
	private String smallText;
	
	@Column(name = "bigText")
	private String bigText;
	
	public String getDyDate() {
		return dyDate;
	}

	public void setDyDate(String dyDate) {
		this.dyDate = dyDate;
	}

	@Column(name = "createTime")
	private Timestamp createTime;


	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getDyName() {
		return dyName;
	}

	public void setDyName(String dyName) {
		this.dyName = dyName;
	}

	public String getDyType() {
		return dyType;
	}

	public void setDyType(String dyType) {
		this.dyType = dyType;
	}
	
	public String getSmallText() {
		return smallText;
	}

	public void setSmallText(String smallText) {
		this.smallText = smallText;
	}

	public String getBigText() {
		return bigText;
	}

	public void setBigText(String bigText) {
		this.bigText = bigText;
	}

	public String getImagefm() {
		return imagefm;
	}

	public void setImagefm(String imagefm) {
		this.imagefm = imagefm;
	}

	public String getLinkName() {
		return linkName;
	}

	public void setLinkName(String linkName) {
		this.linkName = linkName;
	}

	public String getLinkAdd() {
		return linkAdd;
	}

	public void setLinkAdd(String linkAdd) {
		this.linkAdd = linkAdd;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	
}
