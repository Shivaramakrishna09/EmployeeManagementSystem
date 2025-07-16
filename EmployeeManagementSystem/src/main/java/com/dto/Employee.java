package com.dto;

public class Employee {

	private int id;
	private String name;
	private String email;
	private int experience;
	private String salary;

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public int getExperience() {
		return experience;
	}

	public String getSalary() {
		return salary;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setExperience(int experience) {
		this.experience = experience;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

}
