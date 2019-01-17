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
public class Likes {

    private int likeId;
    private int userId;
    private int postId;
    private Date isActive;
    private Date creationDtm;
    private Date UpdateDtm;

    public Likes(int likeId, int userId, int postId, Date isActive, Date creationDtm, Date UpdateDtm) {
        this.likeId = likeId;
        this.userId = userId;
        this.postId = postId;
        this.isActive = isActive;
        this.creationDtm = creationDtm;
        this.UpdateDtm = UpdateDtm;
    }

    public int getLikeId() {
        return likeId;
    }

    public void setLikeId(int likeId) {
        this.likeId = likeId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public Date getIsActive() {
        return isActive;
    }

    public void setIsActive(Date isActive) {
        this.isActive = isActive;
    }

    public Date getCreationDtm() {
        return creationDtm;
    }

    public void setCreationDtm(Date creationDtm) {
        this.creationDtm = creationDtm;
    }

    public Date getUpdateDtm() {
        return UpdateDtm;
    }

    public void setUpdateDtm(Date UpdateDtm) {
        this.UpdateDtm = UpdateDtm;
    }

}
