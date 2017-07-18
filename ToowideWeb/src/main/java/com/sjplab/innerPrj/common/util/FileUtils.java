package com.sjplab.innerPrj.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	
	//private static final String filePath = "C:\\PMS\\file\\";
	
//	private static final String filePath = "/Users/gclee/work_web/files/";
//	private static final String filePathProject = "Project/";
//	private static final String filePathRequest = "Request/";
//	private static final String filePathCost = "Cost/";
//	private static final String filePathExcel = "Excel/";
//	private static final String filePathDiv = "/";

	private static final String filePath = "C:\\PMS\\file\\";
	private static final String filePathProject = "Project\\";
	private static final String filePathRequest = "Request\\";
	private static final String filePathCost = "Cost\\";
	private static final String filePathExcel = "Excel\\";
	private static final String filePathDiv = "\\";
	
	
public void deleteImportExcelFile(String deleteFullPathFile) throws Exception{
		
		File file = new File(deleteFullPathFile);
        
        if(file.exists() == true){
        	file.delete();
        }
	}

public String saveImportExcelFile(Map<String,Object> map, HttpServletRequest request) throws Exception{
	
	MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	
	MultipartFile multipartFile = null;
	String originalFileName = null;
	String originalFileExtension = null;
	String storedFileName = null;
	String stringTemp = null;
	String saveFullPath = null;
	
    Date date = new Date();
    String todayYYYYMMDD = new SimpleDateFormat("yyyy-MM").format(date);
    
    String realPath = filePath +  todayYYYYMMDD + filePathDiv + filePathExcel ;
    File file = new File(realPath);
    
    if(file.exists() == false){
    	file.mkdirs();
    }
    
    while(iterator.hasNext()){
    	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
    	if(multipartFile.isEmpty() == false){
    		originalFileName = multipartFile.getOriginalFilename();
    		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
    		stringTemp = CommonUtils.getRandomString();
    		stringTemp = stringTemp.substring(0, 15);
    		stringTemp = originalFileName + "_" + stringTemp;
    		storedFileName = stringTemp + originalFileExtension;
    		
    		saveFullPath = realPath + storedFileName;
    		file = new File(saveFullPath);
    		multipartFile.transferTo(file);
    		
    	}
    }
	return saveFullPath;
}

public List<Map<String,Object>> parseProjectInsertFileInfo(Map<String,Object> map, HttpServletRequest request) throws Exception{
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
    	
    	MultipartFile multipartFile = null;
    	String originalFileName = null;
    	String originalFileExtension = null;
    	String storedFileName = null;
    	String stringTemp = null;
    	
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null; 
        
        String projectNumber = String.valueOf(map.get("PRJ_NUM"));
        String WRITER = String.valueOf(map.get("WRITER"));
        
        Date date = new Date();
        String todayYYYYMMDD = new SimpleDateFormat("yyyy-MM").format(date);
        
        String realPath = filePath +  todayYYYYMMDD + filePathDiv + filePathProject ;
        File file = new File(realPath);
        
        if(file.exists() == false){
        	file.mkdirs();
        }
        
        while(iterator.hasNext()){
        	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
        	if(multipartFile.isEmpty() == false){
        		originalFileName = multipartFile.getOriginalFilename();
        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
        		stringTemp = CommonUtils.getRandomString();
        		stringTemp = stringTemp.substring(0, 15);
        		stringTemp = projectNumber + "_" + stringTemp;
        		storedFileName = stringTemp + originalFileExtension;
        		
        		file = new File(realPath + storedFileName);
        		multipartFile.transferTo(file);
        		
        		listMap = new HashMap<String,Object>();
        		listMap.put("PRJ_NUM", projectNumber);
        		listMap.put("ORIGINAL_FILE_NAME", originalFileName);
        		listMap.put("STORAGE_FILE_NAME", storedFileName);
        		listMap.put("FILE_SIZE", multipartFile.getSize());
        		listMap.put("WRITER", WRITER);
        		listMap.put("FOLDER_NAME", todayYYYYMMDD);
        		list.add(listMap);
        	}
        }
		return list;
	}

public List<Map<String,Object>> parseCostInsertFileInfo(Map<String,Object> map, HttpServletRequest request) throws Exception{
	
	MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	
	MultipartFile multipartFile = null;
	String originalFileName = null;
	String originalFileExtension = null;
	String storedFileName = null;
	String stringTemp = null;
	
	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
    Map<String, Object> listMap = null; 
    
    String costNumber = String.valueOf(map.get("COST_NUM"));
    String WRITER = String.valueOf(map.get("WRITER"));
    
    Date date = new Date();
    String todayYYYYMMDD = new SimpleDateFormat("yyyy-MM").format(date);
    
    String realPath = filePath +  todayYYYYMMDD + filePathDiv + filePathCost ;
    File file = new File(realPath);
    
    if(file.exists() == false){
    	file.mkdirs();
    }
    
    while(iterator.hasNext()){
    	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
    	if(multipartFile.isEmpty() == false){
    		originalFileName = multipartFile.getOriginalFilename();
    		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
    		stringTemp = CommonUtils.getRandomString();
    		stringTemp = stringTemp.substring(0, 15);
    		stringTemp = costNumber + "_" + stringTemp;
    		storedFileName = stringTemp + originalFileExtension;
    		
    		file = new File(realPath + storedFileName);
    		multipartFile.transferTo(file);
    		
    		listMap = new HashMap<String,Object>();
    		listMap.put("COST_NUM", costNumber);
    		listMap.put("ORIGINAL_FILE_NAME", originalFileName);
    		listMap.put("STORAGE_FILE_NAME", storedFileName);
    		listMap.put("FILE_SIZE", multipartFile.getSize());
    		listMap.put("WRITER", WRITER);
    		listMap.put("FOLDER_NAME", todayYYYYMMDD);
    		list.add(listMap);
    	}
    }
	return list;
}

public List<Map<String,Object>> parseRequestInsertFileInfo(Map<String,Object> map, HttpServletRequest request) throws Exception{
	
	MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
	
	MultipartFile multipartFile = null;
	String originalFileName = null;
	String originalFileExtension = null;
	String storedFileName = null;
	String stringTemp = null;
	
	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
    Map<String, Object> listMap = null; 
    
    String requestNumber = String.valueOf(map.get("REQUEST_NUM"));
    String WRITER = String.valueOf(map.get("WRITER"));
    
    Date date = new Date();
    String todayYYYYMMDD = new SimpleDateFormat("yyyy-MM").format(date);
    
    String realPath = filePath +  todayYYYYMMDD + filePathDiv + filePathRequest ;
    File file = new File(realPath);
    
    if(file.exists() == false){
    	file.mkdirs();
    }
    
    while(iterator.hasNext()){
    	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
    	if(multipartFile.isEmpty() == false){
    		originalFileName = multipartFile.getOriginalFilename();
    		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
    		stringTemp = CommonUtils.getRandomString();
    		stringTemp = stringTemp.substring(0, 15);
    		stringTemp = requestNumber + "_" + stringTemp;
    		storedFileName = stringTemp + originalFileExtension;
    		
    		file = new File(realPath + storedFileName);
    		multipartFile.transferTo(file);
    		
    		listMap = new HashMap<String,Object>();
    		listMap.put("REQUEST_NUM", requestNumber);
    		listMap.put("ORIGINAL_FILE_NAME", originalFileName);
    		listMap.put("STORAGE_FILE_NAME", storedFileName);
    		listMap.put("FILE_SIZE", multipartFile.getSize());
    		listMap.put("WRITER", WRITER);
    		listMap.put("FOLDER_NAME", todayYYYYMMDD);
    		list.add(listMap);
    	}
    }
	return list;
}



	public List<Map<String,Object>> parseInsertFileInfo(Map<String,Object> map, HttpServletRequest request) throws Exception{
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
    	
    	MultipartFile multipartFile = null;
    	String originalFileName = null;
    	String originalFileExtension = null;
    	String storedFileName = null;
    	
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null; 
        
        String boardIdx = (String)map.get("IDX");
        
        File file = new File(filePath);
        if(file.exists() == false){
        	file.mkdirs();
        }
        
        while(iterator.hasNext()){
        	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
        	if(multipartFile.isEmpty() == false){
        		originalFileName = multipartFile.getOriginalFilename();
        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
        		storedFileName = CommonUtils.getRandomString() + originalFileExtension;
        		
        		file = new File(filePath + storedFileName);
        		multipartFile.transferTo(file);
        		
        		listMap = new HashMap<String,Object>();
        		listMap.put("BOARD_IDX", boardIdx);
        		listMap.put("ORIGINAL_FILE_NAME", originalFileName);
        		listMap.put("STORAGE_FILE_NAME", storedFileName);
        		listMap.put("FILE_SIZE", multipartFile.getSize());
        		list.add(listMap);
        	}
        }
		return list;
	}

	public List<Map<String, Object>> parseUpdateFileInfo(Map<String, Object> map, HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
    	Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
    	
    	MultipartFile multipartFile = null;
    	String originalFileName = null;
    	String originalFileExtension = null;
    	String storedFileName = null;
    	
    	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        Map<String, Object> listMap = null; 
        
        String boardIdx = (String)map.get("IDX");
        String requestName = null;
        String idx = null;
        
        
        while(iterator.hasNext()){
        	multipartFile = multipartHttpServletRequest.getFile(iterator.next());
        	if(multipartFile.isEmpty() == false){
        		originalFileName = multipartFile.getOriginalFilename();
        		originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
        		storedFileName = CommonUtils.getRandomString() + originalFileExtension;
        		
        		multipartFile.transferTo(new File(filePath + storedFileName));
        		
        		listMap = new HashMap<String,Object>();
        		listMap.put("IS_NEW", "Y");
        		listMap.put("BOARD_IDX", boardIdx);
        		listMap.put("ORIGINAL_FILE_NAME", originalFileName);
        		listMap.put("STORAGE_FILE_NAME", storedFileName);
        		listMap.put("FILE_SIZE", multipartFile.getSize());
        		list.add(listMap);
        	}
        	else{
        		requestName = multipartFile.getName();
            	idx = "IDX_"+requestName.substring(requestName.indexOf("_")+1);
            	if(map.containsKey(idx) == true && map.get(idx) != null){
            		listMap = new HashMap<String,Object>();
            		listMap.put("IS_NEW", "N");
            		listMap.put("FILE_IDX", map.get(idx));
            		list.add(listMap);
            	}
        	}
        }
		return list;
	}
}
