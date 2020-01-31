package com.cos.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.springboot.dto.JoinDto;
import com.cos.springboot.dto.ResponseData;
import com.cos.springboot.dto.rsDto;

// localhost:8080/
// localhost:8080
@Controller

@RequestMapping("home")
public class HomeController {
	

	@GetMapping({"","/"})
	public String Home() {
		
		return "home";
	}
	
	@GetMapping("/hello")
	public String hello_get() {
		// DB Select - Model
		return "hello";
		
	}

	@PostMapping("/hello")
	public @ResponseBody ResponseData hello_post(@RequestBody rsDto rsDto) {
		// DB Post
		System.out.println(rsDto.getId());
		return new ResponseData(200,"ok");
	}

	@DeleteMapping("/hello")
	public @ResponseBody ResponseData hello_delete(@RequestBody rsDto rsDto) {
		System.out.println(rsDto.getId());
		return new ResponseData(200,"ok");
	}
	
	@PutMapping("/hello")
	public @ResponseBody ResponseData hello_update(@RequestBody JoinDto joinDto) {
		System.out.println(joinDto.getUsername());
		System.out.println(joinDto.getPhone());
		return new ResponseData(200,"ok");
	}
	
}
