package com.path.core.entity;

// Generated 2015-12-21 10:56:49 by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

/**
 * TbStudent generated by hbm2java
 */
@Entity
@Table(name = "tb_student", catalog = "path")
public class TbStudent implements java.io.Serializable {

	private long studentid;
	private String name;
	private String account;
	private String code;
	private String password;
	private String sex;
	private Date createdate;
	private Set<TbLog> tbLogs = new HashSet<TbLog>(0);

	public TbStudent() {
	}

	public TbStudent(long studentid, Date createdate) {
		this.studentid = studentid;
		this.createdate = createdate;
	}

	public TbStudent(long studentid, String name, String account, String code,
			String password, String sex, Date createdate, Set<TbLog> tbLogs) {
		this.studentid = studentid;
		this.name = name;
		this.account = account;
		this.code = code;
		this.password = password;
		this.sex = sex;
		this.createdate = createdate;
		this.tbLogs = tbLogs;
	}

	@Id
	@Column(name = "studentid", unique = true, nullable = false)
	@GeneratedValue(generator = "studenttableGenerator")
	@GenericGenerator(name = "studenttableGenerator", strategy = "increment")
	public long getStudentid() {
		return this.studentid;
	}

	public void setStudentid(long studentid) {
		this.studentid = studentid;
	}

	@Column(name = "name", length = 200)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "account", length = 200)
	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	@Column(name = "code", length = 200)
	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "password", length = 200)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "sex", length = 10)
	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "createdate", nullable = false, length = 19)
	public Date getCreatedate() {
		return this.createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "tbStudent")
	public Set<TbLog> getTbLogs() {
		return this.tbLogs;
	}

	public void setTbLogs(Set<TbLog> tbLogs) {
		this.tbLogs = tbLogs;
	}

}
