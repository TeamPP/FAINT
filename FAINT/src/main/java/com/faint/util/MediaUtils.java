package com.faint.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {
	private static Map<String, MediaType> mediaMap;
	static{
		
		mediaMap = new HashMap<String, MediaType>();	
		//이미지
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
		//비디오
	}
	public static MediaType getMediaType(String type){
		
		return mediaMap.get(type.toUpperCase());
	}
}



