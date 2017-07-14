package com.sjplab.innerPrj.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface SampleService {
	
	void logout(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	Map<String, Object> getSession(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> setSessionGoCommand(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> setSession(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> login(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	Map<String, Object> selectMembersPerTeam(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectMemberList(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> deleteMember(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectTeamList(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectTeamNames(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> deleteTeam(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> insertTeam(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> insertCostRequest(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> insertCarRequest(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> insertNormalRequest(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectRequestNumber(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> insertBudget(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> insertBudgetInternal(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> deleteBudgetInternal(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> insertCostDetailPerRequest(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> insertCostDetailPerRequestForCar(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> insertCostDetailPerProject(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> updateCostDetailPerProject(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> updateRequestPerRequestNumber(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> updateCostPerRequestNumber(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> updateBudget(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectBudget(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectBudgetInternal(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectBudgetStatus(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectCostDetailPerProject(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectCostDetailPerRequestPRGNumber(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> searchCostByApproval(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> searchNoInputData(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectCostPerProject(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectRequestPerRequestNumber(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectReceiveRequest(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectTeamReceiveRequest(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectCostNumber(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectMaxRequestNumber(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectMaxCostNumber(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectRequest(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> insertCardData(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> insertProject(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> updateProject(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectInternalClassification(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> getProjectNameList(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectProject(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectCostFiles(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectRequestFiles(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectProjectFiles(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> insertProjectFile(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> updateProjectFile(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> insertCostFile(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> insertRequestFile(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> updateCostFile(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> deleteFileUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> deleteCostFileUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> deleteRequestFileUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectPerformance(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectProjectList(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectReportData(Map<String, Object> map, HttpServletRequest request) throws Exception ;

	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;

	void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception;
	
	void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void deleteBoard(Map<String, Object> map) throws Exception;

}
