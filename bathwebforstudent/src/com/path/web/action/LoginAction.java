package com.path.web.action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.Action;
import com.path.core.entity.TbLog;
import com.path.core.entity.TbStudent;
import com.path.service.repository.LogRepository;
import com.path.service.repository.StudentRepository;
import com.path.web.base.action.BaseAction;

@SuppressWarnings("all")
@Component("loginAction")
@Scope("prototype")
public class LoginAction extends BaseAction{
	
	@Autowired
	private StudentRepository studentRepository;
	
	private TbStudent student;
	
	@Autowired
	private LogRepository logRepository;
	
	public String execute(){
		
		return Action.INPUT;
	}
	
	public String submit(){
		if(student==null){
			return Action.INPUT;
		}
		
		List<TbStudent> accounts = this.studentRepository.findByAccount(student.getAccount());
		if(accounts==null || accounts.size()==0){
			this.addFieldError("account", "Field 'Account' does not  exist");
			return Action.INPUT;
		}
		
		TbStudent temp = accounts.get(0);
		
		if(!temp.getPassword().equals(student.getPassword())){
			this.addFieldError("account", "Field 'Password' is error");
			return Action.INPUT;
		}
		this.sessionMap.put("SESSION_STUDENT", temp);
		return Action.SUCCESS;
	}

	public void bath() throws Exception{
		TbStudent temp = (TbStudent)this.sessionMap.get("SESSION_STUDENT");
		List<TbLog> logs= this.logRepository.findByStudentid(temp.getStudentid());
		if(logs!=null &&logs.size()>0){
			TbLog log = logs.get(0);
			if("1".equals(log.getState())){
				log.setState("2");
				this.logRepository.saveAndFlush(log);
			}
			sendDate("Come to the Publicbathroom within 10 minutes please");
		}else{
			sendDate("Please Reserve first");
		}
	}
	
	public void sendDate(String data)throws Exception{

		response.setContentType("application/json");
		this.response.setCharacterEncoding("UTF-8");
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("result", data);
		PrintWriter pw = this.response.getWriter();
		JSONArray json=JSONArray.fromObject(map);
		pw.write(json.toString());
		pw.flush();
	}
	
	public TbStudent getStudent() {
		return student;
	}

	public void setStudent(TbStudent student) {
		this.student = student;
	}
}
