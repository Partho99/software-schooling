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
public class Comment {

    private int commentId;
    private String commentText;
    private int isActive;
    private Date creationDtm;
    private Date updateDtm;
    private int userId;
    private int postId;

    public Comment(int commentId, String commentText, int isActive, Date creationDtm, Date updateDtm, int userId, int postId) {
        this.commentId = commentId;
        this.commentText = commentText;
        this.isActive = isActive;
        this.creationDtm = creationDtm;
        this.updateDtm = updateDtm;
        this.userId = userId;
        this.postId = postId;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
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

}
