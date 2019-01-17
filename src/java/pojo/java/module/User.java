/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo.java.module;

import java.util.Date;

/**
 *
 * @author partho
 */
public class User {

    private int userId;
    private String firstName;
    private String lastName;
    private String email;
    private String userName;
    private String userType;
    private int isActive;
    private Date creationDtm;
    private Date updateDtm;
    private String password;

    public User(int userId, String firstName, String lastName, String email, String userName, String userType, int isActive, Date creationDtm, Date updateDtm, String password) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.userName = userName;
        this.userType = userType;
        this.isActive = isActive;
        this.creationDtm = creationDtm;
        this.updateDtm = updateDtm;
        this.password = password;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    public Date getCreationDtm() {
        return creationDtm;
    }

    public void setCreationDtm(Date creationDtm) {
        this.creationDtm = creationDtm;
    }

    public Date getUpdateDtm() {
        return updateDtm;
    }

    public void setUpdateDtm(Date updateDtm) {
        this.updateDtm = updateDtm;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
