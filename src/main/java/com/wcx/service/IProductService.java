package com.wcx.service;

import com.wcx.model.Product;

import java.util.List;

public interface IProductService {
	List<Product> selectByExample(String catid);
}
