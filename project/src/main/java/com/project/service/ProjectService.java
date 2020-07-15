package com.project.service;

// com.project.service/ProjectService.java

import java.util.List;

import com.project.vo.ProjectVO;

public interface ProjectService {
	
	List<ProjectVO> selectProjectList() throws Exception;
	
	void insertProject(ProjectVO projectVO);
	
	void updateProject(ProjectVO projectVO);
	
	void deleteProject(int proId);

}
