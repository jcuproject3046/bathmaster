package com.path.util;

import java.util.List;

import com.path.core.entity.TbPath;
import com.path.service.repository.PathRepository;
import com.path.spring.ContextHolder;

public class BathUtil {

	public List<TbPath> qry(){
		PathRepository pathRepository=(PathRepository)ContextHolder.getApplicationContext().getBean("pathRepository");
		List<TbPath> list = pathRepository.findAll();
		System.out.println(list.size());
		return list;
	}
}
