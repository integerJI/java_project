package com.project.service.impl;

import java.util.HashMap;

// comproject.service.impl/ProjectServiceImpl.java

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.service.ProjectService;
import com.project.service.dao.ProjectDAO;
import com.project.vo.ProjectVO;

@Service("projectService")
public class ProjectServiceImpl implements ProjectService {

	private static final Logger logger = LoggerFactory.getLogger(ProjectServiceImpl.class);
	
	@Autowired
	private ProjectDAO projectMapper;

	
	public List<ProjectVO> selectProjectList() {
		return projectMapper.selectProjectList();
	}
	
//	@Override
//	@Transactional
//	public List<ProjectVO> selectProjectList() throws Exception {
//		return projectMapper.selectProjectList();
//	}	

	@Override
	public void insertProject(ProjectVO projectVO) {
		projectMapper.insertProject(projectVO);
	}
	
	@Override
	public void updateProject(ProjectVO projectVO) {
		projectMapper.updateProject(projectVO);
	}
	
	@Override
	public void deleteProject(int proId) {
		projectMapper.deleteProject(proId);
	}
	
}
