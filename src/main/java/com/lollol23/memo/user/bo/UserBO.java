package com.lollol23.memo.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lollol23.memo.common.EncryptUtils;
import com.lollol23.memo.user.dao.UserDAO;
import com.lollol23.memo.user.model.User;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String loginId, String password, String name, String email) {
		//password 암호화
		
		String encryptpassword = EncryptUtils.md5(password);
		return userDAO.insertUser(loginId, encryptpassword, name, email);
	}
	
	public User signIn(String loginId, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUserByIdPassword(loginId, encryptPassword);
	}
}
