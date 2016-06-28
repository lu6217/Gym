package com.kzw.demo.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kzw.core.service.DefaultEntityManager;
import com.kzw.demo.entity.Activity;

@Service
@Transactional
public class ActivityService extends DefaultEntityManager<Activity, Integer> {
	
}
