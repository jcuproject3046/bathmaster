package com.path.repository.factory;

import java.io.Serializable;

import javax.persistence.EntityManager;

import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.data.jpa.repository.support.JpaRepositoryFactory;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.data.repository.core.RepositoryMetadata;

import com.path.repository.service.GenericRepositoryImpl;

public class DefaultRepositoryFactory extends JpaRepositoryFactory {

	private final EntityManager entityManager;
    
	public DefaultRepositoryFactory(EntityManager entityManager) {
		super(entityManager);
		this.entityManager = entityManager;	
	}
	
	
    @Override  
    @SuppressWarnings("unchecked") 
	protected  <T, ID extends Serializable> SimpleJpaRepository<?, ?> getTargetRepository(RepositoryMetadata metadata, EntityManager entityManager) {

		JpaEntityInformation<?, Serializable> entityInformation = getEntityInformation(metadata.getDomainType());
		return new GenericRepositoryImpl(entityInformation, entityManager); // custom implementation
	}
  
    @Override
    protected Class<?> getRepositoryBaseClass(RepositoryMetadata metadata) {
 
    	return GenericRepositoryImpl.class;
    }
}
