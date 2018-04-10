package com.faint.sns;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.faint.domain.UserVO;
import com.faint.util.MediaUtils;
import com.faint.util.S3Util;
import com.faint.util.UploadFileUtils;

@Controller
public class UploadController {
	
    S3Util s3 = new S3Util();
    String bucketName = "faint1122";
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	@RequestMapping(value ="/uploadAjax", method =RequestMethod.GET)
	public void uploadAjax(){
		
	}
	//서버에 파일 업로드
	@ResponseBody
	@RequestMapping(value ="/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file, HttpSession session) throws Exception{
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size : " +  file.getSize());
		logger.info("contentType : " + file.getContentType());
		UserVO vo = (UserVO)session.getAttribute("login");
		String userid = vo.getNickname();
		return new ResponseEntity<>(
				UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes(), userid),
				HttpStatus.CREATED);
	}
	
	//파일 표시
    @ResponseBody
    @RequestMapping("/displayFile")
    public ResponseEntity<byte[]> displayFile(String fileName)throws Exception{

        InputStream in = null;
        ResponseEntity<byte[]> entity = null;
        HttpURLConnection uCon = null;
        System.out.println("FILE NAME: " + fileName);

        //System.out.println("FileName : "+fileName);

        try{
            String formatName = fileName.substring(fileName.lastIndexOf(".")+1);

            MediaType mType = MediaUtils.getMediaType(formatName);
            HttpHeaders headers = new HttpHeaders();

            String inputDirectory = "faint1122";
            URL url;

            //in = new FileInputStream(uploadPath+fileName);
            //System.out.println("in : "+in);
//            if(mType != null){
//                headers.setContentType(mType);
//            }else{
//
//                fileName = fileName.substring(fileName.indexOf("_")+1);
//                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//                headers.add("Content-Disposition","attachment; filename=\""+new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");
//            }

            try {
                url = new URL(s3.getFileURL(bucketName, inputDirectory+fileName));
                System.out.println(url);
                uCon = (HttpURLConnection) url.openConnection();
                in = uCon.getInputStream(); // 이미지를 불러옴
            } catch (Exception e) {
                url = new URL(s3.getFileURL(bucketName, "default.jpg"));
                uCon = (HttpURLConnection) url.openConnection();
                in = uCon.getInputStream();
            }

            												// 여기
            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
            headers,
            HttpStatus.CREATED);
        }catch (FileNotFoundException effe){
            System.out.println("File Not found Exception");
            String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
            MediaType mType = MediaUtils.getMediaType(formatName);
            HttpHeaders headers = new HttpHeaders();
            in = new FileInputStream(uploadPath+"/noimage.jpeg");

                headers.setContentType(mType);

            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
                    headers,
                    HttpStatus.CREATED);
        }catch (Exception e){
            e.printStackTrace();
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        }finally {
            in.close();
        }
        return entity;
    }
//	@ResponseBody
//	@RequestMapping("/displayFile")
//	public ResponseEntity<byte[]> displayFile(String fileName)throws Exception{
//		
//		InputStream in =null;
//		ResponseEntity<byte[]> entity = null;
//		
//		logger.info("FILE NAME : " + fileName);
//		
//		try {
//			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
//			//확장자 이름 추출
//			MediaType mType = MediaUtils.getMediaType(formatName);
//			HttpHeaders headers = new HttpHeaders();
//			in = new FileInputStream(uploadPath+fileName);
//			
//			
//			//이미지파일인경우
//			if(mType != null) {
//				headers.setContentType(mType);
//			}else{
//				//이미지파일아닌경우
//				fileName = fileName.substring(fileName.indexOf("_")+1);
//				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//				//headers.setContentLength(IOUtils.toByteArray(in).length);
//				headers.add("Content-Disposition", "attachment; filename=\""+
//				new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"");
//			}
//			
//			logger.info("headers : " + headers);
//			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
//		}finally{
//			in.close();
//		}
//		return entity;
//	}
	
	//파일 삭제
	@ResponseBody
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		logger.info("delete file: "+fileName);
		
		String inputDirectory = "faint1122";
        s3.fileDelete(inputDirectory+fileName);
        		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}
