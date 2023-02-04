/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

/**
 *
 * @author xuank
 */
public class Check {
    public boolean CheckPhone (String pass){
        boolean check = false;
        try {
            int a = Integer.parseInt(pass);
            if(a > 0){
                check = true;
            }
        } catch (Exception e) {
        }
        return check;
}
  
}
