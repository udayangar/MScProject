package com.loits.training.domain;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2019-03-09T10:35:51.682+0530")
@StaticMetamodel(Customer.class)
public class Customer_ {
	public static volatile SingularAttribute<Customer, Integer> id;
	public static volatile SingularAttribute<Customer, Date> createdDate;
	public static volatile SingularAttribute<Customer, String> email;
	public static volatile SingularAttribute<Customer, String> firstName;
	public static volatile SingularAttribute<Customer, Date> lastModifiedDate;
	public static volatile SingularAttribute<Customer, String> lastName;
	public static volatile SingularAttribute<Customer, String> nic;
	public static volatile SingularAttribute<Customer, String> notifyViaEmail;
	public static volatile SingularAttribute<Customer, String> notifyViaSms;
	public static volatile SingularAttribute<Customer, String> passport;
	public static volatile SingularAttribute<Customer, String> phone;
	public static volatile SingularAttribute<Customer, byte[]> profilePic;
	public static volatile SingularAttribute<Customer, String> status;
	public static volatile SingularAttribute<Customer, String> streamingPaymentAllowed;
	public static volatile SingularAttribute<Customer, Integer> userCredentialsId;
}
