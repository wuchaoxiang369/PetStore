package com.wcx.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.wcx.model.Cart;
import com.wcx.model.Item;
import com.wcx.model.Orders;
import com.wcx.service.ICartService;

@Controller
@RequestMapping("/cart")
@SessionAttributes(value={"commitError"})
public class CartController {
	
	private ICartService service;
	public ICartService getService() {
		return service;
	}
	@Autowired
	public void setService(ICartService service) {
		this.service = service;
	}

	@RequestMapping(value={"/add/itemid/{itemid}/quantity/{quantity}"})
	public String addCart(@PathVariable String itemid,@PathVariable int quantity
			,Map map){
		Map map1 = new HashMap();
		map1.put("in_itemid", itemid);
		map1.put("in_quantity",quantity);		
		List<Cart> cartList = service.addCart(map1);
		map.put("cartList", cartList);
		return "/shop/addItemToCart.ftl";
	}
	
	@RequestMapping(value={"/del/itemid/{itemid}/orderid/{orderid}"})
	public String delCart(@PathVariable String itemid,@PathVariable int orderid
			,Map map){
		Map map1 = new HashMap();
		map1.put("in_itemid", itemid);
		map1.put("in_orderid",orderid);		
		List<Cart> cartList = service.delCart(map1);
		map.put("cartList", cartList);
		return "/shop/addItemToCart.ftl";
	}
	
	/*
	 * 根据SpringMVC特性，能自动根据前端找到匹配itemid的值并且放到List<String> itemid中
	 * 剩下几个类似
	 */
	@RequestMapping(value={"/update"})
	public String updateCart(@RequestParam(value="itemid") List<String> itemid,
			@RequestParam(value="orderid") List<Integer> orderid,
			@RequestParam(value="quantity") List<Integer> quantity,
			Map map){
		for(int i=0;i<orderid.size();i++){
			Map m = new HashMap();
			m.put("in_itemid", itemid.get(i));
			m.put("in_orderid", orderid.get(i));
			m.put("in_quantity",quantity.get(i));
			service.updateCart(m);
		}
		Map m1 = new HashMap();
		m1.put("in_orderid",orderid.get(0));
		List<Cart> cartList = service.queryCart(m1);
		map.put("cartList", cartList);
		return "/shop/addItemToCart.ftl";
	}
	
	@RequestMapping(value={"/updateOrder/orderid/{orderid}/total/{total}"})
	public String updateOrder(@PathVariable int orderid
			,@PathVariable double total
			,Map map){
		Orders order = new Orders();
		order.setOrderid(orderid);
		order.setTotalprice(new BigDecimal(total));
		order.setOrderdate(new Date());
		if(service.updateByPrimaryKey(order) >= 0){
			map.put("commitError", "订单提交成功，请继续购物");
			return "/shop/main.ftl";
		}else{
			map.put("commitError", "订单提交失败，请继续提交");
			return "/shop/addItemToCart.ftl";
		}
		
	}
}
