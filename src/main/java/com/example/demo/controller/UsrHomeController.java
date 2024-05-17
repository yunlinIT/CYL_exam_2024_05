package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.TouristDestinationService;
import com.example.demo.vo.TouristDestination;

@Controller
public class UsrHomeController {
	
	@Autowired
	private TouristDestinationService touristDestinationService;
	

	@RequestMapping("/usr/home/main")
	public String showMain(Model model) {

		List<TouristDestination> touristDestination = touristDestinationService.getForPrintInformation();
		
		model.addAttribute("touristDestination", touristDestination);
		
		return "/usr/home/main";
	}

	@RequestMapping("/")
	public String showMain2(Model model) {
		
		List<TouristDestination> touristDestination = touristDestinationService.getForPrintInformation();
		
		model.addAttribute("touristDestination", touristDestination);
		
		return "redirect:/usr/home/main";
	}

	@RequestMapping("/usr/home/OpenWeatherAPI")
	public String OpenWeatherAPI() {

		return "/usr/home/OpenWeatherAPI";
	}
}