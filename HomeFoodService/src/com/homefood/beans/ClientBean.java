package com.homefood.beans;

import java.util.ArrayList;

import org.json.JSONArray;

public class ClientBean
{
	private String id;
    private byte[] password;      
    private byte[] salt;    	
    private String firstName;  
    private String lastName;    
    private String email;       
    private String phone;    	
    private String subscribed;
    private ArrayList<AddressBean> addresses;
    
    private JSONArray addressesJSON; 

	public ClientBean(){
    }
    
	public ClientBean(byte[] password, byte[] salt, String firstName, String lastName, String email,
			String phone,String subscribed) {
		this.password = password;
		this.setSalt(salt);
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phone = phone;
		this.subscribed = subscribed;
	}
	
    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public byte[] getPassword() {
		return password;
	}

	public void setPassword(byte[] password) {
		this.password = password;
	}

	public byte[] getSalt() {
		return salt;
	}

	public void setSalt(byte[] salt) {
		this.salt = salt;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getSubscribed() {
		return subscribed;
	}

	public void setSubscribed(String subscribed) {
		this.subscribed = subscribed;
	}
	public String getAddressesJSON(String id){
		addressesJSON = new JSONArray(addresses);
		return addressesJSON.toString();
	}

	public ArrayList<AddressBean> getAddresses() {
		return addresses;
	}

	public void setAddresses(ArrayList<AddressBean> addresses) {
		this.addresses = addresses;
	}
	
	
}