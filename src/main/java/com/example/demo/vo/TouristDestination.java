package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TouristDestination {
	private int id;
	private String division;
	private String placename;
	private String location;
	private String phoneNumber;
	private String URL;
	private String department;
	private String departmentphoneNumber;
}
