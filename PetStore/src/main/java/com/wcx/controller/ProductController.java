package com.wcx.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.wcx.model.Product;
import com.wcx.service.IProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	private IProductService service;
	
	public IProductService getService() {
		return service;
	}
	@Autowired
	public void setService(IProductService service) {
		this.service = service;
	}

	@RequestMapping("/queryProduct/catid/{catid}")
	private String queryProduct(@PathVariable String catid,Map map){
		List<Product> productList = service.selectByExample(catid);
		map.put("productList",productList);
		return "shop/queryProduct.ftl";
	}
}
