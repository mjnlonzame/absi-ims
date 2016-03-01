package com.absi.ims.domain;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonView;

public class IMSResponse {
	private String message;
	private String status;
	private Object payload;
	
	public IMSResponse(){}
	
	public IMSResponse(String message, String status, Object payload){
		this.message = message;
		this.status = status;
		this.payload = payload;
	}
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Object getPayload() {
		return payload;
	}
	public void setPayload(Object payload) {
		this.payload = payload;
	}
	
	public void failed(String err){
		this.payload = err;
		this.message = "failed";
		this.status = "1";
	}
	
	public void failed(){
		this.payload = null;
		this.message = "failed";
		this.status = "1";
	}
	
	public void success(Object o){
		this.payload = o;
		this.message = "success";
		this.status = "0";
	}
	
	public void success(List<Object> o){
		this.payload = o;
		this.message = "success";
		this.status = "0";
	}
	
	
}
