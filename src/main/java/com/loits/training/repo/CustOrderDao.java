package com.loits.training.repo;

import java.util.List;

import com.loits.training.domain.Customer;
import com.loits.training.domain.Customerorder;

public interface CustOrderDao {
	public Customerorder insertRec(Customerorder customerorder);
	public Customerorder getRec(long orderId);
	public List<Object[]> getCustomerDetails(long userId);
	public Customer getCustomer(long userId);
	public String acceptOrder(long id, String status);
	public String newOffer(long id, double offerPrice);
	public List<Customerorder> getCustomerOrder(long merchnatId);
	public String apprReject(long id, String status);

}
