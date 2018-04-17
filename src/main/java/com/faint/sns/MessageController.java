package com.faint.sns;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.faint.service.MessageService;

@Controller
public class MessageController {
	
	@Inject
	MessageService service;
	
	//@PreAuthorize("#id == principal.vo.id or hasRole('USER')")
	@RequestMapping(value="/{nickname}", method=RequestMethod.GET)
	public ResponseEntity<List<String>> read(@RequestParam int id, Authentication authentication) throws Exception{
		
		ResponseEntity<List<String>> entity=null;
		
		//temp
		List list=new ArrayList();
		list.add("123");
		
		try{
			entity=new ResponseEntity<List<String>>(list, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
		
	}

}
