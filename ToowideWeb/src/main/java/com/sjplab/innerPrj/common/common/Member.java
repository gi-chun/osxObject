package com.sjplab.innerPrj.common.common;

import java.io.Serializable;

public class Member implements Serializable {

	private String employee_num;
	private String member_name;
	private String email_addr;
	private String team_name;
	private String position;
	private String authority;
	
	public String getEmployee_num(){
		return employee_num;
	}
	
	public void setEmployee_num(String employee_num){
		this.employee_num = employee_num;
	}
	
	public String getMember_name(){
		return member_name;
	}
	
	public void setMember_name(String member_name){
		this.member_name = member_name;
	}
	
	public String getEmail_addr(){
		return email_addr;
	}
	
	public void setEmail_addr(String email_addr){
		this.email_addr = email_addr;
	}
	
	public String getTeam_name(){
		return team_name;
	}
	
	public void setTeam_name(String team_name){
		this.team_name = team_name;
	}
	
	public String getPosition(){
		return position;
	}
	
	public void setPosition(String position){
		this.position = position;
	}
	
	public String getAuthority(){
		return authority;
	}
	
	public void setAuthority(String authority){
		this.authority = authority;
	}
	
}
