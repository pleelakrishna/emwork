package com.example.demo.controller;

import java.io.IOException;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.dao.EmployeeDao;
import com.example.demo.model.Employee;

@Controller
public class HomeController {
	
	@Autowired
	EmployeeDao  edao;
	
	
	@RequestMapping("/")
	public String homeUser(Model model) {
		model.addAttribute("userForm", new Employee());
		return "emp";
	}
	
	
	@RequestMapping(value = "/emp", method = RequestMethod.POST)
	public String saveAdmin(@Valid @ModelAttribute  Employee emp, BindingResult bindingresults,
			RedirectAttributes redir) throws IOException {

		System.out.print("create user block");
		if (bindingresults.hasErrors()) {
			System.out.println("has some errors");
			return "redirect:/";
		}

		// user.setPassword(passwordEncoder.encode(user.getPassword()));
		edao.saveEmployee(emp);

		return "redirect:/";
	}
	
	
	@RequestMapping(value="/atest",method = RequestMethod.POST)
	public @ResponseBody String doUpload(@RequestParam("file") MultipartFile[] multipartFile) {  
		
	    return "Uploaded: " + multipartFile.length + " bytes";
	}


}
