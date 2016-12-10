package com.wcx.service;

import java.util.List;
import java.util.Map;

import com.wcx.model.Cart;
import com.wcx.model.Orders;

public interface ICartService {
	List<Cart> queryCart(Map map);
	List<Cart> addCart(Map map);
	List<Cart> delCart(Map map);
	List<Cart> updateCart(Map map);
	int updateByPrimaryKey(Orders record);
}
