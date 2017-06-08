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
	
	public void deleteMember(Map<String, Object> map) throws Exception{
		insert("sample.deleteMember", map);
	}
	
	public void insertMember(Map<String, Object> map) throws Exception{
		insert("sample.insertMember", map);
	}
	
	public void insertBudget(Map<String, Object> map) throws Exception{
		insert("sample.insertBudget", map);
	}
	
	public void updateBudget(Map<String, Object> map) throws Exception{
		insert("sample.updateBudget", map);
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
	
	public void deleteFileUpdate(Map<String, Object> map) throws Exception{
		update("sample.deleteFileUpdate", map);
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
