package com.wcx.model;

public class CartKey {
    private Integer orderid;

    //private Item item;
    
    private String itemid;
    public String getItemid() {
		return itemid;
	}

	public void setItemid(String itemid) {
		this.itemid = itemid;
	}

	public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

	/*public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}*/

   
}