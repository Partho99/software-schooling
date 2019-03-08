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
public class PostVoting {
    
    private int postVotingId;
    private long  upVote;
    private long  downVote;
    private int userId;
    private int contentId;

    public PostVoting() {
    }

    public PostVoting(int postVotingId, long upVote, long downVote, int userId, int contentId) {
        this.postVotingId = postVotingId;
        this.upVote = upVote;
        this.downVote = downVote;
        this.userId = userId;
        this.contentId = contentId;
    }

    public int getPostVotingId() {
        return postVotingId;
    }

    public void setPostVotingId(int postVotingId) {
        this.postVotingId = postVotingId;
    }

    public long getUpVote() {
        return upVote;
    }

    public void setUpVote(long upVote) {
        this.upVote = upVote;
    }

    public long getDownVote() {
        return downVote;
    }

    public void setDownVote(long downVote) {
        this.downVote = downVote;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getContentId() {
        return contentId;
    }

    public void setContentId(int contentId) {
        this.contentId = contentId;
    }
    
    
}
