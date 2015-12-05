package com.onlinelib.service.account;

import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class CryptoPasswordEncoder implements PasswordEncoder {

	@Override
	public String encodePassword(String rawPass, Object salt) {
		return rawPass;
	}

	@Override
	public boolean isPasswordValid(String encPass, String rawPass, Object salt) {

		boolean isPasswordValid = false;
		if (null == encPass) {
			isPasswordValid = false;
		} else if (null != encPass && encPass.equals(rawPass)) {
			isPasswordValid = true;
		}
		return isPasswordValid;
	}

}
