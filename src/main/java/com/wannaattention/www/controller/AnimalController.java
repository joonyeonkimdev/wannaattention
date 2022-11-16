package com.wannaattention.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wannaattention.www.service.AnimalService;

@Controller
@RequestMapping("animal")
public class AnimalController {
	@Autowired
	AnimalService service;

}
