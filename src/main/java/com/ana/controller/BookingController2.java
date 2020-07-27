package com.ana.controller;

import java.util.Calendar;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/booking/*")
@AllArgsConstructor
public class BookingController2 {
	
	@PostMapping("/new")
	public void getInfo(
			@RequestParam("in") String checkin,
			@RequestParam("out") String checkout,
			Model model) {
		log.info("■■■■■■■■■■■■■■■■■■■■■■■■ 예약페이지로 이동 중...");
		model.addAttribute("days", getDiff(checkin, checkout));
	}
	
	public long getDiff(String in, String out) {
		Calendar CkIn = setCal(in);
		Calendar CkOut = setCal(out);
		
		// 날짜 간의 차이를 얻기 위해서 천분의 일초 단위로 변환
		long diffSec = ( CkOut.getTimeInMillis() - CkIn.getTimeInMillis() )/ 1000;
		long diffDay = diffSec / (60*60*24);
		return diffDay;
	}
	
	// 날짜 패턴 맞추기
	public Calendar setCal(String date) {
		Calendar cal = Calendar.getInstance();
		cal.clear();
		String[] tmp = date.split("-");
		cal.set(Integer.parseInt(tmp[0]), Integer.parseInt(tmp[1])-1, Integer.parseInt(tmp[2]));
		return cal;
	}
}
 