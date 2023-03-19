/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author xuank
 */
public class Account {
    private String username;
    private String password;
    private String displayname;
    private boolean status;
   
    private int Role;
    public Account() {
    }

    public Account(String username, String password, String displayname, boolean status) {
        this.username = username;
        this.password = password;
        this.displayname = displayname;
        this.status = status;
        
    }

    public Account(String username, String password, String displayname, boolean status, int Role) {
        this.username = username;
        this.password = password;
        this.displayname = displayname;
        this.status = status;
     
        this.Role = Role;
    }

    public int getRole() {
        return Role;
    }

    public void setRole(int Role) {
        this.Role = Role;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }





    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDisplayname() {
        return displayname;
    }

    public void setDisplayname(String displayname) {
        this.displayname = displayname;
    }

    @Override
    public String toString() {
        return "Account{" + "username=" + username + ", password=" + password + ", displayname=" + displayname + '}';
    }
    
    
}
