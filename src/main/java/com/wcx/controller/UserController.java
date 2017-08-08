package com.wcx.controller;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.wcx.model.Account;
import com.wcx.model.Category;
import com.wcx.service.IAccountService;
import com.wcx.service.ICategoryService;


@Controller
@RequestMapping("/user")
@SessionAttributes(value={"account","error"})
public class UserController {
	private IAccountService aservice;
	private ICategoryService cservice;

	public IAccountService getAservice() {
		return aservice;
	}
	@Autowired
	public void setAservice(IAccountService aservice) {
		this.aservice = aservice;
	}

	public ICategoryService getCservice() {
		return cservice;
	}
	@Autowired
	public void setCservice(ICategoryService cservice) {
		this.cservice = cservice;
	}

	@RequestMapping(value={"/main"})
	public String main(){
		
		return "shop/main.ftl";
	}
	
	@RequestMapping(value={"/loginMain"})
	public String loginMain(){
		
		return "shop/login.ftl";
	}
	
	@RequestMapping(value={"/login"})
	public String login(Account account,Model m){
		Account a = aservice.selectByAccount_name_pwd(account);
		if(a!=null){
			m.addAttribute("account",a);
			return "shop/main.ftl";
		}
		m.addAttribute("error","你的用户名或密码错误！");
		return "shop/login.ftl";
	}
	
	@RequestMapping(value={"/registerMain"})
	public String registerMain(Map map){
		//必须取出宠物种类 供用户选择喜欢的
		List<Category> categoryList = cservice.selectByExample();
		map.put("categoryList", categoryList);	
		return "shop/register.ftl";
	}
	
	/**
	 * SpringMVC做校验时必须要用到一下写法
	 * 而且参数的顺序不能改变
	 */
	@RequestMapping(value={"/register"})
	public String register(@Valid @ModelAttribute(value="user") Account user,
						   BindingResult result,
						   Map map){
		if(result.hasErrors()){
			return registerMain(map);
		}
		if(!user.getPassword().equals(user.getRepassword())){
			map.put("repasswordError", "两次输入密码必须一致");
			return registerMain(map);
		}
		if(aservice.insert(user) <= 0){
			map.put("registerError", "注册失败，请重新注册");
			return registerMain(map);
		}
		
		map.put("error","注册成功，请登录");
		return "shop/login.ftl";
	}
}
