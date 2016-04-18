package com.bilibili.DTO;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "presentation", catalog = "bilibili")
public class dataStructure {

	private String username;
	private String bankname;
	private String zip;
	private String recommendCode;
	private String time;
	private String status;
	private Integer requestId;
	private String requestBank;
	public dataStructure() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * @return the username
	 */
	@Column(name = "username", nullable = false, length = 20)
	public String getUsername() {
		return username;
	}
	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * @return the bankname
	 */
	@Column(name = "bankname", nullable = false, length = 20)
	public String getBankname() {
		return bankname;
	}
	/**
	 * @param bankname the bankname to set
	 */
	public void setBankname(String bankname) {
		this.bankname = bankname;
	}
	/**
	 * @return the zip
	 */
	@Column(name = "zip", nullable = false, length = 20)
	public String getZip() {
		return zip;
	}
	/**
	 * @param zip the zip to set
	 */
	public void setZip(String zip) {
		this.zip = zip;
	}
	/**
	 * @return the recommendCode
	 */
	@Column(name = "recommendCode", nullable = false, length = 20)
	public String getRecommendCode() {
		return recommendCode;
	}
	/**
	 * @param recommendCode the recommendCode to set
	 */
	public void setRecommendCode(String recommendCode) {
		this.recommendCode = recommendCode;
	}
	/**
	 * @return the time
	 */
	@Column(name = "time", nullable = false, length = 20)
	public String getTime() {
		return time;
	}
	/**
	 * @param time the time to set
	 */
	public void setTime(String time) {
		this.time = time;
	}
	/**
	 * @return the status
	 */
	@Column(name = "status", nullable = false, length = 20)
	public String getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * @return the requestId
	 */
	@Id
	@GeneratedValue
	@Column(name = "requestID", unique = true, nullable = false)
	public Integer getRequestId() {
		return requestId;
	}
	/**
	 * @param requestId the requestId to set
	 */
	public void setRequestId(Integer requestId) {
		this.requestId = requestId;
	}
	/**
	 * @return the requestBank
	 */
	@Column(name = "requestBank", nullable = false, length = 20)
	public String getRequestBank() {
		return requestBank;
	}
	/**
	 * @param requestBank the requestBank to set
	 */
	public void setRequestBank(String requestBank) {
		this.requestBank = requestBank;
	}
	

}
