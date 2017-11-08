package com.lxq.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="DY_TAB")
public class Tab {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", length=11)
	private int id;
	
	@Column(name = "tabName")
	private String tabName;


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTabName() {
		return tabName;
	}

	public void setTabName(String tabName) {
		this.tabName = tabName;
	}

	@Override
	public String toString() {
		return "{\"id\":\"" + id + "\", \"tabName\":\"" + tabName + "\"}";
	}

}
