package com.wcx.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wcx.dao.ProductMapper;
import com.wcx.model.Product;
import com.wcx.model.ProductExample;

@Service
public class ProductServiceImpl implements IProductService {
	private ProductMapper dao;
	
	public ProductMapper getDao() {
		return dao;
	}
	@Autowired
	public void setDao(ProductMapper dao) {
		this.dao = dao;
	}

	public List<Product> selectByExample(String catid) {//根据catid查询动物
		ProductExample example = new ProductExample();
		example.createCriteria().andCatidEqualTo(catid);
		return dao.selectByExample(example);
	}

}
