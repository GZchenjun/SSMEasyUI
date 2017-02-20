package com.cj.test;

import com.cj.common.bean.EncryptUtil;
import org.junit.Test;

/**
 * Created by interface on 2017/2/20.
 */
public class EncryptTest {
    @Test
    public void testEncryptMD5(){
        String text = "123";
        String Encrypt = EncryptUtil.md5Encrypt(text);
        System.out.println(Encrypt);
    }

}
