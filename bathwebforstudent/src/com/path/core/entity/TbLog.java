package com.path.core.entity;

// Generated 2015-12-21 10:56:49 by Hibernate Tools 3.4.0.CR1

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

/**
 * TbLog generated by hbm2java
 */
@Entity
@Table(name = "tb_log", catalog = "path")
public class TbLog implements java.io.Serializable {

	private int logid;
	private TbPath tbPath;
	private TbStudent tbStudent;
	private Date createdate;
	private Date enddate;
	private String state;
	private String seatid;

	public TbLog() {
	}

	public TbLog(int logid, Date createdate, Date enddate) {
		this.logid = logid;
		this.createdate = createdate;
		this.enddate = enddate;
	}

	public TbLog(int logid, TbPath tbPath, TbStudent tbStudent,
			Date createdate, Date enddate, String state) {
		this.logid = logid;
		this.tbPath = tbPath;
		this.tbStudent = tbStudent;
		this.createdate = createdate;
		this.enddate = enddate;
		this.state = state;
	}

	@Id
	@Column(name = "logid", unique = true, nullable = false)
	@GeneratedValue(generator = "logtableGenerator")
	@GenericGenerator(name = "logtableGenerator", strategy = "increment")
	public int getLogid() {
		return this.logid;
	}

	public void setLogid(int logid) {
		this.logid = logid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "pathid")
	public TbPath getTbPath() {
		return this.tbPath;
	}

	public void setTbPath(TbPath tbPath) {
		this.tbPath = tbPath;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "studentid")
	public TbStudent getTbStudent() {
		return this.tbStudent;
	}

	public void setTbStudent(TbStudent tbStudent) {
		this.tbStudent = tbStudent;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "createdate", nullable = false, length = 19)
	public Date getCreatedate() {
		return this.createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "enddate", nullable = false, length = 19)
	public Date getEnddate() {
		return this.enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	@Column(name = "state", length = 20)
	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(name = "seatid", length = 20)
	public String getSeatid() {
		return seatid;
	}

	public void setSeatid(String seatid) {
		this.seatid = seatid;
	}

}