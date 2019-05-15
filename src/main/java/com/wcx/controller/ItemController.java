package com.wcx.controller;

import com.wcx.model.Item;
import com.wcx.service.IItemService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/item")
public class ItemController {

	@Resource
	private IItemService itemService;
	
	@RequestMapping("/queryItems/productid/{productid}")
	public String queryItems(@PathVariable String productid,Map map){
		List<Item> itemList = itemService.selectByExample(productid);
		map.put("itemList",itemList);
		return "shop/queryItems.ftl";
	}
	
	@RequestMapping("/queryItem/itemid/{itemid}")
	public String selectByPrimaryKey(@PathVariable String itemid,Map map){
		Item item = (Item) itemService.selectByPrimaryKey(itemid);
		map.put("item",item);
		return "shop/queryItem.ftl";
	}
}
