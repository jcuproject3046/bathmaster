package com.path.service.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.path.core.entity.TbPath;
import com.path.core.entity.TbStudent;
import com.path.repository.service.GenericRepository;

public interface StudentRepository extends GenericRepository<TbStudent, Long>{
	
	
	@Query("select u from TbStudent u where u.account = :account") 
	public List<TbStudent> findByAccount(@Param("account") String account);
	
	
	@Query("select u from TbStudent u where u.code = :code") 
	public List<TbStudent> findByCode(@Param("code") String code);
}
