package com.project.vo;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ProjectVO {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectVO.class);

	private Integer proId;
	private String proTitle;
	private String proBody;
	private Date proDate;
	
	public Integer getProId() {
		logger.info("getProId ȣ���");
		return proId;
	}
	public void setProId(Integer proId) {
		logger.info("setProId ȣ���");
		this.proId = proId;
	}
	public String getProTitle() {
		logger.info("getProTitle ȣ���");
		return proTitle;
	}
	public void setProTitle(String proTitle) {
		logger.info("setProTitle ȣ���");
		this.proTitle = proTitle;
	}
	public String getProBody() {
		logger.info("getProBody ȣ���");
		return proBody;
	}
	public void setProBody(String proBody) {
		logger.info("setProBody ȣ���");
		this.proBody = proBody;
	}
	public Date getProDate() {
		logger.info("getProDate ȣ���");
		return proDate;
	}
	public void setProDate(Date proDate) {
		logger.info("setProDate ȣ���");
		this.proDate = proDate;
	}
}
