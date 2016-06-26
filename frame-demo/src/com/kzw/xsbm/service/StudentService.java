package com.kzw.xsbm.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kzw.core.service.DefaultEntityManager;
import com.kzw.xsbm.entity.Student;

@Service
@Transactional
public class StudentService extends DefaultEntityManager<Student, Integer> {

	
}
