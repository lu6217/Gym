package com.kzw.demo.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kzw.core.service.DefaultEntityManager;
import com.kzw.demo.entity.Leader;

@Service
@Transactional
public class LeaderService extends DefaultEntityManager<Leader, Integer> {
	
}
