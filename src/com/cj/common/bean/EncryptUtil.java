package com.cj.common.bean;

import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by interface on 2017/2/20.
 */
public class EncryptUtil {
    public static final String CHARSET = "utf-8";

    public static final String MD5 = "md5";
    public static final String SHA = "SHA";
    public static final String SHA_256 = "SHA-256";

    /**
     *
     * @param str
     * @return MD5加密
     */
    public static String md5Encrypt(String str) {
        String encryptStr = null;
        try {
            encryptStr = oneWayEncrypt(str, MD5);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return encryptStr;
    }

    /**
     *
     * @param str
     * @return SHA加密
     */
    public static String shaEncrypt(String str) {
        String encryptStr = null;
        try {
            encryptStr = oneWayEncrypt(str, SHA);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return encryptStr;
    }

    /**
     *
     * @param str
     * @return SHA-256加密
     */
    public static String sha256Encrypt(String str) {
        String encryptStr = null;
        try {
            encryptStr = oneWayEncrypt(str, SHA_256);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return encryptStr;
    }

    public static String oneWayEncrypt(String str, String type) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest md = MessageDigest.getInstance(type);
        BASE64Encoder encoder = new BASE64Encoder();
        byte[] bytes = str.getBytes(CHARSET);
        md.update(bytes);
        return encoder.encode(md.digest(bytes));
    }
}
