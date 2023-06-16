package com.lsousa.ninjagold;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	@RequestMapping("/")
	public String index(HttpSession session) {
//		session.invalidate();
		return "index.jsp";
	}
	
	@RequestMapping(value="/job", method=RequestMethod.POST)
	public String results (@RequestParam(value="job") String job, 
			HttpSession session) {
		Integer earnings = 0;
		Random random = new Random();
		switch (job) {
		case "farm":
			earnings = random.nextInt(21-10) + 10;
			break;
		case "cave":
			earnings = random.nextInt(11-5) + 5;
			break;
		case "house":
			earnings = random.nextInt(6-2) + 2;
			break;
		case "quest":
			earnings = random.nextInt(51);
			boolean posneg = random.nextBoolean();
			if (!posneg) {
				earnings = -earnings;
			}
			break;
		}
		
		if(session.getAttribute("gold") == null) {
			session.setAttribute("gold", 0);
		}
		
		Integer newVal = (Integer) session.getAttribute("gold");
		newVal += earnings;
		if(newVal <= -100) {
			return "redirect:/youlose";
		}
		session.setAttribute("gold", newVal);
		
		SimpleDateFormat timeFormat = new SimpleDateFormat("MMMMM d yyyy HH:mm");
		String time = timeFormat.format(new Date());
		String activityMsg = "You entered a " + job + " and earned " + earnings + " gold. (" + time + ")";
		if (earnings < 0) {			
			earnings *= -1;
			activityMsg = "You failed a quest and lost " + earnings + " gold. (" + time + ")";
		}
		
		if(session.getAttribute("activities") == null) {
			ArrayList<String> activities = new ArrayList<String>();
			activities.add(activityMsg);
			session.setAttribute("activities", activities);	
		} else {
			ArrayList<String> activities = (ArrayList<String>) session.getAttribute("activities");
			activities.add(activityMsg);
			session.setAttribute("activities", activities);	
		}
		
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/reset", method=RequestMethod.POST)
	public String rest(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/youlose")
	public String lost() {
		return "lose.jsp";
	}
}
