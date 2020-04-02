package com.pojo;

import java.util.Date;

public class Comment {
    private Integer id;

    private String reply;

    private String content;

    private Date createtime;

    private Date replytime;

    private String nickname;

    private  int stage;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply == null ? null : reply.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getReplytime() {
        return replytime;
    }

    public void setReplytime(Date replytime) {
        this.replytime = replytime;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public int getStage() {
        return stage;
    }

    public void setStage(int stage) {
        this.stage = stage;
    }

    public Comment() {
        super();
    }

    public Comment(Integer id, String reply, String content, Date createtime, Date replytime, String nickname, int stage) {
        this.id = id;
        this.reply = reply;
        this.content = content;
        this.createtime = createtime;
        this.replytime = replytime;
        this.nickname = nickname;
        this.stage = stage;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", reply='" + reply + '\'' +
                ", content='" + content + '\'' +
                ", createtime=" + createtime +
                ", replytime=" + replytime +
                ", nickname='" + nickname + '\'' +
                ", stage=" + stage +
                '}';
    }
}