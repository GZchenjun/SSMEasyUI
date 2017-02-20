package com.cj.test;

import com.cj.common.bean.EncryptUtil;
import org.junit.Test;

/**
 * Created by interface on 2017/2/20.
 */
public class EncryptTest {

    @Test
    public void testMD5Encrypt(){
        String text = "123";
        String Encrypt = EncryptUtil.md5Encrypt(text);
        System.out.println(Encrypt);
    }

    @Test
    public void testSHAEncrypt(){
        String text = "123";
        String shaEncrypt = EncryptUtil.shaEncrypt(text);
        System.out.println(shaEncrypt);
    }

    @Test
    public void testSHA_256Encrypt(){
        String text = "123";
        String sha256Encrypt = EncryptUtil.sha256Encrypt(text);
        System.out.print(sha256Encrypt);
    }

}
