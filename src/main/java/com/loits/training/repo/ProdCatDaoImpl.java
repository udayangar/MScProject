package com.loits.training.repo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.loits.training.model.ProdCat;

@Repository
@Transactional
public class ProdCatDaoImpl implements ProdCatDao {
	
	public List<ProdCat> getSelectCat( ) {
		
		/*
		 * need to get from db
		List<RcTransactionType> transactionList = trtypeDao
				.getTranactionTypeList(); */
		System.out.println("++++++++++++++++++started +++++++++++++++++");
		//Object[] selectopt = new Object[transactionList.size()];
		List<ProdCat> prodCat = new ArrayList<ProdCat>();
		int i = 0;
		/*for (RcTransactionType ttype : transactionList) {

			selectopt[i] = ttype.getTranTypName();
			i++;
		}*/
		ProdCat p1 = new ProdCat();
		p1.setProdCatId(1);
		p1.setProductName("Cafeterias");
		prodCat.add(p1);
		//Collections.addAll(prodCat, p1);
		
		ProdCat p2 = new ProdCat();
		p2.setProdCatId(3);
		p2.setProductName("Super Markets");
		prodCat.add(p2);
		//Collections.addAll(prodCat, p2);
		
		ProdCat p3 = new ProdCat();
		p3.setProdCatId(4);
		p3.setProductName("Fashion & Clothing");
		prodCat.add(p3);
		//Collections.addAll(prodCat, p3);
		
		ProdCat p4 = new ProdCat();
		p4.setProdCatId(11);
		p4.setProductName("E-Commerce Business");
		prodCat.add(p4);
		//Collections.addAll(prodCat, p4);
		
		/*selectopt[0] = "Cafeterias";
		selectopt[1] = "Super Markets";
		selectopt[2] = "Fashion & Clothing";
		selectopt[3] ="E-Commerce Business";*/
		System.out.println("++++++++++++++++++end +++++++++++++++++");
		return prodCat;

  }
}
