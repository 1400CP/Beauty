package com.kh.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {
	
	// 원본 파일 전달 받아서 파일명 수정작업 후 수정된 파일을 반환시켜주는 메소드
	@Override
	public File rename(File originFile) {
		// 원본파일명("aaa.jpg")
		String originName = originFile.getName();
		
		// 수정파일명("2025022709461274152.jpg")
		//		파일업로드시간(년월일시분초) + 5자리 랜덤값(10000 ~ 99999) + "원본 파일 확장자"
		
		// 1. 파일 업로드시간(년월일시분초 형태) (String currentTime)
		String currentTime = new SimpleDateFormat("yyyyMMddmmss").format(new Date()); // "20250227102922"
		
		// 2. 5자리 랜덤값(int ranNum)
		int ranNum = (int)(Math.random() * 90000 + 10000); //23123
		
		// 3. 원본파일확장자 (String ext)
		// String ext = originName.substring(마지막.의 인덱스);
		String ext = originName.substring(originName.lastIndexOf(".")); // ".jpg"
		
		String changeName = currentTime + ranNum + ext;
		
		// 파일을 리턴하라?
		return new File(originFile.getParent(), changeName);
		// 파일을 저장하긴 하는데,
		// 원래 경로에다가 바뀐 이름으로 저장해라!
	}

}
