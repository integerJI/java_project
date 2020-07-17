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
		logger.info("getProId »£√‚µ ");
		return proId;
	}
	public void setProId(Integer proId) {
		logger.info("setProId »£√‚µ ");
		this.proId = proId;
	}
	public String getProTitle() {
		logger.info("getProTitle »£√‚µ ");
		return proTitle;
	}
	public void setProTitle(String proTitle) {
		logger.info("setProTitle »£√‚µ ");
		this.proTitle = proTitle;
	}
	public String getProBody() {
		logger.info("getProBody »£√‚µ ");
		return proBody;
	}
	public void setProBody(String proBody) {
		logger.info("setProBody »£√‚µ ");
		this.proBody = proBody;
	}
	public Date getProDate() {
		logger.info("getProDate »£√‚µ ");
		return proDate;
	}
	public void setProDate(Date proDate) {
		logger.info("setProDate »£√‚µ ");
		this.proDate = proDate;
	}
}
