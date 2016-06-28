package com.kzw.system.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="sys_dept")
public class Department {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	// 名称
	private String dname;
	// 排序
	private int sn;
	// 级别
	private int deepth;
	// 是否为叶子结点
	private Boolean leaf;
	
	// 上级部门
	@ManyToOne
	@JoinColumn(name="parent_id")
	private Department parent;
	
	public String getParentId() {
		if (parent == null) {
			return null;
		}
		return parent.getId() + "";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public int getSn() {
		return sn;
	}

	public void setSn(int sn) {
		this.sn = sn;
	}

	public int getDeepth() {
		return deepth;
	}

	public void setDeepth(int deepth) {
		this.deepth = deepth;
	}

	public Department getParent() {
		return parent;
	}

	public void setParent(Department parent) {
		this.parent = parent;
	}

	public Boolean getLeaf() {
		return leaf;
	}

	public void setLeaf(Boolean leaf) {
		this.leaf = leaf;
	}

}
