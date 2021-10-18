package com.lollol23.memo.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	
	private final String FILE_UPLOAD_PATH = "C:\\Users\\lis\\Desktop\\Spring\\SpringTest\\upload\\img/";
	public String saveFile(int userId, MultipartFile file) {
		//파일경로
		//1.올린사람의 id로 구분 저장
		//2.올린시간을 기준으로 구분
		//1970년 1월1일 기준으로 몇 밀리초가 지났는지
		
		Logger logger = LoggerFactory.getLogger(this.getClass());
		
		String directoryName = 	userId + "_" + System.currentTimeMillis() + "/";
		
		String filePath = FILE_UPLOAD_PATH + directoryName; 
		//디렉토리 생성
		File directory = new File(filePath);
		if(directory.mkdir() == false) {
			return null;
		}
		
		//byte[]
		try {
			byte[] bytes = file.getBytes();
			//파일경로
			Path path = Paths.get(filePath + file.getOriginalFilename());
			//파일저장
			Files.write(path, bytes);
			
		} catch (IOException e) {
			logger.error("[FileManagerService] 파일 생성 실패");
			e.printStackTrace();
			return null;
		}
		
		//파일을 접근할수 있는경로
		
		return "/images/" + directoryName + file.getOriginalFilename();
	}
}
