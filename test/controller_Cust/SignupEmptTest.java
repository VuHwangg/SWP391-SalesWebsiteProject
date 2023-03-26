/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package controller_Cust;

import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author admin
 */
public class SignupEmptTest {
    SignupEmpt se = new SignupEmpt();
    
    public SignupEmptTest() {
        
    }
    
    
    @Test
    public void testNameFalse() throws Exception{
        String name = "";
        boolean isValid = se.checkName(name);
        boolean expectation = false;
        assertEquals(expectation, isValid);
    }
    @Test
    public void testName() throws Exception{
        String name = "giang";
        boolean isValid = se.checkName(name);
        boolean expectation = true;
        assertEquals(expectation, isValid);
    }

}
    

