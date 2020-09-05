package com.loits.training.domain;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the customer database table.
 * 
 */
@Entity
@NamedQuery(name="Customer.findAll", query="SELECT c FROM Customer c")
public class Customer implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

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

	private String nic;

	@Column(name="notify_via_email")
	private String notifyViaEmail;

	@Column(name="notify_via_sms")
	private String notifyViaSms;

	private String passport;

	private String phone;

	@Lob
	@Column(name="profile_pic")
	private byte[] profilePic;

	private String status;

	@Column(name="streaming_payment_allowed")
	private String streamingPaymentAllowed;

	@Column(name="user_credentials_id")
	private int userCredentialsId;

	public Customer() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
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

	public int getUserCredentialsId() {
		return this.userCredentialsId;
	}

	public void setUserCredentialsId(int userCredentialsId) {
		this.userCredentialsId = userCredentialsId;
	}

}