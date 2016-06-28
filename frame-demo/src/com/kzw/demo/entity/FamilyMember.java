package com.kzw.demo.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.kzw.system.entity.Dictionary;

/**
 * 家庭成员
 */
@Entity
@Table(name="demo_family_member")
public class FamilyMember {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	// 姓名
	private String name;
	// 称谓
	private String chengWei;
	// 出生年月
	private Date birthday;
	// 政治面貌
	@ManyToOne
	@JoinColumn(name="dict_zzmm")
	private Dictionary zzmm;
	// 联系电话
	private String phone;
	// 工作单位
	private String workAddr;

	// 所属干部
	@ManyToOne
	@JoinColumn(name="leader_id")
	private Leader leader;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getChengWei() {
		return chengWei;
	}

	public void setChengWei(String chengWei) {
		this.chengWei = chengWei;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Dictionary getZzmm() {
		return zzmm;
	}

	public void setZzmm(Dictionary zzmm) {
		this.zzmm = zzmm;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getWorkAddr() {
		return workAddr;
	}

	public void setWorkAddr(String workAddr) {
		this.workAddr = workAddr;
	}

	public Leader getLeader() {
		return leader;
	}

	public void setLeader(Leader leader) {
		this.leader = leader;
	}

}
