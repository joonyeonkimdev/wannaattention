package com.wannaattention.www.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wannaattention.www.dao.AnimalDAO;

@Service
public class AnimalService {
	@Autowired
	AnimalDAO dao;

}
