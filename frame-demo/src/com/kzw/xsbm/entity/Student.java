package com.kzw.xsbm.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.kzw.system.entity.Dictionary;

@Entity
@Table(name="xsbm_student")
public class Student {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	// 姓名
	@Column(unique=true, length=50)
	private String name;
	// 学号
	@Column(length=20)
	private String sno;
	// 年龄
	private int age;
	// 注册时间
	private Date ctime;
	// 性别
	@ManyToOne
	@JoinColumn(name="dict_sex")
	private Dictionary sex;
	// 民族
	@ManyToOne
	@JoinColumn(name="dict_nation")
	private Dictionary nation;

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

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Date getCtime() {
		return ctime;
	}

	public void setCtime(Date ctime) {
		this.ctime = ctime;
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

}
