package com.path.quartz;

import java.util.Date;
import java.util.List;

import com.path.core.entity.TbLog;
import com.path.service.base.BaseServiceImpl;
import com.path.service.repository.LogRepository;
import com.path.spring.ContextHolder;


@SuppressWarnings("all")
public class Job {
	
	public void execute(){
		LogRepository logRepository=(LogRepository)ContextHolder.getApplicationContext().getBean("logRepository");
		
		List<TbLog> logs = logRepository.findByState();
		
		if(logs!=null && logs.size()>0){
			for(TbLog log:logs){
				if("1".equals(log.getState())){//Reserved
					Date currentDate = new Date();
					long end= currentDate.getTime();
					long start = log.getCreatedate().getTime();
					if((end-start)>10*1000*60){//十分内没到达澡堂（no arrived within 10 minutes）
						BaseServiceImpl baseService=(BaseServiceImpl)ContextHolder.getApplicationContext().getBean("baseService");
						baseService.update("update TbLog set state='0',enddate=? where logid=? ", new Object[]{new Date(),log.getLogid()});
					}
					
				}else if("2".equals(log.getState())){//bath  
					Date currentDate = new Date();
					long end= currentDate.getTime();
					long start = log.getCreatedate().getTime();
					if((end-start)>30*1000*60){//30分钟内结束 (cancle the booking after 30 minutes)
						BaseServiceImpl baseService=(BaseServiceImpl)ContextHolder.getApplicationContext().getBean("baseService");
						baseService.update("update TbLog set state='0',enddate=? where logid=? ", new Object[]{new Date(),log.getLogid()});
					}
				}
			}
		}
	}
	
	
	
}
