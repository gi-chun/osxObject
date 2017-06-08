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
	
	Map<String, Object> selectMemberList(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> deleteMember(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> insertBudget(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> updateBudget(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectBudget(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> insertProject(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> updateProject(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectProject(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectProjectFiles(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> insertProjectFile(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> updateProjectFile(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> deleteFileUpdate(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectPerformance(Map<String, Object> map, HttpServletRequest request) throws Exception ;
	
	Map<String, Object> selectProjectList(Map<String, Object> map, HttpServletRequest request) throws Exception ;

	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;

	void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception;

	void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void deleteBoard(Map<String, Object> map) throws Exception;

}
