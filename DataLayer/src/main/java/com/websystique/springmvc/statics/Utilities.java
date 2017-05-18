package com.websystique.springmvc.statics;

import java.math.BigInteger;
import java.security.SecureRandom;

public class Utilities {

	public static String generateRandomUUID() {
		SecureRandom random = new SecureRandom();
		return new BigInteger(52, random).toString(14);
	}

	public static String generateRandomUUIDForRes() {
		SecureRandom random = new SecureRandom();
		return new BigInteger(15, random).toString(6);
	}
	
}
