package com.kzw.demo.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.kzw.system.entity.AppUser;
import com.kzw.system.entity.Dictionary;

/**
 * 干部
 */
@Entity
@Table(name="demo_leader")
public class Leader {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	// 姓名
	private String name;
	// 性别
	@ManyToOne
	@JoinColumn(name="dict_sex")
	private Dictionary sex;
	// 民族
	@ManyToOne
	@JoinColumn(name="dict_nation")
	private Dictionary nation;
	// 学历
	@ManyToOne
	@JoinColumn(name="dict_xueli")
	private Dictionary xueli;
	// 政治面貌
	@ManyToOne
	@JoinColumn(name="dict_zzmm")
	private Dictionary zzmm;
	// 身份证
	private String cardNo;
	// 援疆批次
	@ManyToOne
	@JoinColumn(name="dict_batchNo")
	private Dictionary batchNo;
	// 服务期限
	@ManyToOne
	@JoinColumn(name="dict_endService")
	private Dictionary endService;
	// 进疆时间
	private Date inTime;
	// 离疆时间
	private Date outTime;
	// 援疆形式
	@ManyToOne
	@JoinColumn(name="dict_helpType")
	private Dictionary helpType;
	// 状态
	@ManyToOne
	@JoinColumn(name="dict_stateType")
	private Dictionary stateType;
	// 拥有多个家庭成员
	@OneToMany(mappedBy="leader")
	private Set<FamilyMember> members = new HashSet<FamilyMember>();
	// 拥有多个工作纪要
	@OneToMany(mappedBy="leader")
	private Set<Activity> activitys = new HashSet<Activity>();

	// 录入者
	@ManyToOne
	@JoinColumn(name="record_userId")
	private AppUser recordUser;
	// 录入时间
	private Date recordTime;

	public Leader() {
	}
	
	public Leader(Integer id) {
		this.id = id;
	}
	
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

	public Dictionary getSex() {
		return sex;
	}

	public void setSex(Dictionary sex) {
		this.sex = sex;
	}

	public Dictionary getNation() {
		return nation;
	}

	public void setNation(Dictionary nation) {
		this.nation = nation;
	}

	public Dictionary getXueli() {
		return xueli;
	}

	public void setXueli(Dictionary xueli) {
		this.xueli = xueli;
	}

	public Dictionary getZzmm() {
		return zzmm;
	}

	public void setZzmm(Dictionary zzmm) {
		this.zzmm = zzmm;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public Dictionary getBatchNo() {
		return batchNo;
	}

	public void setBatchNo(Dictionary batchNo) {
		this.batchNo = batchNo;
	}

	public Dictionary getEndService() {
		return endService;
	}

	public void setEndService(Dictionary endService) {
		this.endService = endService;
	}

	public Date getInTime() {
		return inTime;
	}

	public void setInTime(Date inTime) {
		this.inTime = inTime;
	}

	public Date getOutTime() {
		return outTime;
	}

	public void setOutTime(Date outTime) {
		this.outTime = outTime;
	}

	public Dictionary getHelpType() {
		return helpType;
	}

	public void setHelpType(Dictionary helpType) {
		this.helpType = helpType;
	}

	public Dictionary getStateType() {
		return stateType;
	}

	public void setStateType(Dictionary stateType) {
		this.stateType = stateType;
	}

	public Set<FamilyMember> getMembers() {
		return members;
	}

	public void setMembers(Set<FamilyMember> members) {
		this.members = members;
	}

	public Set<Activity> getActivitys() {
		return activitys;
	}

	public void setActivitys(Set<Activity> activitys) {
		this.activitys = activitys;
	}

	public AppUser getRecordUser() {
		return recordUser;
	}

	public void setRecordUser(AppUser recordUser) {
		this.recordUser = recordUser;
	}

	public Date getRecordTime() {
		return recordTime;
	}

	public void setRecordTime(Date recordTime) {
		this.recordTime = recordTime;
	}

}
