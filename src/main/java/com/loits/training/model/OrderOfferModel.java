package com.loits.training.model;

public class OrderOfferModel {
	
	long orderId;
	long merchantId;
	double offerPrice;
	double newOfferPrice;
	public long getOrderId() {
		return orderId;
	} 
	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}
	public long getMerchantId() {
		return merchantId;
	}
	public void setMerchantId(long merchantId) {
		this.merchantId = merchantId;
	}
	public double getOfferPrice() {
		return offerPrice;
	}
	public void setOfferPrice(double offerPrice) {
		this.offerPrice = offerPrice;
	}
	public double getNewOfferPrice() {
		return newOfferPrice;
	}
	public void setNewOfferPrice(double newOfferPrice) {
		this.newOfferPrice = newOfferPrice;
	}


}
