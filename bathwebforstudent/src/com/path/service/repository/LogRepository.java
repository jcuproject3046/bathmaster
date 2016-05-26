package com.path.service.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.path.core.entity.TbLog;
import com.path.repository.service.GenericRepository;

public interface LogRepository extends GenericRepository<TbLog, Long>{
	
	@Query("select u from TbLog u where u.tbStudent.studentid = :studentid and u.state in ('1','2')") 
	public List<TbLog> findByStudentid(@Param("studentid") long studentid);
	
	
	@Query("select u from TbLog u where u.tbPath.pathid = :pathid and u.state in ('1','2')") 
	public List<TbLog> findByPathid(@Param("pathid") long pathid);
	
	@Query("select u from TbLog u where  u.state in ('1','2')") 
	public List<TbLog> findByState();
	
	
	@Query("select u from TbLog u where  u.state in ('1','2') and seatid=:seatid") 
	public List<TbLog> findBySeatid(@Param("seatid") String seatid);
}
