package com.wcx.service;

import java.util.List;

import com.wcx.model.Item;
import com.wcx.model.ItemExample;

public interface IItemService {
	List<Item> selectByExample(String productid);
	Item selectByPrimaryKey(String itemid);
}
