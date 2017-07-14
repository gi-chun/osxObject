package com.sjplab.innerPrj.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sjplab.innerPrj.common.dao.AbstractDAO;

@Repository("sampleDAO")
public class SampleDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String, Object> login(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("sample.login", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMaxRequestNumber(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("sample.selectMaxRequestNumber", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMaxCostNumber(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("sample.selectMaxCostNumber", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectCostNumber(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("sample.selectCostNumber", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectRequestNumber(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("sample.selectRequestNumber", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectClassCostPerProject(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectClassCostPerProject", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOutsourcingCostPerProject(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("sample.selectOutsourcingCostPerProject", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProgressCostPerProject(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("sample.selectProgressCostPerProject", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectInternalCostPerProject(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("sample.selectInternalCostPerProject", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectCostDetailPerProject(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("sample.selectCostDetailPerProject", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectEmailForMember(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("sample.selectEmailForMember", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectEmailListForTeam(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("sample.selectEmailListForTeam", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectCostDetailPerRequestPRGNumber(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("sample.selectCostDetailPerRequestPRGNumber", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCostPerProject(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectCostPerProject", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectRequestPerRequestNumber(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("sample.selectRequestPerRequestNumber", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReceiveRequest(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectReceiveRequest", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTeamReceiveRequest(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectTeamReceiveRequest", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRequest(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectRequest", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchCostByApproval(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.searchCostByApproval", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchNoInputData(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.searchNoInputData", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectInternalClassification(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectInternalClassification", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getProjectNameList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.getProjectNameList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProjectList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectProjectList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPerformanceFirstTotal(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectPerformanceFirstTotal", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPerformanceSecondTotal(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectPerformanceSecondTotal", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPerformanceThirdTotal(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectPerformanceThirdTotal", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPerformanceFirst(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectPerformanceFirst", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPerformanceSecond(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectPerformanceSecond", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPerformanceThird(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectPerformanceThird", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectMemberList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMembersPerTeam(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectMembersPerTeam", map);
	}
	
	public void deleteMember(Map<String, Object> map) throws Exception{
		delete("sample.deleteMember", map);
	}
	
	public void insertMember(Map<String, Object> map) throws Exception{
		insert("sample.insertMember", map);
	}
	
	public void insertCardData(Map<String, Object> map) throws Exception{
		insert("sample.insertCardData", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTeamNames(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectTeamNames", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBudgetInternal(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectBudgetInternal", map);
	}
	
	public void deleteBudgetInternal(Map<String, Object> map) throws Exception{
		delete("sample.deleteBudgetInternal", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTeamList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectTeamList", map);
	}
	
	public void deleteTeam(Map<String, Object> map) throws Exception{
		delete("sample.deleteTeam", map);
	}
	
	public void insertTeam(Map<String, Object> map) throws Exception{
		insert("sample.insertTeam", map);
	}
	
	public void insertBudgetInternal(Map<String, Object> map) throws Exception{
		insert("sample.insertBudgetInternal", map);
	}
	
	public void insertCostRequest(Map<String, Object> map) throws Exception{
		insert("sample.insertCostRequest", map);
	}
	
	public void insertCarRequest(Map<String, Object> map) throws Exception{
		insert("sample.insertCarRequest", map);
	}
	
	public void insertNormalRequest(Map<String, Object> map) throws Exception{
		insert("sample.insertNormalRequest", map);
	}
	
	public void insertBudget(Map<String, Object> map) throws Exception{
		insert("sample.insertBudget", map);
	}
	
	public void updateBudget(Map<String, Object> map) throws Exception{
		update("sample.updateBudget", map);
	}
	
	public void updateRequestPerRequestNumber(Map<String, Object> map) throws Exception{
		update("sample.updateRequestPerRequestNumber", map);
	}
	
	public void updateCostPerRequestNumber(Map<String, Object> map) throws Exception{
		update("sample.updateCostPerRequestNumber", map);
	}
	
	public void updateCostDetailPerProject(Map<String, Object> map) throws Exception{
		update("sample.updateCostDetailPerProject", map);
	}
	
	public void insertCostDetailPerProject(Map<String, Object> map) throws Exception{
		insert("sample.insertCostDetailPerProject", map);
	}
	
	public void insertCostDetailPerRequest(Map<String, Object> map) throws Exception{
		insert("sample.insertCostDetailPerRequest", map);
	}
	
	public void insertCostDetailPerRequestForCar(Map<String, Object> map) throws Exception{
		insert("sample.insertCostDetailPerRequestForCar", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBudget(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("sample.selectBudget", map);
	}
	
	public void insertProject(Map<String, Object> map) throws Exception{
		insert("sample.insertProject", map);
	}
	
	public void updateProject(Map<String, Object> map) throws Exception{
		insert("sample.updateProject", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectProject(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("sample.selectProject", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProjectFiles(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectProjectFiles", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCostFiles(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectCostFiles", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRequestFiles(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectRequestFiles", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectProjectNumber(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("sample.selectProjectNumber", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("sample.selectBoardList", map);
	}

	public void insertBoard(Map<String, Object> map) throws Exception{
		insert("sample.insertBoard", map);
	}

	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("sample.updateHitCnt", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("sample.selectBoardDetail", map);
	}

	public void updateBoard(Map<String, Object> map) throws Exception{
		update("sample.updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) throws Exception{
		update("sample.deleteBoard", map);
	}

	public void insertFile(Map<String, Object> map) throws Exception{
		insert("sample.insertFile", map);
	}

	public void insertFileProject(Map<String, Object> map) throws Exception{
		insert("sample.insertFileProject", map);
	}
	
	public void insertFileCost(Map<String, Object> map) throws Exception{
		insert("sample.insertFileCost", map);
	}
	
	public void insertFileRequest(Map<String, Object> map) throws Exception{
		insert("sample.insertFileRequest", map);
	}
	
	public void insertFileCostNew(Map<String, Object> map) throws Exception{
		insert("sample.insertFileCostNew", map);
	}
	
	public void deleteFileUpdate(Map<String, Object> map) throws Exception{
		update("sample.deleteFileUpdate", map);
	}
	
	public void deleteCostFileUpdate(Map<String, Object> map) throws Exception{
		update("sample.deleteCostFileUpdate", map);
	}
	
	public void deleteRequestFileUpdate(Map<String, Object> map) throws Exception{
		update("sample.deleteRequestFileUpdate", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("sample.selectFileList", map);
	}

	public void deleteFileList(Map<String, Object> map) throws Exception{
		update("sample.deleteFileList", map);
	}

	public void updateFile(Map<String, Object> map) throws Exception{
		update("sample.updateFile", map);
	}

}
