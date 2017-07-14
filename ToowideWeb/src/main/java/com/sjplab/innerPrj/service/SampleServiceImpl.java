package com.sjplab.innerPrj.service;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.core.io.FileSystemResource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sjplab.innerPrj.common.util.ExcelPOIHelper;
import com.sjplab.innerPrj.common.util.MyCell;
import com.sjplab.innerPrj.common.util.FileUtils;
import com.sjplab.innerPrj.dao.SampleDAO;
import com.sjplab.innerPrj.common.common.Member;


@Service("sampleService")
public class SampleServiceImpl implements SampleService{
	private static final String logoPath = "/Users/gclee/work_web/workspace/ToowideWeb/src/main/webapp/img/logo.png";
//	private static final String logoPath = "C:\\WEBSERVER\\apache-tomcat-9.0.0.M20\\webapps\\ToowideWeb\\img\\logo.png";
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Resource(name="excelPOIHelper")
	private ExcelPOIHelper excelPOIHelper;
	
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
	public Map<String, Object> selectReportData(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
//			Map<String, Object> tempMap = sampleDAO.selectBoardDetail(map);
			Map<String, Object> tempMap = null;
			resultMap.put("map", tempMap);
			
//			List<Map<String,Object>> list = sampleDAO.selectFileList(map);
			List<Map<String,Object>> list = null;
			resultMap.put("list", list);
			
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          selectReportData fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		
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
			member.setAuthority(tempMap.get("AUTHORITY").toString());
			
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
		tempMap.put("AUTHORITY", member.getAuthority());

		resultMap.put("sessionMap", tempMap);
		resultMap.put("list", list);
		resultMap.put("list_count",  list.size());
		
//		List<Map<String,Object>> list = sampleDAO.selectFileList(map);
//		resultMap.put("list", list);
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectMembersPerTeam(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		List<Map<String,Object>> list = sampleDAO.selectMembersPerTeam(map);
		
		resultMap.put("list", list);
		resultMap.put("list_count",  list.size());
		
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
	public Map<String, Object> selectTeamList(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		List<Map<String,Object>> list = sampleDAO.selectTeamList(map);
		
		resultMap.put("list", list);
		resultMap.put("list_count",  list.size());
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectTeamNames(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		List<Map<String,Object>> list = sampleDAO.selectTeamNames(map);
		
		resultMap.put("list", list);
		resultMap.put("list_count",  list.size());
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> insertTeam(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			sampleDAO.insertTeam(map);
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          insertTeam fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> deleteTeam(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			sampleDAO.deleteTeam(map);
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          deleteTeam fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		
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
		tempMap.put("AUTHORITY", member.getAuthority());
		tempMap.put("goCommand", goCommand);
		
		tempMap.put("PRJ_NUM", (String)session.getAttribute("PRJ_NUM"));
		tempMap.put("PRJ_NAME", (String)session.getAttribute("PRJ_NAME"));
		tempMap.put("PRODUCT_TEAM", (String)session.getAttribute("PRODUCT_TEAM"));
		tempMap.put("CHARGE_PM", (String)session.getAttribute("CHARGE_PM"));
		tempMap.put("CHARGE_PD", (String)session.getAttribute("CHARGE_PD"));
		tempMap.put("CONTRACT_AMOUNT", (String)session.getAttribute("CONTRACT_AMOUNT"));
		tempMap.put("PRODUCT_AMOUNT", (String)session.getAttribute("PRODUCT_AMOUNT"));
		
		tempMap.put("S_isSession", (String)session.getAttribute("S_isSession"));
		tempMap.put("S_goCommand", (String)session.getAttribute("S_goCommand"));
		tempMap.put("S_STANDARD_YEAR", (String)session.getAttribute("S_STANDARD_YEAR"));
		tempMap.put("S_STANDARD_QUARTER", (String)session.getAttribute("S_STANDARD_QUARTER"));
		tempMap.put("S_PRODUCT_TEAM", (String)session.getAttribute("S_PRODUCT_TEAM"));
		tempMap.put("S_PRJ_NAME", (String)session.getAttribute("S_PRJ_NAME"));
		tempMap.put("S_PRJ_NUMBER", (String)session.getAttribute("S_PRJ_NUMBER"));
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
		
		try {
			HttpSession session = request.getSession(true);
			if(map.get("S_isSession") != null){
				session.setAttribute("S_isSession", map.get("S_isSession").toString());
			}
			if(map.get("S_STANDARD_YEAR") != null){
				session.setAttribute("S_STANDARD_YEAR", map.get("S_STANDARD_YEAR").toString());
			}
			if(map.get("S_STANDARD_QUARTER") != null){
				session.setAttribute("S_STANDARD_QUARTER", map.get("S_STANDARD_QUARTER").toString());
			}
			if(map.get("S_PRODUCT_TEAM") != null){
				session.setAttribute("S_PRODUCT_TEAM", map.get("S_PRODUCT_TEAM").toString());
			}
			if(map.get("S_PRJ_NAME") != null){
				session.setAttribute("S_PRJ_NAME", map.get("S_PRJ_NAME").toString());
			}
			if(map.get("S_PRJ_NUMBER") != null){
				session.setAttribute("S_PRJ_NUMBER", map.get("S_PRJ_NUMBER").toString());
			}
		
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          setSession fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> insertCostRequest(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		String sReceiveTitle = "[수신] 재무업무요청";
		String sSendTitle    = "[발신] 재무업무요청";
		String sBusiness1 = map.get("crFormBusiness1").toString();
		String sBusiness2 = map.get("crFormBusiness2").toString();
		String sRequestDetails = map.get("crFormRequestDetails").toString(); 
	    String sContents = "";
	    String sContentsTemp = "";
	    String sFrom = map.get("g_team_db_name").toString() + " " + map.get("g_member_name").toString() + "으로부터 업무요청을 수신하였습니다.";
	    String sTo = map.get("crFormReceiveTeam").toString() + "에 업무요청을 요청하였습니다.";	
	    
	    sContentsTemp += "<html>";
		sContentsTemp += "<head>";
		sContentsTemp += "    <title>Welcome to SJPLab</title>";
		sContentsTemp += "</head>";
		sContentsTemp += "<body>";
		sContentsTemp += "    <h1>제목</h1>";
		sContentsTemp += "    <table cellspacing='0' style='border: 2px dashed #FB4314; width: 1000px; height: 500px;'>";
		sContentsTemp += "        <tr style='background-color: #e0e0e0;'>";
		sContentsTemp += "            <td align='center'><img src='cid:identifier1'></td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "        <tr>";
		sContentsTemp += "            <th align='center'>업무분야1:</th><td>업무분야1내용</td>";
		sContentsTemp += "        <tr>";
		sContentsTemp += "            <th align='center'>업무분야2:</th><td>업무분야2내용</td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "        <tr>";
		sContentsTemp += "            <th align='center'>요청내용:</th><td>요청내용내용</td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "        <tr>";
		sContentsTemp += "            <th align='center'>DIRECTION:</th><td>방향내용</td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "        <tr style='background-color: #e0e0e0;'>";
		sContentsTemp += "            <th>TOOWIDE:</th><td><a href='http://112.221.229.148:8080'>TOOWIDE Project Management System</a></td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "    </table>";
		sContentsTemp += "</body>";
		sContentsTemp += "</html>";
	    
		try {
			sampleDAO.insertCostRequest(map);
			resultMap.put("success", 1);
			
			//send to send people //////////////////////////////////////////////////////////////////////
			sContents = "";
			sContents = sContentsTemp;
			
			sContents = sContents.replace("제목", sSendTitle);
			sContents = sContents.replace("업무분야1내용", sBusiness1);
			sContents = sContents.replace("업무분야2내용", sBusiness2);
			sContents = sContents.replace("요청내용내용", sRequestDetails);
			sContents = sContents.replace("방향내용", sTo);
		    
			Map<String, Object> requestMap = new HashMap<String,Object>();
			requestMap.put("g_member_name", map.get("g_member_name").toString());
			requestMap.put("g_team_db_name", map.get("g_team_db_name").toString());
			
			Map<String, Object> tempMap = sampleDAO.selectEmailForMember(requestMap);
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("pms.sjplab@gmail.com");  
			messageHelper.setTo(tempMap.get("email_addr").toString());
			messageHelper.setSubject(sSendTitle);
			messageHelper.setText(sContents, true);
			
			FileSystemResource res = new FileSystemResource(new File(logoPath));
			messageHelper.addInline("identifier1", res);
			
			mailSender.send(message);
			
			//send to receive team //////////////////////////////////////////////////////////////////////
			sContents = "";
			sContents = sContentsTemp;
			
			sContents = sContents.replace("제목", sReceiveTitle);
			sContents = sContents.replace("업무분야1내용", sBusiness1);
			sContents = sContents.replace("업무분야2내용", sBusiness2);
			sContents = sContents.replace("요청내용내용", sRequestDetails);
			sContents = sContents.replace("방향내용", sFrom);
			
			Map<String, Object> requestMap2 = new HashMap<String,Object>();
			requestMap2.put("crFormReceiveTeam", map.get("crFormReceiveTeam").toString());
			
			List<Map<String,Object>> list = sampleDAO.selectEmailListForTeam(requestMap2);
			Map<String, Object> tempMap2 = new HashMap<String,Object>();
			
			MimeMessage message2 = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper2 = new MimeMessageHelper(message2, true, "UTF-8");
			messageHelper2.setFrom("pms.sjplab@gmail.com");
			messageHelper2.setSubject(sReceiveTitle);
			messageHelper2.setText(sContents, true);
			messageHelper2.addInline("identifier1", res);
			
			for(int i=0, size=list.size(); i<size; i++){
				tempMap2 = list.get(i);
				if(i == 0){
					messageHelper2.setTo(tempMap2.get("email_addr").toString());
				}else if(i == 1){
					messageHelper2.setCc(tempMap2.get("email_addr").toString());
				}else{
					messageHelper2.addCc(tempMap2.get("email_addr").toString());
				}
				tempMap2.clear();
			}
			mailSender.send(message2);
			
		}
		catch(Exception e){
			log.debug("===============          insertCostRequest fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> insertCarRequest(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		String sReceiveTitle = "[수신] 업무용차량신청";
		String sSendTitle    = "[발신] 업무용차량신청";
		String sBusiness1 = map.get("crcFormBusiness1").toString();
		String sBusiness2 = "";
		String sRequestDetails = map.get("crcFormRequestDetails").toString(); 
	    String sContents = "";
	    String sContentsTemp = "";
	    String sFrom = map.get("g_team_db_name").toString() + " " + map.get("g_member_name").toString() + "으로부터 업무요청을 수신하였습니다.";
	    String sTo = map.get("crcFormReceiveTeam").toString() + "에 업무요청을 요청하였습니다.";	
	    
	    sContentsTemp += "<html>";
		sContentsTemp += "<head>";
		sContentsTemp += "    <title>Welcome to SJPLab</title>";
		sContentsTemp += "</head>";
		sContentsTemp += "<body>";
		sContentsTemp += "    <h1>제목</h1>";
		sContentsTemp += "    <table cellspacing='0' style='border: 2px dashed #FB4314; width: 1000px; height: 500px;'>";
		sContentsTemp += "        <tr style='background-color: #e0e0e0;'>";
		sContentsTemp += "            <td align='center'><img src='cid:identifier1'></td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "        <tr>";
		sContentsTemp += "            <th align='center'>업무분야1:</th><td>업무분야1내용</td>";
		sContentsTemp += "        <tr>";
		sContentsTemp += "            <th align='center'>업무분야2:</th><td>업무분야2내용</td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "        <tr>";
		sContentsTemp += "            <th align='center'>요청내용:</th><td>요청내용내용</td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "        <tr>";
		sContentsTemp += "            <th align='center'>DIRECTION:</th><td>방향내용</td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "        <tr style='background-color: #e0e0e0;'>";
		sContentsTemp += "            <th>TOOWIDE:</th><td><a href='http://112.221.229.148:8080'>TOOWIDE Project Management System</a></td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "    </table>";
		sContentsTemp += "</body>";
		sContentsTemp += "</html>";
		
		try {
			sampleDAO.insertCarRequest(map);
			resultMap.put("success", 1);
			
			//send to send people //////////////////////////////////////////////////////////////////////
			sContents = "";
			sContents = sContentsTemp;
			
			sContents = sContents.replace("제목", sSendTitle);
			sContents = sContents.replace("업무분야1내용", sBusiness1);
			sContents = sContents.replace("업무분야2내용", sBusiness2);
			sContents = sContents.replace("요청내용내용", sRequestDetails);
			sContents = sContents.replace("방향내용", sTo);
		    
			Map<String, Object> requestMap = new HashMap<String,Object>();
			requestMap.put("g_member_name", map.get("g_member_name").toString());
			requestMap.put("g_team_db_name", map.get("g_team_db_name").toString());
			
			Map<String, Object> tempMap = sampleDAO.selectEmailForMember(requestMap);
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("pms.sjplab@gmail.com");  
			messageHelper.setTo(tempMap.get("email_addr").toString());
			messageHelper.setSubject(sSendTitle);
			messageHelper.setText(sContents, true);
			
			FileSystemResource res = new FileSystemResource(new File(logoPath));
			messageHelper.addInline("identifier1", res);
			
			mailSender.send(message);
			
			//send to receive team //////////////////////////////////////////////////////////////////////
			sContents = "";
			sContents = sContentsTemp;
			
			sContents = sContents.replace("제목", sReceiveTitle);
			sContents = sContents.replace("업무분야1내용", sBusiness1);
			sContents = sContents.replace("업무분야2내용", sBusiness2);
			sContents = sContents.replace("요청내용내용", sRequestDetails);
			sContents = sContents.replace("방향내용", sFrom);
			
			Map<String, Object> requestMap2 = new HashMap<String,Object>();
			requestMap2.put("crFormReceiveTeam", map.get("crcFormReceiveTeam").toString());
			
			List<Map<String,Object>> list = sampleDAO.selectEmailListForTeam(requestMap2);
			Map<String, Object> tempMap2 = new HashMap<String,Object>();
			
			MimeMessage message2 = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper2 = new MimeMessageHelper(message2, true, "UTF-8");
			messageHelper2.setFrom("pms.sjplab@gmail.com");
			messageHelper2.setSubject(sReceiveTitle);
			messageHelper2.setText(sContents, true);
			messageHelper2.addInline("identifier1", res);
			
			for(int i=0, size=list.size(); i<size; i++){
				tempMap2 = list.get(i);
				if(i == 0){
					messageHelper2.setTo(tempMap2.get("email_addr").toString());
				}else if(i == 1){
					messageHelper2.setCc(tempMap2.get("email_addr").toString());
				}else{
					messageHelper2.addCc(tempMap2.get("email_addr").toString());
				}
				tempMap2.clear();
			}
			mailSender.send(message2);
			
			
		}
		catch(Exception e){
			log.debug("===============          insertCarRequest fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> insertNormalRequest(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		String sReceiveTitle = "[수신] 일반업무요청";
		String sSendTitle    = "[발신] 일반업무요청";
		String sBusiness1 = map.get("crnFormBusiness1").toString();
		String sBusiness2 = map.get("crnFormBusiness2").toString();
		String sRequestDetails = map.get("crnFormRequestDetails").toString(); 
	    String sContents = "";
	    String sContentsTemp = "";
	    String sFrom = map.get("g_team_db_name").toString() + " " + map.get("g_member_name").toString() + "으로부터 업무요청을 수신하였습니다.";
	    String sTo = "";	
	    String sCrnFormReceiveTeam = map.get("crnFormReceiveTeam").toString();
	    String sCrnFormReceiver = map.get("crnFormReceiver").toString();
	    int isSendTeam = 0;
	    if(sCrnFormReceiveTeam.equals("관리본부") || sCrnFormReceiveTeam.equals("PM팀") ){
	    	isSendTeam = 1;
	    	sTo = sCrnFormReceiveTeam + "에 업무요청을 요청하였습니다.";
	    }else{
	    	sTo = sCrnFormReceiveTeam+" "+sCrnFormReceiver+"에 업무요청을 요청하였습니다.";
	    }
	    
	    sContentsTemp += "<html>";
		sContentsTemp += "<head>";
		sContentsTemp += "    <title>Welcome to SJPLab</title>";
		sContentsTemp += "</head>";
		sContentsTemp += "<body>";
		sContentsTemp += "    <h1>제목</h1>";
		sContentsTemp += "    <table cellspacing='0' style='border: 2px dashed #FB4314; width: 1000px; height: 500px;'>";
		sContentsTemp += "        <tr style='background-color: #e0e0e0;'>";
		sContentsTemp += "            <td align='center'><img src='cid:identifier1'></td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "        <tr>";
		sContentsTemp += "            <th align='center'>업무분야1:</th><td>업무분야1내용</td>";
		sContentsTemp += "        <tr>";
		sContentsTemp += "            <th align='center'>업무분야2:</th><td>업무분야2내용</td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "        <tr>";
		sContentsTemp += "            <th align='center'>요청내용:</th><td>요청내용내용</td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "        <tr>";
		sContentsTemp += "            <th align='center'>DIRECTION:</th><td>방향내용</td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "        <tr style='background-color: #e0e0e0;'>";
		sContentsTemp += "            <th>TOOWIDE:</th><td><a href='http://112.221.229.148:8080'>TOOWIDE Project Management System</a></td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "    </table>";
		sContentsTemp += "</body>";
		sContentsTemp += "</html>";
		
		try {
			sampleDAO.insertNormalRequest(map);
			resultMap.put("success", 1);
			
			//send to send people //////////////////////////////////////////////////////////////////////
			sContents = "";
			sContents = sContentsTemp;
			
			sContents = sContents.replace("제목", sSendTitle);
			sContents = sContents.replace("업무분야1내용", sBusiness1);
			sContents = sContents.replace("업무분야2내용", sBusiness2);
			sContents = sContents.replace("요청내용내용", sRequestDetails);
			sContents = sContents.replace("방향내용", sTo);
		    
			Map<String, Object> requestMap = new HashMap<String,Object>();
			requestMap.put("g_member_name", map.get("g_member_name").toString());
			requestMap.put("g_team_db_name", map.get("g_team_db_name").toString());
			
			Map<String, Object> tempMap = sampleDAO.selectEmailForMember(requestMap);
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("pms.sjplab@gmail.com");  
			messageHelper.setTo(tempMap.get("email_addr").toString());
			messageHelper.setSubject(sSendTitle);
			messageHelper.setText(sContents, true);
			
			FileSystemResource res = new FileSystemResource(new File(logoPath));
			messageHelper.addInline("identifier1", res);
			
			mailSender.send(message);
			
			//send to receive team or receive people //////////////////////////////////////////////////////////////////////
			sContents = "";
			sContents = sContentsTemp;
			
			sContents = sContents.replace("제목", sReceiveTitle);
			sContents = sContents.replace("업무분야1내용", sBusiness1);
			sContents = sContents.replace("업무분야2내용", sBusiness2);
			sContents = sContents.replace("요청내용내용", sRequestDetails);
			sContents = sContents.replace("방향내용", sFrom);
			
			if(isSendTeam == 1){
				Map<String, Object> requestMap2 = new HashMap<String,Object>();
				requestMap2.put("crFormReceiveTeam", sCrnFormReceiveTeam);
				
				List<Map<String,Object>> list = sampleDAO.selectEmailListForTeam(requestMap2);
				Map<String, Object> tempMap2 = new HashMap<String,Object>();
				
				MimeMessage message2 = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper2 = new MimeMessageHelper(message2, true, "UTF-8");
				messageHelper2.setFrom("pms.sjplab@gmail.com");
				messageHelper2.setSubject(sReceiveTitle);
				messageHelper2.setText(sContents, true);
				messageHelper2.addInline("identifier1", res);
				
				for(int i=0, size=list.size(); i<size; i++){
					tempMap2 = list.get(i);
					if(i == 0){
						messageHelper2.setTo(tempMap2.get("email_addr").toString());
					}else if(i == 1){
						messageHelper2.setCc(tempMap2.get("email_addr").toString());
					}else{
						messageHelper2.addCc(tempMap2.get("email_addr").toString());
					}
					tempMap2.clear();
				}
				mailSender.send(message2);
			}else{
				
				Map<String, Object> requestMap2 = new HashMap<String,Object>();
				log.debug("=== insertCarRequest sCrnFormReceiver     ======="+sCrnFormReceiver+ " ");
				log.debug("=== insertCarRequest sCrnFormReceiveTeam  ======="+sCrnFormReceiveTeam+ " ");
				requestMap2.put("g_member_name", sCrnFormReceiver);
				requestMap2.put("g_team_db_name", sCrnFormReceiveTeam);
				
				Map<String, Object> tempMap2 = sampleDAO.selectEmailForMember(requestMap2);
				
				MimeMessage message2 = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper2 = new MimeMessageHelper(message2, true, "UTF-8");
				messageHelper2.setFrom("pms.sjplab@gmail.com");
				messageHelper2.setSubject(sReceiveTitle);
				messageHelper2.setText(sContents, true);
				messageHelper2.addInline("identifier1", res);
				
				messageHelper2.setTo(tempMap2.get("email_addr").toString());
				mailSender.send(message2);
			}
			
		}
		catch(Exception e){
			log.debug("===============          insertNormalRequest fail     =======" + e.getMessage());
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
	public Map<String, Object> insertBudgetInternal(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			Map<String, Object> requestMap = new HashMap<String,Object>();
			requestMap.put("g_project_number", map.get("g_project_number").toString());
			requestMap.put("g_internalTeamCount", map.get("g_internalTeamCount").toString());
			requestMap.put("WRITER", map.get("WRITER").toString());
			
			int internalTeamCount = 0;
			internalTeamCount = Integer.parseInt(map.get("g_internalTeamCount").toString());
			for(int i=0; i<internalTeamCount; i++){
				requestMap.put("INTERNAL_TEAM_NAME", map.get("cbFormInternalTeam_"+i).toString());
				log.debug("===============          cbFormInternalTeam_ i     =======" + i + "  **** " + map.get("cbFormInternalTeam_"+i).toString());
				requestMap.put("INTERNAL_TEAM_COST", map.get("cbFormInternalTeamInput_"+i).toString());
				log.debug("===============          cbFormInternalTeamInput_ i     =======" + i + "  **** " + map.get("cbFormInternalTeamInput_"+i).toString());
				sampleDAO.insertBudgetInternal(requestMap);
			}
			
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          insertBudgetInternal fail     =======" + e.getMessage());
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
	public Map<String, Object> insertCostDetailPerRequest(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			sampleDAO.insertCostDetailPerRequest(map);
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          insertCostDetailPerRequest fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> insertCostDetailPerRequestForCar(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			sampleDAO.insertCostDetailPerRequestForCar(map);
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          insertCostDetailPerRequestForCar fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> insertCostDetailPerProject(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			sampleDAO.insertCostDetailPerProject(map);
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          insertCostDetailPerProject fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> updateCostDetailPerProject(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			sampleDAO.updateCostDetailPerProject(map);
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          updateCostDetailPerProject fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> updateCostPerRequestNumber(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			sampleDAO.updateCostPerRequestNumber(map);
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          updateCostPerRequestNumber fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> updateRequestPerRequestNumber(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		String sTitle = "["+map.get("g_request_status").toString()+"] "+map.get("FormBusiness1").toString()+" 업무요청" ;
		String sBusiness1 = map.get("FormBusiness1").toString();
		String sBusiness2 = map.get("FormBusiness2").toString();
		String sFormRequestTeam = map.get("FormRequestTeam").toString();
		String sFormRequester = map.get("FormRequester").toString();
		String sFormReceiveTeam = map.get("FormReceiveTeam").toString();
		String sFormReceiver = map.get("FormReceiver").toString();
		String sRequestDetails = map.get("FormRequestDetails").toString();
		String sFormApproveDetails = map.get("FormApproveDetails").toString();
		String sFormNotAllowDetails = map.get("FormNotAllowDetails").toString();
	    String sContents = "";
	    String sContentsTemp = "";
	    
	    //요청 업무분야:기타 일때만 팀전송 없음 
	    
	    sContentsTemp += "<html>";
		sContentsTemp += "<head>";
		sContentsTemp += "    <title>Welcome to SJPLab</title>";
		sContentsTemp += "</head>";
		sContentsTemp += "<body>";
		sContentsTemp += "    <h1>제목</h1>";
		sContentsTemp += "    <table cellspacing='0' style='border: 2px dashed #FB4314; width: 1000px; height: 500px;'>";
		sContentsTemp += "        <tr style='background-color: #e0e0e0;'>";
		sContentsTemp += "            <td align='center'><img src='cid:identifier1'></td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "        <tr>";
		sContentsTemp += "            <th align='center'>업무분야1:</th><td>업무분야1내용</td>";
		sContentsTemp += "        <tr>";
		sContentsTemp += "            <th align='center'>업무분야2:</th><td>업무분야2내용</td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "        <tr>";
		sContentsTemp += "            <th align='center'>요청팀:</th><td>요청팀내용</td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "        <tr>";
		sContentsTemp += "            <th align='center'>요청자:</th><td>요청자내용</td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "        <tr>";
		sContentsTemp += "            <th align='center'>확인팀:</th><td>확인팀내용</td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "        <tr>";
		sContentsTemp += "            <th align='center'>확인자:</th><td>확인자내용</td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "        <tr>";
		sContentsTemp += "            <th align='center'>요청내용:</th><td>요청내용내용</td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "        <tr>";
		sContentsTemp += "            <th align='center'>후속내용:</th><td>후속내용내용</td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "        <tr>";
		sContentsTemp += "            <th align='center'>반려내용:</th><td>반려내용내용</td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "        <tr style='background-color: #e0e0e0;'>";
		sContentsTemp += "            <th>TOOWIDE:</th><td><a href='http://112.221.229.148:8080'>TOOWIDE Project Management System</a></td>";
		sContentsTemp += "        </tr>";
		sContentsTemp += "    </table>";
		sContentsTemp += "</body>";
		sContentsTemp += "</html>";
		
		try {
			sampleDAO.updateRequestPerRequestNumber(map);
			resultMap.put("success", 1);
			
			sContents = "";
			sContents = sContentsTemp;
			
			sContents = sContents.replace("제목", sTitle);
			sContents = sContents.replace("업무분야1내용", sBusiness1);
			sContents = sContents.replace("업무분야2내용", sBusiness2);
			sContents = sContents.replace("요청팀내용", sFormRequestTeam);
			sContents = sContents.replace("요청자내용", sFormRequester);
			sContents = sContents.replace("확인팀내용", sFormReceiveTeam);
			sContents = sContents.replace("확인자내용", sFormReceiver);
			sContents = sContents.replace("요청내용내용", sRequestDetails);
			sContents = sContents.replace("후속내용내용", sFormApproveDetails);
			sContents = sContents.replace("반려내용내용", sFormNotAllowDetails);
			
			Map<String, Object> requestMap = new HashMap<String,Object>();
			requestMap.put("g_member_name", sFormRequester);
			requestMap.put("g_team_db_name", sFormRequestTeam);
			
			Map<String, Object> tempMap = sampleDAO.selectEmailForMember(requestMap);
			
			MimeMessage message2 = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper2 = new MimeMessageHelper(message2, true, "UTF-8");
			messageHelper2.setFrom("pms.sjplab@gmail.com");
			messageHelper2.setSubject(sTitle);
			messageHelper2.setText(sContents, true);
			FileSystemResource res = new FileSystemResource(new File(logoPath));
			messageHelper2.addInline("identifier1", res);
			
			messageHelper2.setTo(tempMap.get("email_addr").toString());
			
		    if(sBusiness1.equals("기타")){
		    	Map<String, Object> requestMap2 = new HashMap<String,Object>();
		    	requestMap2.put("g_member_name", sFormReceiver);
		    	requestMap2.put("g_team_db_name", sFormReceiveTeam);
				
				Map<String, Object> tempMap2 = sampleDAO.selectEmailForMember(requestMap2);
				messageHelper2.setCc(tempMap2.get("email_addr").toString());
				
		    }else{
		    	Map<String, Object> requestMap2 = new HashMap<String,Object>();
				requestMap2.put("crFormReceiveTeam", sFormReceiveTeam);
				
				List<Map<String,Object>> list = sampleDAO.selectEmailListForTeam(requestMap2);
				Map<String, Object> tempMap2 = new HashMap<String,Object>();
				
				for(int i=0, size=list.size(); i<size; i++){
					tempMap2 = list.get(i);
					if(i == 0){
						messageHelper2.setCc(tempMap2.get("email_addr").toString());
					}else{
						messageHelper2.addCc(tempMap2.get("email_addr").toString());
					}
					tempMap2.clear();
				}
		    }
			
			mailSender.send(message2);
			
		}
		catch(Exception e){
			log.debug("===============          updateRequestPerRequestNumber fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectCostDetailPerProject(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			Map<String, Object> tempMap = sampleDAO.selectCostDetailPerProject(map);
			resultMap.put("isData", 1);
			if (tempMap == null){
				resultMap.put("isData", 0);
			}
			resultMap.put("map", tempMap);
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          selectCostDetailPerProject fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectCostDetailPerRequestPRGNumber(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			Map<String, Object> tempMap = sampleDAO.selectCostDetailPerRequestPRGNumber(map);
			resultMap.put("isData", 1);
			if (tempMap == null){
				resultMap.put("isData", 0);
			}
			resultMap.put("map", tempMap);
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          selectCostDetailPerProject fail     =======" + e.getMessage());
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
	public Map<String, Object> selectBudgetInternal(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
	Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			List<Map<String,Object>> firstList = sampleDAO.selectBudgetInternal(map);
			resultMap.put("list", firstList);
			resultMap.put("list_count", firstList.size());
			
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          selectBudgetInternal fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> deleteBudgetInternal(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
	Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			sampleDAO.deleteBudgetInternal(map);
			
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          deleteBudgetInternal fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectBudgetStatus(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			List<Map<String,Object>> firstList = sampleDAO.selectClassCostPerProject(map);
			resultMap.put("firstList", firstList);
			resultMap.put("firstListCount", firstList.size());
			
			List<Map<String,Object>> secondList = sampleDAO.selectOutsourcingCostPerProject(map);
			resultMap.put("secondList", secondList);
			resultMap.put("secondListCount", secondList.size());
			
			List<Map<String,Object>> thirdList = sampleDAO.selectProgressCostPerProject(map);
			resultMap.put("thirdList", thirdList);
			resultMap.put("thirdListCount", thirdList.size());
			
			List<Map<String,Object>> fourthList = sampleDAO.selectInternalCostPerProject(map);
			resultMap.put("fourthList", fourthList);
			resultMap.put("fourthListCount", fourthList.size());
			
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          selectBudgetStatus fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectMaxRequestNumber(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			Map<String, Object> tempMap = sampleDAO.selectMaxRequestNumber(map);
			resultMap.put("g_maxRequestNumber", tempMap.get("g_maxRequestNumber"));
			
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          selectMaxRequestNumber fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectCostNumber(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			Map<String, Object> tempMap = sampleDAO.selectCostNumber(map);
			resultMap.put("g_current_cost_number", tempMap.get("g_current_cost_number"));
			
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          selectCostNumber fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectRequestNumber(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			Map<String, Object> tempMap = sampleDAO.selectRequestNumber(map);
			resultMap.put("g_current_request_num", tempMap.get("g_current_request_num"));
			
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          selectRequestNumber fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectMaxCostNumber(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			Map<String, Object> tempMap = sampleDAO.selectMaxCostNumber(map);
			resultMap.put("maxCostNumber", tempMap.get("maxCostNumber"));
			
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          selectMaxCostNumber fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectRequestPerRequestNumber(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			Map<String, Object> tempMap = sampleDAO.selectRequestPerRequestNumber(map);
			resultMap.put("isData", 1);
			if (tempMap == null){
				resultMap.put("isData", 0);
			}
			resultMap.put("map", tempMap);
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          selectRequestPerRequestNumber fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectReceiveRequest(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			List<Map<String,Object>> firstList = sampleDAO.selectReceiveRequest(map);
			resultMap.put("firstList", firstList);
			resultMap.put("firstListCount", firstList.size());
			
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          selectReceiveRequest fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectTeamReceiveRequest(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			List<Map<String,Object>> firstList = sampleDAO.selectTeamReceiveRequest(map);
			resultMap.put("firstList", firstList);
			resultMap.put("firstListCount", firstList.size());
			
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          selectTeamReceiveRequest fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectRequest(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			List<Map<String,Object>> firstList = sampleDAO.selectRequest(map);
			resultMap.put("firstList", firstList);
			resultMap.put("firstListCount", firstList.size());
			
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          selectRequest fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectCostPerProject(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			List<Map<String,Object>> firstList = sampleDAO.selectCostPerProject(map);
			resultMap.put("firstList", firstList);
			resultMap.put("firstListCount", firstList.size());
			
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          selectCostPerProject fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> searchCostByApproval(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			List<Map<String,Object>> firstList = sampleDAO.searchCostByApproval(map);
			resultMap.put("firstList", firstList);
			resultMap.put("firstListCount", firstList.size());
			
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          searchCostByApproval fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> searchNoInputData(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			List<Map<String,Object>> firstList = sampleDAO.searchNoInputData(map);
			resultMap.put("firstList", firstList);
			resultMap.put("firstListCount", firstList.size());
			
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          searchNoInputData fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> getProjectNameList(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			List<Map<String,Object>> firstList = sampleDAO.getProjectNameList(map);
			resultMap.put("firstList", firstList);
			resultMap.put("success", 1);
			
		}
		catch(Exception e){
			log.debug("===============          getProjectNameList fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectInternalClassification(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			List<Map<String,Object>> firstList = sampleDAO.selectInternalClassification(map);
			resultMap.put("firstList", firstList);
			resultMap.put("firstListCount", firstList.size());
			
			resultMap.put("success", 1);
			
		}
		catch(Exception e){
			log.debug("===============          getProjectNameList fail     =======" + e.getMessage());
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
	public Map<String, Object> insertCardData(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			
			//save excel file
			String saveFileFullPath = fileUtils.saveImportExcelFile(map, request);;
			
			//read excel file
			Map<Integer, List<String>> data = excelPOIHelper.readExcel(saveFileFullPath);
			map.put("idMap", data);
			//insert db
			sampleDAO.insertCardData(map);
			//delete excel file
//			fileUtils.deleteImportExcelFile(saveFileFullPath);
			
			resultMap.put("success", 1);
		
		}
		catch(Exception e){
			log.debug("===============          insertCardData fail     =======" + e.getMessage());
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
	public Map<String, Object> selectCostFiles(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			List<Map<String,Object>> firstList = sampleDAO.selectCostFiles(map);
			
			resultMap.put("firstList", firstList);
			resultMap.put("firstListCount", firstList.size());
			
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          selectCostFiles fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectRequestFiles(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			List<Map<String,Object>> firstList = sampleDAO.selectRequestFiles(map);
			
			resultMap.put("firstList", firstList);
			resultMap.put("firstListCount", firstList.size());
			
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          selectRequestFiles fail     =======" + e.getMessage());
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
	public Map<String, Object> deleteCostFileUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			sampleDAO.deleteCostFileUpdate(map);
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          deleteCostFileUpdate fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> deleteRequestFileUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
			sampleDAO.deleteRequestFileUpdate(map);
			resultMap.put("success", 1);
		}
		catch(Exception e){
			log.debug("===============          deleteRequestFileUpdate fail     =======" + e.getMessage());
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
	public Map<String, Object> insertCostFile(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			//insert file
			List<Map<String,Object>> list = fileUtils.parseCostInsertFileInfo(map, request);
			for(int i=0, size=list.size(); i<size; i++){
				
				sampleDAO.insertFileCostNew(list.get(i));
			}
			
			resultMap.put("success", 1);
		
		}
		catch(Exception e){
			log.debug("===============          insertCostFile fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
			
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> insertRequestFile(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			//insert file
			List<Map<String,Object>> list = fileUtils.parseRequestInsertFileInfo(map, request);
			for(int i=0, size=list.size(); i<size; i++){
				
				sampleDAO.insertFileRequest(list.get(i));
			}
			
			resultMap.put("success", 1);
		
		}
		catch(Exception e){
			log.debug("===============          insertRequestFile fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
			
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> updateCostFile(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
			//insert file
			List<Map<String,Object>> list = fileUtils.parseCostInsertFileInfo(map, request);
			for(int i=0, size=list.size(); i<size; i++){
				
				sampleDAO.insertFileCost(list.get(i));
			}
			
			resultMap.put("success", 1);
		
		}
		catch(Exception e){
			log.debug("===============          updateCostFile fail     =======" + e.getMessage());
			resultMap.put("success", 0);
			resultMap.put("fail_desc", e.getMessage());
			
		}
		
		return resultMap;
	}
	
	@Override
	public Map<String, Object> insertProjectFile(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String,Object>();
		
		try {
				
//			MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
//			String value = multipartHttpServletRequest.getParameter("PRJ_NAME");
			
//			//select project name (from project name)
			Map<String, Object> requestMap = new HashMap<String,Object>();
			requestMap.put("PRJ_NAME", map.get("PRJ_NAME").toString());
//			requestMap.put("PRJ_NAME", value);
			
			Map<String, Object> tempMap = sampleDAO.selectProjectNumber(requestMap);
			
			if (tempMap == null) { //login fail
				log.debug("===============          select projectNumber fail     =======");
			}else{
				log.debug("===============          projectNumber === " + tempMap.get("PRJ_NUM"));
			}
//			value = multipartHttpServletRequest.getParameter("WRITER");
			tempMap.put("WRITER", map.get("WRITER"));
//			tempMap.put("WRITER", value);
			
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
