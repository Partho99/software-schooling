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
public class ContentTag {
    
    private int contentId;
    private int tagId;
    private int isActive;
    private Date creationDtm;
    private Date updateDtm;

    public ContentTag() {
    }

    public ContentTag(int contentId, int tagId, int isActive, Date creationDtm, Date updateDtm) {
        this.contentId = contentId;
        this.tagId = tagId;
        this.isActive = isActive;
        this.creationDtm = creationDtm;
        this.updateDtm = updateDtm;
    }

    public int getContentId() {
        return contentId;
    }

    public void setContentId(int contentId) {
        this.contentId = contentId;
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
