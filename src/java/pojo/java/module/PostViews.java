/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo.java.module;

/**
 *
 * @author partho
 */
public class PostViews {

    long views_count;
    int content_id;

    public PostViews() {
    }

    public PostViews(long views_count, int content_id) {
        this.views_count = views_count;
        this.content_id = content_id;
    }

    public long getViews_count() {
        return views_count;
    }

    public void setViews_count(long views_count) {
        this.views_count = views_count;
    }

    public int getContent_id() {
        return content_id;
    }

    public void setContent_id(int content_id) {
        this.content_id = content_id;
    }

}
