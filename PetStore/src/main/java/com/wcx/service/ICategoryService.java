package com.wcx.service;

import java.util.List;

import com.wcx.model.Category;


public interface ICategoryService {
	List<Category> selectByExample();
}
