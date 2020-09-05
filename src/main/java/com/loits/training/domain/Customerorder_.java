package com.loits.training.domain;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2019-03-20T06:19:40.193+0530")
@StaticMetamodel(Customerorder.class)
public class Customerorder_ {
	public static volatile SingularAttribute<Customerorder, Integer> id;
	public static volatile SingularAttribute<Customerorder, Integer> buyMerchantId;
	public static volatile SingularAttribute<Customerorder, Integer> customerRejMerchant;
	public static volatile SingularAttribute<Customerorder, Date> createdDate;
	public static volatile SingularAttribute<Customerorder, String> email;
	public static volatile SingularAttribute<Customerorder, String> firstName;
	public static volatile SingularAttribute<Customerorder, Date> lastModifiedDate;
	public static volatile SingularAttribute<Customerorder, String> lastName;
	public static volatile SingularAttribute<Customerorder, Double> merchantOfferprice;
	public static volatile SingularAttribute<Customerorder, Double> customerOfferprice;
	public static volatile SingularAttribute<Customerorder, String> orderAcceptStatus;
	public static volatile SingularAttribute<Customerorder, Double> latitude;
	public static volatile SingularAttribute<Customerorder, Double> longitude;
	public static volatile SingularAttribute<Customerorder, String> nic;
	public static volatile SingularAttribute<Customerorder, String> notifyViaEmail;
	public static volatile SingularAttribute<Customerorder, String> notifyViaSms;
	public static volatile SingularAttribute<Customerorder, String> ordrProduct;
	public static volatile SingularAttribute<Customerorder, Integer> ordrProductType;
	public static volatile SingularAttribute<Customerorder, String> ordrStatus;
	public static volatile SingularAttribute<Customerorder, String> passport;
	public static volatile SingularAttribute<Customerorder, String> phone;
	public static volatile SingularAttribute<Customerorder, byte[]> profilePic;
	public static volatile SingularAttribute<Customerorder, Long> quantity;
	public static volatile SingularAttribute<Customerorder, String> status;
	public static volatile SingularAttribute<Customerorder, String> streamingPaymentAllowed;
	public static volatile SingularAttribute<Customerorder, Long> userCredentialsId;
}
