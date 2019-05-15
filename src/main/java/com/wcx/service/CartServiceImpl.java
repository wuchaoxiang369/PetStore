package com.wcx.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wcx.dao.CartMapper;
import com.wcx.dao.OrdersMapper;
import com.wcx.model.Cart;
import com.wcx.model.Orders;

@Service("cartService")
public class CartServiceImpl implements ICartService {
	private CartMapper dao;
	private OrdersMapper odao;
	
	public OrdersMapper getOdao() {
		return odao;
	}
	@Autowired
	public void setOdao(OrdersMapper odao) {
		this.odao = odao;
	}
	
	public CartMapper getDao() {
		return dao;
	}
	@Autowired
	public void setDao(CartMapper dao) {
		this.dao = dao;
	}

	public List<Cart> addCart(Map map) {
		return dao.addCart(map);
	}

	public List<Cart> delCart(Map map) {
		return dao.delCart(map);
	}

	public List<Cart> updateCart(Map map) {
		return dao.updateCart(map);
	}

	public List<Cart> queryCart(Map map) {
		return dao.queryCart(map);
	}

	public int updateByPrimaryKey(Orders record) {
		return odao.updateByPrimaryKey(record);
	}

}
