package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrAPITestController {
	
	// 테스트용 컨트롤러 
	
	@RequestMapping("/usr/home/OpenWeatherAPITest")
	public String APITest2() {

		return "/usr/home/OpenWeatherAPITest";
	}
	
	
}