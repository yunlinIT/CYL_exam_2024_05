package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.FAQRepository;
import com.example.demo.vo.FAQ;

@Service
public class FAQService {

	@Autowired
	private FAQRepository faqRepository;

	public int getFAQCount(String searchKeyword) {

		return faqRepository.getFAQCount(searchKeyword);
	}

	public List<FAQ> getForPrintFAQ(String searchKeyword) {


		return faqRepository.getForPrintFAQ(searchKeyword);
	}

}
