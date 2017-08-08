package com.wcx.service;

import java.util.List;

import com.wcx.model.Product;
import com.wcx.model.ProductExample;

public interface IProductService {
	List<Product> selectByExample(String catid);
}
