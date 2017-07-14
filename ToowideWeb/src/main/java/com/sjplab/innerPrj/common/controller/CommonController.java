package com.sjplab.innerPrj.common.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sjplab.innerPrj.common.common.CommandMap;
import com.sjplab.innerPrj.common.service.CommonService;

@Controller
public class CommonController {
	
	private static final String filePath = "/Users/gclee/work_web/files/";
	private static final String filePathProject = "Project/";
	private static final String filePathRequest = "Request/";
	private static final String filePathCost = "Cost/";
	private static final String filePathDiv = "/";

//	private static final String filePath = "C:\\PMS\\file\\";
//	private static final String filePathProject = "Project\\";
//	private static final String filePathRequest = "Request\\";
//	private static final String filePathCost = "Cost\\";
//	private static final String filePathDiv = "\\";
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	@RequestMapping(value="/common/downloadProjectFile.do")
	public void downloadProjectFile(CommandMap commandMap, HttpServletResponse response) throws Exception{
		String storage_file_name = (String)commandMap.get("storage_file_name");
		String folder_name = (String)commandMap.get("folder_name");
		
		String realFileFullPath = filePath + folder_name + filePathDiv + filePathProject + storage_file_name;
		//C:\\dev\\file\\
		byte fileByte[] = FileUtils.readFileToByteArray(new File(realFileFullPath));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(storage_file_name,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	
	@RequestMapping(value="/common/downloadCostFile.do")
	public void downloadCostFile(CommandMap commandMap, HttpServletResponse response) throws Exception{
		String storage_file_name = (String)commandMap.get("storage_file_name");
		String folder_name = (String)commandMap.get("folder_name");
		
		String realFileFullPath = filePath + folder_name + filePathDiv + filePathCost + storage_file_name;
		//C:\\dev\\file\\
		byte fileByte[] = FileUtils.readFileToByteArray(new File(realFileFullPath));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(storage_file_name,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	
	@RequestMapping(value="/common/downloadRequestFile.do")
	public void downloadRequesttFile(CommandMap commandMap, HttpServletResponse response) throws Exception{
		String storage_file_name = (String)commandMap.get("storage_file_name");
		String folder_name = (String)commandMap.get("folder_name");
		
		String realFileFullPath = filePath + folder_name + filePathDiv + filePathRequest + storage_file_name;
		//C:\\dev\\file\\
		byte fileByte[] = FileUtils.readFileToByteArray(new File(realFileFullPath));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(storage_file_name,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	
	@RequestMapping(value="/common/downloadFile.do")
	public void downloadFile(CommandMap commandMap, HttpServletResponse response) throws Exception{
		Map<String,Object> map = commonService.selectFileInfo(commandMap.getMap());
		String storedFileName = (String)map.get("STORAGE_FILE_NAME");
		String originalFileName = (String)map.get("ORIGINAL_FILE_NAME");
		
		//C:\\dev\\file\\
		byte fileByte[] = FileUtils.readFileToByteArray(new File("/Users/gclee/work_web/files/"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	
	
}
