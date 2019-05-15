package com.wcx.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wcx.dao.CategoryMapper;
import com.wcx.model.Category;
import com.wcx.model.CategoryExample;

@Service
public class CategoryServiceImpl implements ICategoryService {
	private CategoryMapper dao;
	
	public CategoryMapper getDao() {
		return dao;
	}
	@Autowired
	public void setDao(CategoryMapper dao) {
		this.dao = dao;
	}

	public List<Category> selectByExample() {
		CategoryExample c = new CategoryExample();
		c.createCriteria().andCatidIsNotNull();
		return dao.selectByExample(c);
	}
}
