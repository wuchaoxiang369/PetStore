package com.wcx.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wcx.dao.CartMapper;
import com.wcx.dao.OrdersMapper;
import com.wcx.model.Cart;
import com.wcx.model.Orders;

@Service
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

	@Override
	public List<Cart> addCart(Map map) {
		// TODO Auto-generated method stub
		return dao.addCart(map);
	}
	@Override
	public List<Cart> delCart(Map map) {
		// TODO Auto-generated method stub
		return dao.delCart(map);
	}
	@Override
	public List<Cart> updateCart(Map map) {
		// TODO Auto-generated method stub
		return dao.updateCart(map);
	}
	@Override
	public List<Cart> queryCart(Map map) {
		// TODO Auto-generated method stub
		return dao.queryCart(map);
	}
	@Override
	public int updateByPrimaryKey(Orders record) {
		// TODO Auto-generated method stub
		return odao.updateByPrimaryKey(record);
	}

}
