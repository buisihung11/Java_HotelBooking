/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.util.UUID;

/**
 *
 * @author Admin
 */
public class GenerateRandomStringUtil {
    
    public static String generateRandomString(){
        //random UUID will reutrn a random String with a - between 
        //so to use that as a token which will be send as parameter on URL
        // we must remove the - in this random string
        //and the result is random string and its length is 32
        String randomString = UUID.randomUUID().toString()
                .replaceAll("-", "");
        return randomString;
    }
    
    
    public static void main(String[] args) {
        System.out.println(generateRandomString());
        System.out.println(generateRandomString());
        System.out.println(generateRandomString().length());
    }
}
