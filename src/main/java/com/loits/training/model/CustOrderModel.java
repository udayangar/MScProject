package com.loits.training.model;

public class CustOrderModel {
	
long userCredentialsId;
double latitude;
double longitude;
long quantity;
String orderProdut;
long prodCat;
long id;

public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public long getUserCredentialsId() {
	return userCredentialsId;
}
public void setUserCredentialsId(long userCredentialsId) {
	this.userCredentialsId = userCredentialsId;
}
public double getLatitude() {
	return latitude;
}
public void setLatitude(double latitude) {
	this.latitude = latitude;
}
public double getLongitude() {
	return longitude;
}
public void setLongitude(double longitude) {
	this.longitude = longitude;
}
public long getQuantity() {
	return quantity;
}
public void setQuantity(long quantity) {
	this.quantity = quantity;
}
public String getOrderProdut() {
	return orderProdut;
}
public void setOrderProdut(String orderProdut) {
	this.orderProdut = orderProdut;
}
public long getProdCat() {
	return prodCat;
}
public void setProdCat(long prodCat) {
	this.prodCat = prodCat;
}



}
