package com.wcx.model;

import java.util.List;

public class Cart extends CartKey {
    private Integer quantity;
    
    private List<Item> itemList;
    
    public List<Item> getItemList() {
		return itemList;
	}

	public void setItemList(List<Item> itemList) {
		this.itemList = itemList;
	}

	public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}