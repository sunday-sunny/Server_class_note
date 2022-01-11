package com.test.mvc;


// DTO, Data Transfer Object
// - 데이터 전송 객체
// - 택배 상자

// VO, Value Object 


// - 레코드 1줄을 담는 상자 역할
public class AddressDTO {
	
	private String seq;
	private String name;
	private int age;
	private String tel;
	private String address;
	
	/* Getter, Setter */
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
