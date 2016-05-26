package com.path.service.base;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.path.dao.BaseDAOImpl;
import com.path.util.Data;
import com.path.util.Pager;


@Transactional
@Component("baseService")
public class BaseServiceImpl<T,id extends Serializable> {

	//protected Log log = LogFactory.getLog(this.getClass());

	@Autowired
	private BaseDAOImpl<T> baseDAO;
	
	public List<Data> stat(String jpql){
		return this.baseDAO.stat(jpql);
	}
	
	public T create(T t) throws Exception {
		 baseDAO.persist(t);
		 return t;
	}

	public void delete(T t) throws Exception {
		baseDAO.save(t);
	}

	public void save(T t) throws Exception {
		 baseDAO.save(t);
	}

	public T find(Class<T> clazz, Serializable id) {
		T t = baseDAO.find(clazz, id);
		return t;
	}
	
	public void detach(Object entity){
		this.baseDAO.detach(entity);
	}

	public List<T> find(String jpql, Object param) {
		return baseDAO.find(jpql, param);
	}

	public List<T> find(String jpql, Object... param) {
		return baseDAO.find(jpql, param);
	}

	public List<T> find(String jpql) {
		return baseDAO.find(jpql);
	}
	
	public List<T> qryPager(String hql,Pager pager){
		return this.getBaseDAO().qryPager(hql, pager);
	}
	
	public void batchInsert(List<T> list){
		this.getBaseDAO().batchInsert(list);
	}

	public int getTotalCount(String jpql) {
		return (Integer) baseDAO.createQuery(jpql).getSingleResult();
	}

	
	 public int update(String jpql, Object[] params){
		 return this.baseDAO.update(jpql, params);
	 }

	public BaseDAOImpl<T> getBaseDAO() {
		return baseDAO;
	}

	public void setBaseDAO(BaseDAOImpl<T> baseDAO) {
		this.baseDAO = baseDAO;
	}
}