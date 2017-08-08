package com.wcx.dao;

import com.wcx.model.Cart;
import com.wcx.model.CartExample;
import com.wcx.model.CartKey;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface CartMapper {
    int countByExample(CartExample example);

    int deleteByExample(CartExample example);

    int deleteByPrimaryKey(CartKey key);

    int insert(Cart record);

    int insertSelective(Cart record);

    List<Cart> selectByExample(CartExample example);
    
    /*
     * 调用存储过程pro_addCart(),pro_delCart(),pro_updateCart(),pro_queryCart()
     */
    List<Cart> addCart(Map map);
    
    List<Cart> delCart(Map map);
    
    List<Cart> updateCart(Map map);
    
    List<Cart> queryCart(Map map);
    
    Cart selectByPrimaryKey(CartKey key);

    int updateByExampleSelective(@Param("record") Cart record, @Param("example") CartExample example);

    int updateByExample(@Param("record") Cart record, @Param("example") CartExample example);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);
}