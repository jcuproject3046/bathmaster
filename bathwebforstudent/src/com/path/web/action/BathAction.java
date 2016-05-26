package com.path.web.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.Action;
import com.path.core.entity.TbLog;
import com.path.core.entity.TbPath;
import com.path.core.entity.TbStudent;
import com.path.service.repository.LogRepository;
import com.path.service.repository.PathRepository;
import com.path.web.base.action.BaseAction;

@SuppressWarnings("all")
@Component("bathAction")
@Scope("prototype")
public class BathAction extends BaseAction{
	
	@Autowired
	private PathRepository pathRepository;
	
	private String seatid;
	
	@Autowired
	private LogRepository logRepository;
	
	private TbPath path;
	
	private long pathid;
	
	public String execute(){
		List<TbPath> list = pathRepository.findAll();
		System.out.println(list.size());
		
		path = this.pathRepository.findOne(pathid);
		
		return Action.INPUT;
	}
	
	public void reserved()throws Exception{
		
		List<String> pathList = new ArrayList<String>();	
		
		List<TbLog> paths = this.logRepository.findByPathid(pathid);
		if(paths!=null && paths.size()>0){
			for(TbLog log:paths){
				pathList.add(log.getSeatid());
			}
		}
		
		this.response.setCharacterEncoding("UTF-8");
		PrintWriter pw = this.response.getWriter();
		JSONArray json=JSONArray.fromObject(pathList);
		pw.write(json.toString());
		pw.flush();
		
	}
	
	public void submit()throws Exception{
		TbStudent temp = (TbStudent)this.sessionMap.get("SESSION_STUDENT");
		if(temp==null){
			this.sendDate("please Login First");
			return ;
			
		}
		
		TbPath path = pathRepository.findOne(pathid);
		if(!path.getSex().equals(temp.getSex())){
			this.sendDate("This bath is open to "+path.getSex()+" Student");
			return ;
		}
		
		List<TbLog> seats=  this.logRepository.findBySeatid(seatid);
		if(seats!=null && seats.size()>0){
			this.sendDate("This Seat has bean booked by Others");
			return ;
		}
		
		List<TbLog> logs = this.logRepository.findByStudentid(temp.getStudentid());
		if(logs!=null &&logs.size()>0){
			this.sendDate("Already Book Successful");
			return ;
		}
		
		TbLog log = new TbLog();
		log.setTbStudent(temp);
		log.setSeatid(seatid);
		log.setTbPath(path);
		log.setState("1");
		log.setCreatedate(new Date());
		this.logRepository.saveAndFlush(log);
		
		this.sendDate("Book Successful");
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

	public String getSeatid() {
		return seatid;
	}

	public void setSeatid(String seatid) {
		this.seatid = seatid;
	}

	public long getPathid() {
		return pathid;
	}

	public void setPathid(long pathid) {
		this.pathid = pathid;
	}

	public TbPath getPath() {
		return path;
	}

	public void setPath(TbPath path) {
		this.path = path;
	}

}
