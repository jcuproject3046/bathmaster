package com.path.web.action;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.Action;
import com.path.core.entity.TbStudent;
import com.path.service.repository.StudentRepository;
import com.path.web.base.action.BaseAction;

@SuppressWarnings("all")
@Component("regAction")
@Scope("prototype")
public class RegAction extends BaseAction {
	
	@Autowired
	private StudentRepository studentRepository;

	private TbStudent student;

	public String execute() {

		return Action.INPUT;
	}

	public String submit() {
		if(student==null){
			return Action.INPUT;
		}
		
		List<TbStudent> accounts = this.studentRepository.findByAccount(student.getAccount());
		if(accounts!=null &&accounts.size()>0){
			this.addFieldError("account", "Field 'Account' already exists");
			return Action.INPUT;
		}

		
		List<TbStudent> codes = this.studentRepository.findByAccount(student.getCode());
		
		if(codes!=null &&codes.size()>0){
			this.addFieldError("code", "Field 'Student ID' already exists");
			return Action.INPUT;
		}
		
		student.setCreatedate(new Date());
		
		this.studentRepository.saveAndFlush(student);
		
		return Action.SUCCESS;

	}

	public TbStudent getStudent() {
		return student;
	}

	public void setStudent(TbStudent student) {
		this.student = student;
	}

}
