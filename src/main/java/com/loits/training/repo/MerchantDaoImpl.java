package com.loits.training.repo;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class MerchantDaoImpl implements MerchantDao{
	@Autowired
	EntityManager em;
	public String getMerchantName(long merId){
		Query q = em.createNativeQuery("select name from ipaydb.merchant where id = "+merId);
		return q.getSingleResult().toString();
	
	}

}
