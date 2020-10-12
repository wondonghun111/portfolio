package com.samsung.sn.dto.member;

import org.springframework.stereotype.Component;

@Component
public class MemberDTO {
	
	private String user_id;
	private String user_pw;
	private String user_name;
	private int yy;
	private int mm;
	private int dd;
	private String user_gender;
	private String user_email;
	private String user_phone;
	private int postcode; 
	private String roadAddress;
	private String detailAddress;
	private int create_date;

	
	

	public int getPostcode() {
		return postcode;
	}
	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getYy() {
		return yy;
	}
	public void setYy(int yy) {
		this.yy = yy;
	}
	public int getMm() {
		return mm;
	}
	public void setMm(int mm) {
		this.mm = mm;
	}
	public int getDd() {
		return dd;
	}
	public void setDd(int dd) {
		this.dd = dd;
	}	
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public int getCreate_date() {
		return create_date;
	}
	public void setCreate_date(int create_date) {
		this.create_date = create_date;
	}
	@Override
	public String toString() {
		return "MemberDTO [user_id = " + user_id + " user_pw = " + user_pw + " name = " + user_name
				+ " yy = " + yy + " mm = "+ mm + " dd = "+ dd 
				+ " gender = " + user_gender + " email = " + user_email + " phoneNo = " + user_phone 
				+" postcode : "+ postcode + " roadAddress : "+ roadAddress 
				+  " detailAddress : " + detailAddress + "]";
	}
}
