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
public class Tag {
    
    private int tagId;
    private int isActive;
    private String tagTitle;
    private Date creationDtm;
    private Date updatDtm;

    public Tag() {
    }

    public Tag(int tagId, int isActive, String tagTitle, Date creationDtm, Date updatDtm) {
        this.tagId = tagId;
        this.isActive = isActive;
        this.tagTitle = tagTitle;
        this.creationDtm = creationDtm;
        this.updatDtm = updatDtm;
    }

   
    public int getTagId() {
        return tagId;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    public String getTagTitle() {
        return tagTitle;
    }

    public void setTagTitle(String tagTitle) {
        this.tagTitle = tagTitle;
    }

    public Date getCreationDtm() {
        return creationDtm;
    }

    public void setCreationDtm(Date creationDtm) {
        this.creationDtm = creationDtm;
    }

    public Date getUpdatDtm() {
        return updatDtm;
    }

    public void setUpdatDtm(Date updatDtm) {
        this.updatDtm = updatDtm;
    }
    
    
    
}
