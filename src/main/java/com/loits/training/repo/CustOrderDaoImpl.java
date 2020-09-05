package com.loits.training.repo;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;


import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.loits.training.domain.Customer;
import com.loits.training.domain.Customerorder;

@Repository
@Transactional
public class CustOrderDaoImpl implements CustOrderDao {
	
	@Autowired
	EntityManager em;
	String status;
	
	public Customerorder insertRec(Customerorder customerorder){
		Customerorder custome = new Customerorder();
		
		 try {

			 customerorder.setCreatedDate(new Date());
			 customerorder.setNotifyViaEmail("Y");
			 customerorder.setNotifyViaSms("Y");
			 customerorder.setStatus("A");
			 customerorder.setOrdrStatus("A");
			 customerorder.setOrderAcceptStatus("I");
             em.persist(customerorder);
             return  customerorder;


} catch (Exception e) {

             e.printStackTrace();
             return custome;
}



}
	
	public Customerorder getRec(long orderId){
try {
		
			
			CriteriaBuilder cb = em.getCriteriaBuilder();
			CriteriaQuery<Customerorder> criteria = cb.createQuery(Customerorder.class);

			Root root = criteria.from(Customerorder.class);
			criteria.select(root).where(cb.equal(root.get("id"),orderId) );
			return em.createQuery(criteria).getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> getCustomerDetails(long userId) {

		Query q = em.createNativeQuery("select first_name,last_name,email,phone from ipaydb.customer where user_credentials_id = "+userId);
		return q.getResultList();
	}
	
	public Customer getCustomer(long userId){
		try {
		
			
			CriteriaBuilder cb = em.getCriteriaBuilder();
			CriteriaQuery<Customer> criteria = cb.createQuery(Customer.class);

			Root root = criteria.from(Customer.class);
			
			criteria.select(root).where(cb.equal(root.get("userCredentialsId"),userId) );
			
			return em.createQuery(criteria).getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

public String acceptOrder(long id, String status){
	
	String result = "";
	Customerorder cutOrd = em.find(Customerorder.class, (int) id);

	cutOrd.setOrderAcceptStatus(status);

    try {

                    em.merge(cutOrd);
                    result = "success";

    } catch (Exception e) {

                    e.printStackTrace();
                    result = "Error occured while updating the record";
    }
    
    return result;
}

public String newOffer(long id, double offerPrice){
	
	String result = "";
	Customerorder cutOrd = em.find(Customerorder.class, (int) id);

	cutOrd.setCustomerOfferprice(offerPrice);
	cutOrd.setOrderAcceptStatus("M");

    try {
    	           em.merge(cutOrd);
    	           result = "success";

    } catch (Exception e) {

                   e.printStackTrace();
                   result = "Error occured while updating the record";
    }
    
    return result;
}
	
public List<Customerorder> getCustomerOrder(long merchnatId){
	try {
	
		
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Customerorder> criteria = cb.createQuery(Customerorder.class);

		Root root = criteria.from(Customerorder.class);
		
		criteria.select(root).where(cb.equal(root.get("buyMerchantId"),merchnatId),cb.and(cb.equal(root.get("orderAcceptStatus"),"M")) );
		
		return em.createQuery(criteria).getResultList();
	} catch (Exception e) {
		e.printStackTrace();
		return null;
	}
}

public String apprReject(long id, String status){
	
	String result = "";
	Customerorder cutOrd = em.find(Customerorder.class, (int) id);

	
	cutOrd.setOrderAcceptStatus(status);

    try {
    	           em.merge(cutOrd);
    	           result = "success";

    } catch (Exception e) {

                   e.printStackTrace();
                   result = "Error occured while updating the record";
    }
    
    return result;
}

		
	}


