/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author ibm
 */
public class User {
    private String username;
    private String password;
    private String displayname;
    private String email;
    
    private Employee e;
    

    public Employee getE() {
        return e;
    }

    public void setE(Employee e) {
        this.e = e;
    }
    
    
    private ArrayList<Role> roles = new ArrayList<>();

    public ArrayList<Role> getRoles() {
        return roles;
    }

    public void setRoles(ArrayList<Role> roles) {
        this.roles = roles;
    }
    
    
    
    public User() {
    }

    public User(String username, String password, String displayname, String email, Employee e) {
        this.username = username;
        this.password = password;
        this.displayname = displayname;
        this.email = email;
        this.e = e;
    }

 

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
    
    
}
