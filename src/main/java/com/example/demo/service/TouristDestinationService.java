package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.TouristDestinationRepository;
import com.example.demo.vo.TouristDestination;

@Service
public class TouristDestinationService {

	@Autowired
	private TouristDestinationRepository touristDestinationRepository;

	public List<TouristDestination> getForPrintInformation() {
		
		return touristDestinationRepository.getForPrintInformation();
	}

}
