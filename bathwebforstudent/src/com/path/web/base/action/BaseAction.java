package com.path.web.base.action;

import java.io.Serializable;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.path.service.base.BaseServiceImpl;
import com.path.util.Pager;

public class BaseAction<T,id extends Serializable> extends ActionSupport implements SessionAware,
		ServletRequestAware, ServletResponseAware {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private BaseServiceImpl<T,id> baseService;	
	
	
	protected HttpServletResponse response;
	
	protected HttpServletRequest request;
	
	protected Map<String, Object> sessionMap;
	
	protected String op;
	
	protected String msg;
	
	protected Pager pager = new Pager();
	

	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response = response;
	}

	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}

	public void setSession(Map<String, Object> sessionMap) {
		// TODO Auto-generated method stub
		this.sessionMap = sessionMap;
	}	

	public BaseServiceImpl<T, id> getBaseService() {
		return baseService;
	}

	public void setBaseService(BaseServiceImpl<T, id> baseService) {
		this.baseService = baseService;
	}

	@Override
	public void addActionError(String anErrorMessage) {
		// TODO Auto-generated method stub
		System.out.println(anErrorMessage);
		super.addActionError(anErrorMessage);
	}

	@Override
	public void addActionMessage(String aMessage) {
		System.out.println(aMessage);
		// TODO Auto-generated method stub
		super.addActionMessage(aMessage);
	}

	@Override
	public void addFieldError(String fieldName, String errorMessage) {
		System.out.println(errorMessage);
		// TODO Auto-generated method stub
		super.addFieldError(fieldName, errorMessage);
	}

	public String getOp() {
		return op;
	}

	public void setOp(String op) {
		this.op = op;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}
	
}
