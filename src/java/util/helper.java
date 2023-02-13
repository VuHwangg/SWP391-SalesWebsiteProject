/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.text.DecimalFormat;

/**
 *
 * @author admin
 */
public class helper {
    public String convertBigNum(double x){
        DecimalFormat formatter = new DecimalFormat("#,###");
        String result = formatter.format(x);
        return result;
    }
    
    public boolean checked(String x, String[] ys){
        for(String y: ys){
            if(x.compareTo(y)==0){
                return true;
            }
        }
        return false;
    }
}
