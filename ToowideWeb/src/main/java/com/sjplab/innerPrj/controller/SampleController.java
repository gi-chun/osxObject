package com.sjplab.innerPrj.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import javax.mail.internet.MimeMessage;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sjplab.innerPrj.common.common.CommandMap;
import com.sjplab.innerPrj.service.SampleService;

@Controller
public class SampleController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Resource(name="sampleService")
	private SampleService sampleService;
	
	
		
		// import card data
	  @RequestMapping(value = "/importCardData.do")
	  public ModelAndView importCardData(CommandMap commandMap) throws Exception{
	    	ModelAndView mv = new ModelAndView("/views/import_cardData");
	    	
	    	return mv;
	  }
		  
	  // budget_status
	  @RequestMapping(value = "/budget_status.do")
	  public ModelAndView budget_status(CommandMap commandMap) throws Exception{
	    	ModelAndView mv = new ModelAndView("/views/budget_status");
	    	
	    	return mv;
	  }
	  
	  // request_status
	  @RequestMapping(value = "/request_status.do")
	  public ModelAndView request_status(CommandMap commandMap) throws Exception{
	    	ModelAndView mv = new ModelAndView("/views/request_status");
	    	
	    	return mv;
	  }
	  
	  @RequestMapping(value="/selectMaxRequestNumber.do")
	    public ModelAndView selectMaxRequestNumber(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.selectMaxRequestNumber(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/selectCostNumber.do")
	    public ModelAndView selectCostNumber(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.selectCostNumber(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/selectRequestNumber.do")
	    public ModelAndView selectRequestNumber(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.selectRequestNumber(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/selectMaxCostNumber.do")
	    public ModelAndView selectMaxCostNumber(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.selectMaxCostNumber(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/selectReceiveRequest.do")
	    public ModelAndView selectReceiveRequest(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.selectReceiveRequest(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/selectRequestPerRequestNumber.do")
	    public ModelAndView selectRequestPerRequestNumber(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.selectRequestPerRequestNumber(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/selectTeamReceiveRequest.do")
	    public ModelAndView selectTeamReceiveRequest(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.selectTeamReceiveRequest(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/selectRequest.do")
	    public ModelAndView selectRequest(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.selectRequest(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/selectCostDetailPerProject.do")
	    public ModelAndView selectCostDetailPerProject(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.selectCostDetailPerProject(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/selectCostDetailPerRequestPRGNumber.do")
	    public ModelAndView selectCostDetailPerRequestPRGNumber(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.selectCostDetailPerRequestPRGNumber(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/selectCostPerProject.do")
	    public ModelAndView selectCostPerProject(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.selectCostPerProject(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/searchCostByApproval.do")
	    public ModelAndView searchCostByApproval(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.searchCostByApproval(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/searchNoInputData.do")
	    public ModelAndView searchNoInputData(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.searchNoInputData(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/selectBudgetStatus.do")
	    public ModelAndView selectBudgetStatus(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.selectBudgetStatus(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/selectBudgetInternal.do")
	    public ModelAndView selectBudgetInternal(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.selectBudgetInternal(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/getProjectNameList.do")
	    public ModelAndView getProjectNameList(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.getProjectNameList(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/selectInternalClassification.do")
	    public ModelAndView selectInternalClassification(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.selectInternalClassification(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/selectProjectList.do")
	    public ModelAndView selectProjectList(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	//List<Map<String,Object>> list;
	    	Map<String,Object> map = sampleService.selectProjectList(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/selectPerformance.do")
	    public ModelAndView selectPerformance(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	//List<Map<String,Object>> list;
	    	Map<String,Object> map = sampleService.selectPerformance(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	// performanceStatus
	  @RequestMapping(value = "/performanceStatus.do")
	  public ModelAndView performanceStatus(CommandMap commandMap) throws Exception{
	    	ModelAndView mv = new ModelAndView("/views/performance_status");
	    	
//	    	Map<String,Object> map = commandMap.getMap();
//			mv.addObject("GO", map.get("GO"));
			
	    	return mv;
	  }
	
	  @RequestMapping(value="/insertCostRequest.do")
	    public ModelAndView insertCostRequest(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.insertCostRequest(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/insertCarRequest.do")
	    public ModelAndView insertCarRequest(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.insertCarRequest(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/insertNormalRequest.do")
	    public ModelAndView insertNormalRequest(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.insertNormalRequest(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	@RequestMapping(value="/insertBudget.do")
    public ModelAndView insertBudget(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.insertBudget(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/insertBudgetInternal.do")
    public ModelAndView insertBudgetInternal(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.insertBudgetInternal(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/deleteBudgetInternal.do")
    public ModelAndView deleteBudgetInternal(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.deleteBudgetInternal(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/insertCostDetailPerRequest.do")
    public ModelAndView insertCostDetailPerRequest(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.insertCostDetailPerRequest(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/insertCostDetailPerRequestForCar.do")
    public ModelAndView insertCostDetailPerRequestForCar(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.insertCostDetailPerRequestForCar(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/insertCostDetailPerProject.do")
    public ModelAndView insertCostDetailPerProject(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.insertCostDetailPerProject(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/updateCostDetailPerProject.do")
    public ModelAndView updateCostDetailPerProject(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.updateCostDetailPerProject(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/updateRequestPerRequestNumber.do")
    public ModelAndView updateRequestPerRequestNumber(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.updateRequestPerRequestNumber(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/updateCostPerRequestNumber.do")
    public ModelAndView updateCostPerRequestNumber(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.updateCostPerRequestNumber(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/updateBudget.do")
    public ModelAndView updateBudget(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.updateBudget(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	 @RequestMapping(value="/selectBudget.do")
	    public ModelAndView selectBudget(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.selectBudget(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	 
	 @RequestMapping(value="/insertCardData.do")
	    public ModelAndView insertCardData(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
			
	    	Map<String,Object> map = sampleService.insertCardData(commandMap.getMap(), request);
//	    	map.put("GO", "createBudget");
	    	mv.addObject("map", map);
//	    	
	    	return mv;
	    }
	
	 @RequestMapping(value="/selectProject.do")
	    public ModelAndView selectProject(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.selectProject(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	 
	@RequestMapping(value="/insertProject.do")
    public ModelAndView insertProject(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.insertProject(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/updateProject.do")
    public ModelAndView updateProject(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.updateProject(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/insertProjectFile.do")
    public ModelAndView insertProjectFile(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
		
    	Map<String,Object> map = sampleService.insertProjectFile(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/updateProjectFile.do")
    public ModelAndView updateProjectFile(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	//ModelAndView mv = new ModelAndView("redirect:/performanceStatus.do");
		
    	Map<String,Object> map = sampleService.updateProjectFile(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/insertCostFile.do")
    public ModelAndView insertCostFile(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	//ModelAndView mv = new ModelAndView("redirect:/performanceStatus.do");
		
    	Map<String,Object> map = sampleService.insertCostFile(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/insertRequestFile.do")
    public ModelAndView insertRequestFile(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	//ModelAndView mv = new ModelAndView("redirect:/performanceStatus.do");
		
    	Map<String,Object> map = sampleService.insertRequestFile(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/updateCostFile.do")
    public ModelAndView updateCostFile(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.updateCostFile(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/deleteFileUpdate.do")
    public ModelAndView deleteFileUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.deleteFileUpdate(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;

    }
	
	@RequestMapping(value="/deleteCostFileUpdate.do")
    public ModelAndView deleteCostFileUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.deleteCostFileUpdate(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;

    }
	
	@RequestMapping(value="/deleteRequestFileUpdate.do")
    public ModelAndView deleteRequestFileUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.deleteRequestFileUpdate(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;

    }
	
	@RequestMapping(value="/selectCostFiles.do")
    public ModelAndView selectCostFiles(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.selectCostFiles(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/selectRequestFiles.do")
    public ModelAndView selectRequestFiles(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.selectRequestFiles(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/selectProjectFiles.do")
    public ModelAndView selectProjectFiles(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.selectProjectFiles(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/getSession.do")
    public ModelAndView getSession(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.getSession(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/setSessionGoCommand.do")
    public ModelAndView setSessionGoCommand(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.setSessionGoCommand(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/setSession.do")
    public ModelAndView setSession(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.setSession(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/insertMember.do")
    public ModelAndView insertMember(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.insertMember(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/selectMemberList.do")
    public ModelAndView selectMemberList(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	//List<Map<String,Object>> list;
    	Map<String,Object> map = sampleService.selectMemberList(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/selectMembersPerTeam.do")
    public ModelAndView selectMembersPerTeam(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.selectMembersPerTeam(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	@RequestMapping(value="/deleteMember.do")
    public ModelAndView deleteMember(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.deleteMember(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	// listMember
	  @RequestMapping(value = "/listMember.do")
	  public ModelAndView listMember(CommandMap commandMap) throws Exception{
	    	ModelAndView mv = new ModelAndView("/views/list_member");
	    	
	    	return mv;
	  }
	  
	  @RequestMapping(value="/insertNotice.do")
	    public ModelAndView insertNotice(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.insertNotice(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/updateNotice.do")
	    public ModelAndView updateNotice(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.updateNotice(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/insertTeam.do")
	    public ModelAndView insertTeam(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.insertTeam(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/selectTeamNames.do")
	    public ModelAndView selectTeamNames(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.selectTeamNames(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/selectTeamList.do")
	    public ModelAndView selectTeamList(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.selectTeamList(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/selectNoticeList.do")
	    public ModelAndView selectNoticeList(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.selectNoticeList(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/selectNoticeDetail.do")
	    public ModelAndView selectNoticeDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.selectNoticeDetail(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
	  @RequestMapping(value="/getNotice.do")
	    public ModelAndView getNotice(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.getNotice(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
		
	  	@RequestMapping(value="/deleteNotice.do")
	    public ModelAndView deleteNotice(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.deleteNotice(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
	  
		@RequestMapping(value="/deleteTeam.do")
	    public ModelAndView deleteTeam(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	Map<String,Object> map = sampleService.deleteTeam(commandMap.getMap(), request);
	    	mv.addObject("map", map);
	    	
	    	return mv;
	    }
		
		// listTeam
		  @RequestMapping(value = "/listTeam.do")
		  public ModelAndView listTeam(CommandMap commandMap) throws Exception{
		    	ModelAndView mv = new ModelAndView("/views/list_team");
		    	
		    	return mv;
		  }
		  
		// listNotice
		  @RequestMapping(value = "/listNotice.do")
		  public ModelAndView listNotice(CommandMap commandMap) throws Exception{
		    	ModelAndView mv = new ModelAndView("/views/list_notice");
		    	
		    	return mv;
		  }
		  
	// logout
		@RequestMapping(value="/logout.do")
	    public ModelAndView logout(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    	ModelAndView mv = new ModelAndView("jsonView");
	    	
	    	sampleService.logout(commandMap.getMap(), request);
	    	
        	log.debug("===============          logout 1      =======");
    		mv.addObject("SUCCESS",  1);
	    	
	    	return mv;
	    }
		
	// login
	@RequestMapping(value="/login.do")
    public ModelAndView login(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.login(commandMap.getMap(), request);
    	
        if (map.containsValue(null)) {
    		log.debug("===============          login   2      =======");
    		mv.addObject("SUCCESS",  0);
    	}else{
    		log.debug("===============          login   1      =======");
    		mv.addObject("SUCCESS",  1);
    	}
    	
		mv.addObject("map", map.get("map"));
		
    	return mv;
    }
	
	// mailForm
	  @RequestMapping(value = "/mailForm.do")
	  public ModelAndView mailForm(CommandMap commandMap) throws Exception{
	    	ModelAndView mv = new ModelAndView("/views/mailForm");
	    	
	    	return mv;
	  }
	  
	// mailSending 코드
	  @RequestMapping(value = "/mailSending.do")
	  public ModelAndView mailSending(HttpServletRequest request) {
	   
	    String setfrom = "pms.sjplab@gmail.com";         
	    String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
	    String title   = request.getParameter("title");      // 보내는 사람 이메일
	    String content = request.getParameter("content");    // 보내는 사람 이메일
	   
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(content);  // 메일 내용
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
	    
	    ModelAndView mv = new ModelAndView("redirect:/mailForm.do");
	   
	    return mv;
	  }
	  
	@RequestMapping(value="/openBoardList.do")
    public ModelAndView openBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/views/boardList");
    	
    	return mv;
    }
	
	@RequestMapping(value="/selectBoardList.do")
    public ModelAndView selectBoardList(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
//    	ModelAndView mv = new ModelAndView("/views/boardList");
    	
    	List<Map<String,Object>> list = sampleService.selectBoardList(commandMap.getMap());
    	mv.addObject("list", list);
    	
    	if(list.size() > 0){
//    		mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
    		mv.addObject("TOTAL", list.size());
    	}
    	else{
    		mv.addObject("TOTAL", 0);
    	}
    	
    	return mv;
    }
	
	@RequestMapping(value="/openBoardWrite.do")
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/views/boardWrite");
		
		return mv;
	}
	
	@RequestMapping(value="/insertBoard.do")
	public ModelAndView insertBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/openBoardList.do");
		
		sampleService.insertBoard(commandMap.getMap(), request);
		
		return mv;
	}
	
	@RequestMapping(value="/openBoardDetail.do")
	public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/views/boardDetail");
		
		Map<String,Object> map = sampleService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/showReportPage.do")
	public ModelAndView showReportPage(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/views/approved_report");
		
		Map<String,Object> map = sampleService.selectReportData(commandMap.getMap(), request);
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/openBoardUpdate.do")
	public ModelAndView openBoardUpdate(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/views/boardUpdate");
		
		Map<String,Object> map = sampleService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/updateBoard.do")
	public ModelAndView updateBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/openBoardDetail.do");
		
		sampleService.updateBoard(commandMap.getMap(), request);
		
		mv.addObject("IDX", commandMap.get("IDX"));
		return mv;
	}
	
	@RequestMapping(value="/deleteBoard.do")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/openBoardList.do");
		
		sampleService.deleteBoard(commandMap.getMap());
		
		return mv;
	}
}
