package com.wannaattention.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.wannaattention.www.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
}
