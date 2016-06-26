package com.kzw.demo.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.kzw.system.entity.Department;

/**
 * 数据上报
 */
@Entity
@Table(name="demp_data_import")
public class DataImport {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	// 导入时间
	private Date ctime;
	// 来源
	@ManyToOne
	@JoinColumn(name="from_deptId")
	private Department fromDept;
	// 上传文件的路径
	private String uploadFile;
	// 备注
	@Column(length=1000)
	private String note;
	// 导入干部数
	private int leaderCnt;
	// 导入家庭成员数
	private int memberCnt;
	// 导入工作纪要数
	private int activityCnt;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getCtime() {
		return ctime;
	}

	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}

	public Department getFromDept() {
		return fromDept;
	}

	public void setFromDept(Department fromDept) {
		this.fromDept = fromDept;
	}

	public String getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(String uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getLeaderCnt() {
		return leaderCnt;
	}

	public void setLeaderCnt(int leaderCnt) {
		this.leaderCnt = leaderCnt;
	}

	public int getMemberCnt() {
		return memberCnt;
	}

	public void setMemberCnt(int memberCnt) {
		this.memberCnt = memberCnt;
	}

	public int getActivityCnt() {
		return activityCnt;
	}

	public void setActivityCnt(int activityCnt) {
		this.activityCnt = activityCnt;
	}

}
