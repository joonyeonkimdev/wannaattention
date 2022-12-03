package com.wannaattention.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wannaattention.www.dao.InfoDAO;
import com.wannaattention.www.vo.Facility;

@Service
public class InfoService {
	@Autowired
	private InfoDAO dao;

	public List<Facility> selectPgList(Integer region) {
		return dao.selectPgList(region);
	}

}
