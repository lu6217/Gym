package com.kzw.demo.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kzw.core.service.DefaultEntityManager;
import com.kzw.demo.entity.DataImport;

@Service
@Transactional
public class DataImportService extends DefaultEntityManager<DataImport, Integer> {
	
}
