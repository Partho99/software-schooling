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
public class Post {
    
    private int postId;
    private String title;
    private int isActive;
    private Date creationDtm;
    private Date updateDtm;

    public Post(int postId, String title, int isActive, Date creationDtm, Date updateDtm) {
        this.postId = postId;
        this.title = title;
        this.isActive = isActive;
        this.creationDtm = creationDtm;
        this.updateDtm = updateDtm;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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
    
    
}
