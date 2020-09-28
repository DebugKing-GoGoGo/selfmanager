package net.linxingyang.personal.pojo;

import java.util.Date;

public class Word {
    private Integer id;

    private String word;

    private String fromWho;

    private Integer likePercent;

    private Integer discard;

    private String remark;

    private Date createDate;

    private Date modifyDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word == null ? null : word.trim();
    }

    public String getFromWho() {
        return fromWho;
    }

    public void setFromWho(String fromWho) {
        this.fromWho = fromWho == null ? null : fromWho.trim();
    }

    public Integer getLikePercent() {
        return likePercent;
    }

    public void setLikePercent(Integer likePercent) {
        this.likePercent = likePercent;
    }

    public Integer getDiscard() {
        return discard;
    }

    public void setDiscard(Integer discard) {
        this.discard = discard;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }
}