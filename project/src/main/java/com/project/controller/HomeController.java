package com.project.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.project.service.ProjectService;
import com.project.vo.ProjectVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Resource(name = "projectService")
	private ProjectService projectService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/dev.do", method = RequestMethod.GET)
	public String dev(Model model) {
				
		return "dev";
	}

	@RequestMapping(value = "/getProjectList.do", method = RequestMethod.GET)
	public String getProjectList(Locale locale, Model model) throws Exception{

		logger.info("getProjectList");
	
		List<ProjectVO> userList = projectService.selectProjectList();
		model.addAttribute("userList", userList);
	
		return model;
    }
	
//	public List<ProjectVO> getProjectList() throws Throwable{
//        System.out.println(projectService.selectProjectList());
//        return projectService.selectProjectList();
//    }
//	@RequestMapping(value = "/getProjectList.do")
//	public List<ProjectVO> getProjectList(ProjectVO projectVO) {
//		
//		 List<ProjectVO> List = projectService.selectProjectList(projectVO);
//		 
//		 System.out.println(projectVO+"aaaaaaaaaaaaaaaaaaaa");
//		 return List;
//	}

//    @ResponseBody // ajax를 불르기 위한 어노테이션
//    @RequestMapping(value="/getProjectList.do")
//        public List<ProjectVO> selectProjectList(ProjectVO projectVO) throws Throwable{
//    	
//    	
//    	System.out.println(projectVO.getProId()
//    	);
//    	
//    	
//		return projectService.selectProjectList(projectVO);
//    }

	
//	@RequestMapping(value = "/getProjectList.do")
//	 public @ResponseBody Object getProjectList(HttpServletRequest request,
//	   HttpServletResponse response,
//	   @ModelAttribute("projectVO") ProjectVO projectVO){
//	  
//	  Map<String, Object> mp = new HashMap<String, Object>();
//	  mp.put("data", projectService.selectProjectList(projectVO));
//	  
//	  Object result = mp;
//	  
//	  System.out.println(result);
//	  
//	  return result;
//	}
//	
//	
//
//    @ResponseBody // ajax를 불르기 위한 어노테이션
//    @RequestMapping(value="/getProjectList.do", method = RequestMethod.GET)
//        public List<ProjectVO> selectProjectList() throws Throwable{
//    	System.out.println(projectService.selectProjectList());
//        return projectService.selectProjectList();
//    }
// 



	
	
//	@RequestMapping(value = "/projectList.do")
//	public String projectList(Model model) throws Exception {
//
//	    List<ProjectVO> list = projectService.selectProjectList();
//
//	    logger.info(list.toString());
//
//	    model.addAttribute("list", list);
//
//	    return "projectList";
//	}
	
	/**
	 * 게시판 등록폼
	 * @param projectVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/projectRegisterForm.do")
	public String projectRegisterForm(@ModelAttribute("projectVO") ProjectVO projectVO, Model model) throws Exception {

	    return "projectRegisterForm";
	}
	
	/**
	 * 글을 등록합니다.
	 * @return
	 */
	@RequestMapping(value = "/projectInsert.do")
	public String projectInsert(@ModelAttribute("projectVO") ProjectVO projectVO, Model model) {

		projectService.insertProject(projectVO);
		
		return "redirect:/projectList.do";
	}

	/**
	 * 게시판 수정폼
	 * @param projectVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/projectUpdateForm.do")
	public String projectUpdateForm(@ModelAttribute("projectVO") ProjectVO projectVO, Model model) throws Exception {

	    return "projectUpdateForm";
	}
	
	/**
	 * 글을 수정합니다.
	 * @return
	 */
	@RequestMapping(value = "/projectUpdate.do")
	public String projectUpdate(@ModelAttribute("projectVO") ProjectVO projectVO, Model model) {

		projectService.updateProject(projectVO);
		
		return "redirect:/projectList.do";
	}
	
	/**
	 * 글을 삭제합니다.
	 * @return
	 */
	@RequestMapping(value = "/projectDelete.do")
	public String projectDelete(int proId) {

		projectService.deleteProject(proId);
		
		return "redirect:/projectList.do";
	}

	
}
