package com.loits.training.domain;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the customerorder database table.
 * 
 */
@Entity
@NamedQuery(name="Customerorder.findAll", query="SELECT c FROM Customerorder c")
public class Customerorder implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private Integer buyMerchantId;
	
	@Column(name="customer_rejMerchant")
	private Integer customerRejMerchant;


	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="created_date")
	private Date createdDate;

	private String email;

	@Column(name="first_name")
	private String firstName;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="last_modified_date")
	private Date lastModifiedDate;

	@Column(name="last_name")
	private String lastName;
	
	@Column(name="merchant_offerprice")
	private double merchantOfferprice;
	
	@Column(name="customer_offerprice")
	private double customerOfferprice;
	
	public Integer getCustomerRejMerchant() {
		return customerRejMerchant;
	}

	public void setCustomerRejMerchant(Integer customerRejMerchant) {
		this.customerRejMerchant = customerRejMerchant;
	}

	public double getCustomerOfferprice() {
		return customerOfferprice;
	}

	public void setCustomerOfferprice(double customerOfferprice) {
		this.customerOfferprice = customerOfferprice;
	}

	public double getMerchantOfferprice() {
		return merchantOfferprice;
	}

	public void setMerchantOfferprice(double merchantOfferprice) {
		this.merchantOfferprice = merchantOfferprice;
	}

	public String getOrderAcceptStatus() {
		return orderAcceptStatus;
	}

	public void setOrderAcceptStatus(String orderAcceptStatus) {
		this.orderAcceptStatus = orderAcceptStatus;
	}

	@Column(name="order_accept_status")
	private String orderAcceptStatus;

	private double latitude;

	private double longitude;

	private String nic;

	@Column(name="notify_via_email")
	private String notifyViaEmail;

	@Column(name="notify_via_sms")
	private String notifyViaSms;

	private String ordrProduct;

	private int ordrProductType;

	private String ordrStatus;

	private String passport;

	private String phone;

	@Lob
	@Column(name="profile_pic")
	private byte[] profilePic;

	private long quantity;

	private String status;

	@Column(name="streaming_payment_allowed")
	private String streamingPaymentAllowed;

	@Column(name="user_credentials_id")
	private long userCredentialsId;

	public Customerorder() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getBuyMerchantId() {
		return this.buyMerchantId;
	}

	public void setBuyMerchantId(Integer buyMerchantId) {
		this.buyMerchantId = buyMerchantId;
	}

	public Date getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public Date getLastModifiedDate() {
		return this.lastModifiedDate;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public double getLatitude() {
		return this.latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return this.longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public String getNic() {
		return this.nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}

	public String getNotifyViaEmail() {
		return this.notifyViaEmail;
	}

	public void setNotifyViaEmail(String notifyViaEmail) {
		this.notifyViaEmail = notifyViaEmail;
	}

	public String getNotifyViaSms() {
		return this.notifyViaSms;
	}

	public void setNotifyViaSms(String notifyViaSms) {
		this.notifyViaSms = notifyViaSms;
	}

	public String getOrdrProduct() {
		return this.ordrProduct;
	}

	public void setOrdrProduct(String ordrProduct) {
		this.ordrProduct = ordrProduct;
	}

	public int getOrdrProductType() {
		return this.ordrProductType;
	}

	public void setOrdrProductType(int ordrProductType) {
		this.ordrProductType = ordrProductType;
	}

	public String getOrdrStatus() {
		return this.ordrStatus;
	}

	public void setOrdrStatus(String ordrStatus) {
		this.ordrStatus = ordrStatus;
	}

	public String getPassport() {
		return this.passport;
	}

	public void setPassport(String passport) {
		this.passport = passport;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public byte[] getProfilePic() {
		return this.profilePic;
	}

	public void setProfilePic(byte[] profilePic) {
		this.profilePic = profilePic;
	}

	public long getQuantity() {
		return this.quantity;
	}

	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStreamingPaymentAllowed() {
		return this.streamingPaymentAllowed;
	}

	public void setStreamingPaymentAllowed(String streamingPaymentAllowed) {
		this.streamingPaymentAllowed = streamingPaymentAllowed;
	}

	public long getUserCredentialsId() {
		return this.userCredentialsId;
	}

	public void setUserCredentialsId(long userCredentialsId) {
		this.userCredentialsId = userCredentialsId;
	}

}