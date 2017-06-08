package com.sjplab.innerPrj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.sjplab.innerPrj.common.util.FileUtils;
import com.sjplab.innerPrj.dao.SampleDAO;
import com.sjplab.innerPrj.common.common.Member;


@Service("sampleService")
public class SampleServiceImpl implements SampleService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="sampleDAO")
	private SampleDAO sampleDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return sampleDAO.selectBoardList(map);
	}

	@Override
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		log.debug("===============          insertBoard   1      =======");
		sampleDAO.insertBoard(map);
		
		log.debug("===============          insertBoard   2      =======");
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++){
			sampleDAO.insertFile(list.get(i));
		}
		
		log.debug("===============          insertBoard   3      =======");
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		sampleDAO.updateHitCnt(map);
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = sampleDAO.selectBoardDetail(map);
		resultMap.put("map", tempMap);
		
		List<Map<String,Object>> list = sampleDAO.selectFileList(map);
		resultMap.put("list", list);
		
		return resultMap;
	}

	@Override
	public void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception{
		sampleDAO.updateBoard(map);
		
		sampleDAO.deleteFileList(map);
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo(map, request);
		Map<String,Object> tempMap = null;
		for(int i=0, size=list.size(); i<size; i++){
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				sampleDAO.insertFile(tempMap);
			}
			else{
				sampleDAO.updateFile(tempMap);
			}
		}
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		sampleDAO.deleteBoard(map);
	}
	
	@Override
	public void logout(Map<String, Object> map, HttpServletRequest request) throws Exception {
			
		HttpSession session = request.getSession(true);
		//session.setAttribute("member", member);
		session.removeAttribute("member");
	
		return;
	}
	
	@Override
	public Map<String, Object> login(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		
		//sampleDAO.updateHitCnt(map);
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = sampleDAO.login(map);
		
		//if (tempMap.containsValue(null)) { //login fail
		if (tempMap == null) { //login fail
			log.debug("===============          login fail     =======");
		}else{
			log.debug("===============          employee_num === " + tempMap.get("EMPLOYEE_NUM"));
			
			Member member =  new Member();
			member.setEmployee_num(tempMap.get("EMPLOYEE_NUM").toString());
			member.setMember_name(tempMap.get("MEMBER_NAME").toString());
			member.setEmail_addr(tempMap.get("EMAIL_ADDR").toString());
			member.setTeam_name(tempMap.get("TEAM_NAME").toString());
			member.setPosition(tempMap.get("POSITION").toString());
			
			HttpSession session = request.getSession(true);
			session.setAttribute("member", member);
		}

		resultMap.put("map", tempMap);
		
//		List<Map<String,Object>> list = sampleDAO.selectFileList(map);
//		resultMap.put("list", list);
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectMemberList(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = new HashMap<String,Object>();
		List<Map<String,Object>> list = sampleDAO.selectMemberList(map);
		
		HttpSession session = request.getSession(true);
		Member member = (Member)session.getAttribute("member");
		
		if(member == null){
			resultMap.put("session_data", 0);
		}else{
			resultMap.put("session_data", 1);
		}
		
		tempMap.put("EMPLOYEE_NUM", member.getEmployee_num());
		tempMap.put("MEMBER_NAME", member.getMember_name());
		tempMap.put("EMAIL_ADDR", member.getEmail_addr());
		tempMap.put("TEAM_NAME", member.getTeam_name());
		tempMap.put("POSITION", member.getPosition());

		resultMap.put("sessionMap", tempMap);
		resultMap.put("list", list);
		resultMap.put("list_count",  list.size());
		
//		List<Map<String,Object>> list = sampleDAO.selectFileList(map);
//		resultMap.put("list", list);
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> getSession(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		Map<String, Object> tempMap = new HashMap<String,Object>();
		
		HttpSession session = request.getSession(true);
		Member member = (Member)session.getAttribute("member");
		String goCommand = (String)session.getAttribute("goCommand");
		
		if(member == null){
			resultMap.put("session_data", 0);
		}else{
			resultMap.put("session_data", 1);
		}
		
		tempMap.put("EMPLOYEE_NUM", member.getEmployee_num());
		tempMap.put("MEMBER_NAME", member.getMember_name());
		tempMap.put("EMAIL_ADDR", member.getEmail_addr());
		tempMap.put("TEAM_NAME", member.getTeam_name());
		tempMap.put("POSITION", member.getPosition());
		tempMap.put("goCommand", goCommand);
		
		tempMap.put("PRJ_NUM", (String)session.getAttribute("PRJ_NUM"));
		tempMap.put("PRJ_NAME", (String)session.getAttribute("PRJ_NAME"));
		tempMap.put("PRODUCT_TEAM", (String)session.getAttribute("PRODUCT_TEAM"));
		tempMap.put("CHARGE_PM", (String)session.getAttribute("CHARGE_PM"));
		tempMap.put("CHARGE_PD", (String)session.getAttribute("CHARGE_PD"));
		tempMap.put("CONTRACT_AMOUNT", (String)session.getAttribute("CONTRACT_AMOUNT"));
		tempMap.put("PRODUCT_AMOUNT", (String)session.getAttribute("PRODUCT_AMOUNT"));

		resultMap.put("sessionMap", tempMap);
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> setSessionGoCommand(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		HttpSession session = request.getSession(true);
		session.setAttribute("goCommand", "");
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> setSession(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		HttpSession session = request.getSession(true);
		session.setAttribute("S_goCommand", "go_autoSearch");
		session.setAttribute("S_STANDARD_YEAR", map.get("S_STANDARD_YEAR").toString());
		session.setAttribute("S_STANDARD_QUARTER", map.get("S_STANDARD_QUARTER").toString());
		session.setAttribute("S_PRODUCT_TEAM", map.get("S_PRODUCT_TEAM").toString());
		session.setAttribute("S_PRJ_NAME", map.get("S_PRJ_NAME").toString());
		
		return resultMap;
	}
	
	
	@Override
	public Map<String, Object> deleteMember(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			sampleDAO.deleteMember(map);
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          deleteMember fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			sampleDAO.insertMember(map);
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          insertMember fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> insertBudget(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			sampleDAO.insertBudget(map);
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          insertBudget fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> updateBudget(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			sampleDAO.updateBudget(map);
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          insertBudget fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectBudget(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			Map<String, Object> tempMap = sampleDAO.selectBudget(map);
			resultMap.put("isData", 1);
			if (tempMap == null){
				resultMap.put("isData", 0);
			}
			resultMap.put("map", tempMap);
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          selectBudget fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		return resultMap;
	}
	
	
	@Override
	public Map<String, Object> selectProject(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			Map<String, Object> tempMap = sampleDAO.selectProject(map);
			resultMap.put("isData", 1);
			if (tempMap == null){
				resultMap.put("isData", 0);
			}
			resultMap.put("map", tempMap);
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          selectProject fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> updateProject(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			sampleDAO.updateProject(map);
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          insertBudget fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> insertProject(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			
//			String value;
//			for( String key : map.keySet() ){
//				value = map.get(key).toString();
//				if(value.length() < 1){
//					map.remove(key);
//				}
//				
//				if(key.equals("cpFormRemark1") || key.equals("cpFormRemark2") || key.equals("cpFormRemark3") 
//						|| key.equals("cpFormRemark4") || key.equals("cpFormRemark5") || key.equals("cpFormNagotiation")
//						|| key.equals("cpFormReportProgress") || key.equals("cpFormReportResult") || key.equals("cpFormReportSpecial")
//						|| key.equals("cpFormDeliveryProduct") ){
//					
//					//log.debug("===============          select projectNumber fail     =======");
//				}else{
//					map.put(key, map.get(key).toString().replaceAll("\\s+",""));
//				}	
//			}
				
			//insert project infor 
			sampleDAO.insertProject(map);
		
			//select project name (from project name)
//			Map<String, Object> requestMap = new HashMap<String,Object>();
//			requestMap.put("cpFormPrjName", map.get("cpFormPrjName").toString());
//			
//			Map<String, Object> tempMap = sampleDAO.selectProjectNumber(requestMap);
//			
//			if (tempMap == null) { //login fail
//				log.debug("===============          select projectNumber fail     =======");
//			}else{
//				log.debug("===============          projectNumber === " + tempMap.get("PRJ_NUM"));
//			}
//			tempMap.put("WRITER", map.get("WRITER"));
//			
//			//insert file
//			List<Map<String,Object>> list = fileUtils.parseProjectInsertFileInfo(tempMap, request);
//			for(int i=0, size=list.size(); i<size; i++){
//				
//				sampleDAO.insertFileProject(list.get(i));
//			}
			
			resultMap.put("success", 1);
		
		}
		catch(Exception e){
			log.debug("===============          insertProject fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
			
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectProjectFiles(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			List<Map<String,Object>> firstList = sampleDAO.selectProjectFiles(map);
			
			resultMap.put("firstList", firstList);
			resultMap.put("firstListCount", firstList.size());
			
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          selectProject fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> deleteFileUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			sampleDAO.deleteFileUpdate(map);
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          deleteFileUpdate fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> updateProjectFile(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			//insert file
			List<Map<String,Object>> list = fileUtils.parseProjectInsertFileInfo(map, request);
			for(int i=0, size=list.size(); i<size; i++){
				
				sampleDAO.insertFileProject(list.get(i));
			}
			
			resultMap.put("success", 1);
		
		}
		catch(Exception e){
			log.debug("===============          updateProjectFile fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
			
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> insertProjectFile(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
//			//select project name (from project name)
			Map<String, Object> requestMap = new HashMap<String,Object>();
			requestMap.put("PRJ_NAME", map.get("PRJ_NAME").toString());
			
			Map<String, Object> tempMap = sampleDAO.selectProjectNumber(requestMap);
			
			if (tempMap == null) { //login fail
				log.debug("===============          select projectNumber fail     =======");
			}else{
				log.debug("===============          projectNumber === " + tempMap.get("PRJ_NUM"));
			}
			tempMap.put("WRITER", map.get("WRITER"));
			
			//insert file
			List<Map<String,Object>> list = fileUtils.parseProjectInsertFileInfo(tempMap, request);
			for(int i=0, size=list.size(); i<size; i++){
				
				sampleDAO.insertFileProject(list.get(i));
			}
			
			HttpSession session = request.getSession(true);
			String projectNumber = String.valueOf(tempMap.get("PRJ_NUM"));
			session.setAttribute("goCommand", "createBudget");
			
			session.setAttribute("PRJ_NUM", projectNumber);
			session.setAttribute("PRJ_NAME", map.get("PRJ_NAME").toString());
			session.setAttribute("PRODUCT_TEAM", map.get("PRODUCT_TEAM").toString());
			session.setAttribute("CHARGE_PM", map.get("CHARGE_PM").toString());
			session.setAttribute("CHARGE_PD", map.get("CHARGE_PD").toString());
			session.setAttribute("CONTRACT_AMOUNT", map.get("CONTRACT_AMOUNT").toString());
			session.setAttribute("PRODUCT_AMOUNT", map.get("PRODUCT_AMOUNT").toString());
			
			resultMap.put("success", 1);
		
		}
		catch(Exception e){
			log.debug("===============          insertProject fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
			
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectPerformance(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			String strSegment =  map.get("STANDARD_QUARTER").toString();
			if(strSegment.equals("전체")){
				//map.remove("STANDARD_QUARTER");
			}
			
			//team ( total, my team only)
			strSegment =  map.get("PRODUCT_TEAM").toString();
			
			if(strSegment.equals("전체")){
				
				//map.remove("PRODUCT_TEAM");
				
				List<Map<String,Object>> firstList = sampleDAO.selectPerformanceFirstTotal(map);
				List<Map<String,Object>> secondList = sampleDAO.selectPerformanceSecondTotal(map);
				List<Map<String,Object>> thirdList = sampleDAO.selectPerformanceThirdTotal(map);
				
				resultMap.put("firstList", firstList);
				resultMap.put("firstListCount", firstList.size());
				resultMap.put("secondList", secondList);
				resultMap.put("secondListCount", secondList.size());
				resultMap.put("thirdList", thirdList);
				resultMap.put("thirdListCount", thirdList.size());
				
			}else{
				
				List<Map<String,Object>> firstList = sampleDAO.selectPerformanceFirst(map);
				List<Map<String,Object>> secondList = sampleDAO.selectPerformanceSecond(map);
				List<Map<String,Object>> thirdList = sampleDAO.selectPerformanceThird(map);
				
				resultMap.put("firstList", firstList);
				resultMap.put("firstListCount", firstList.size());
				resultMap.put("secondList", secondList);
				resultMap.put("secondListCount", secondList.size());
				resultMap.put("thirdList", thirdList);
				resultMap.put("thirdListCount", thirdList.size());
			}
			
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          selectPerformance fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
			
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectProjectList(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			//String strProductTeam =  map.get("PRODUCT_TEAM").toString();
				
			List<Map<String,Object>> firstList = sampleDAO.selectProjectList(map);
			
			resultMap.put("firstList", firstList);
			resultMap.put("firstListCount", firstList.size());
			
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          selectPerformance fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
			
		}
		return resultMap;
	}

}
