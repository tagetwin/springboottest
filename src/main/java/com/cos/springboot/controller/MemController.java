package com.cos.springboot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.springboot.dto.RequestMemJoinDto;
import com.cos.springboot.dto.RequestMemUpdateDto;
import com.cos.springboot.dto.ResponseDto;
import com.cos.springboot.model.Mem;
import com.cos.springboot.repository.MemRepository;

@Controller
public class MemController {

	@Autowired
	private MemRepository memRepository;

	// username, password, email
	
	@GetMapping("/mem/join")
	public String mem_join() {

		return "mem/join";
	}
	
	
	@PostMapping("/mem/api/join")
	public @ResponseBody ResponseEntity<?> memApiJoin(@Valid @RequestBody RequestMemJoinDto requestMemJoinDto, BindingResult bindResult) {

		if(bindResult.hasErrors()) {
			Map<String, String> errorMap = new HashMap<>();
			
			for(FieldError error : bindResult.getFieldErrors()) {
				errorMap.put(error.getField(), error.getDefaultMessage());
			}
			
			return new ResponseEntity<Map<String, String>>(errorMap, HttpStatus.BAD_REQUEST);
		}
		
		
		
		int result = memRepository.save(requestMemJoinDto);

		if (result == 1) {
			return new ResponseEntity<ResponseDto>(new ResponseDto(200,"ok"), HttpStatus.CREATED);
		} else {
			return new ResponseEntity<ResponseDto>(new ResponseDto(500,"fail"), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@GetMapping("/mem")
	public String mems(Model model) {

		List<Mem> mems = memRepository.findAll();
		model.addAttribute("mems", mems);

		return "mem/list";
	}

	@GetMapping("/mem/{id}")
	public String update(@PathVariable int id, Model model) {

		Mem mem = memRepository.findById(id);
		model.addAttribute("mem", mem);

		return "mem/update";
	}

	@PutMapping("/mem/api/update")
	public @ResponseBody ResponseEntity<?> updateProc(@RequestBody RequestMemUpdateDto requestMemUpdateDto) {

		int result = memRepository.update(requestMemUpdateDto);

		if(result == 1) {
			return new ResponseEntity<String>("ok", HttpStatus.OK);			
		}else
			return new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
//	@DeleteMapping("/mem/api/update")
//	public @ResponseBody ResponseEntity<?> deleteProc(@RequestBody RequestMemDelDto requestMemDelDto) {
//
//		int result = memRepository.delete(requestMemDelDto);
//
//		if(result == 1) {
//			return new ResponseEntity<String>("ok", HttpStatus.OK);			
//		}else
//			return new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
//	}
	
	@DeleteMapping("/mem/api/delete/{id}")
	public @ResponseBody ResponseEntity<?> deleteProc(@PathVariable int id) {

		int result = memRepository.delete(id);

		if(result == 1) {
			return new ResponseEntity<String>("ok", HttpStatus.OK);			
		}else
			return new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}
}