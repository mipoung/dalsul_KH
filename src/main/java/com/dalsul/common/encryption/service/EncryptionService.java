package com.dalsul.common.encryption.service;


public interface EncryptionService {
	public String createSalt();
	public String hashingPassword(String salt, String password);
}
