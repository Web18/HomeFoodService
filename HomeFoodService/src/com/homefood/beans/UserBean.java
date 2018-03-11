package com.homefood.beans;

public class UserBean {
	private String userId;
	private String password;
	private String firstName;
	private String lastName;
	private String address1;
	private String address2;
	private String city;
	private String postCode;
	private String email;
	private int phone;
	private String userGroup;

	// Default Constructor
	public UserBean() {

	}

	public void setUserId(String id) {
		userId = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setPassword(String pass) {
		password = pass;
	}

	public String getPassword() {
		return password;
	}

	public void setFirstName(String fName) {
		firstName = fName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setLastName(String lName) {
		lastName = lName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setAddress1(String address) {
		address1 = address;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress2(String Address2) {
		address2 = Address2;
	}

	public String getAddress2() {
		return address2;
	}

	public void setCity(String str) {
		city = str;
	}

	public String getCity() {
		return city;
	}

	public void setPostCode(String pCode) {
		postCode = pCode;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setEmail(String userEmail) {
		email = userEmail;
	}

	public String getEmail() {
		return email;
	}

	public void setPhone(int num) {
		phone = num;
	}

	public int getPhone() {
		return phone;
	}

	public void setUserGroup(String str) {
		userGroup = str;
	}

	public String getUserGroup() {
		return userGroup;
	}
}