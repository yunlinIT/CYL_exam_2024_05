package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrHomeController {

	@RequestMapping("/usr/home/main")
	public String showMain(Model model) {

		return "/usr/home/main";
	}

	@RequestMapping("/")
	public String showMain2(Model model) {

		return "redirect:/usr/home/main";
	}

	@RequestMapping("/usr/home/OpenWeatherAPI")
	public String OpenWeatherAPI() {

		return "/usr/home/OpenWeatherAPI";
	}
}