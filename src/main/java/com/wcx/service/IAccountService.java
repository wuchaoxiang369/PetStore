package com.wcx.service;

import com.wcx.model.Account;
import com.wcx.model.Profile;

public interface IAccountService {
	Account selectByAccount_name_pwd(Account account);
	int insert(Account record);
}
