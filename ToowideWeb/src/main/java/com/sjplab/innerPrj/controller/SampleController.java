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
	
	
		
		// budget_status
	  @RequestMapping(value = "/budget_status.do")
	  public ModelAndView budget_status(CommandMap commandMap) throws Exception{
	    	ModelAndView mv = new ModelAndView("/views/budget_status");
	    	
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
	  
	@RequestMapping(value="/deleteMember.do")
    public ModelAndView deleteMember(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.deleteMember(commandMap.getMap(), request);
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
    	//ModelAndView mv = new ModelAndView("jsonView");
		ModelAndView mv = new ModelAndView("redirect:/performanceStatus.do");
    	
    	Map<String,Object> map = sampleService.insertProjectFile(commandMap.getMap(), request);
//    	map.put("GO", "createBudget");
//    	mv.addObject("map", map);
//    	
    	return mv;
    }
	
	@RequestMapping(value="/updateProjectFile.do")
    public ModelAndView updateProjectFile(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	//ModelAndView mv = new ModelAndView("jsonView");
    	ModelAndView mv = new ModelAndView("redirect:/performanceStatus.do");
		
    	Map<String,Object> map = sampleService.updateProjectFile(commandMap.getMap(), request);
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
	
	@RequestMapping(value="/selectProjectFiles.do")
    public ModelAndView selectProjectFiles(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	Map<String,Object> map = sampleService.selectProjectFiles(commandMap.getMap(), request);
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
	
	@RequestMapping(value="/selectMemberList.do")
    public ModelAndView selectMemberList(CommandMap commandMap, HttpServletRequest request) throws Exception{
    	ModelAndView mv = new ModelAndView("jsonView");
    	
    	//List<Map<String,Object>> list;
    	Map<String,Object> map = sampleService.selectMemberList(commandMap.getMap(), request);
    	mv.addObject("map", map);
    	
    	return mv;
    }
	
	// listMember
		  @RequestMapping(value = "/listMember.do")
		  public ModelAndView listMember(CommandMap commandMap) throws Exception{
		    	ModelAndView mv = new ModelAndView("/views/list_member");
		    	
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
