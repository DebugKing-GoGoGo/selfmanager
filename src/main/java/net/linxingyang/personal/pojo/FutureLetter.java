package net.linxingyang.personal.pojo;

import java.util.Date;

public class FutureLetter {
    private Integer id;

    private Date writeDate;

    private Date readDate;

    private String afterReadFeeling;

    private Integer state;

    private Date createDate;

    private Date modifyDate;

    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getWriteDate() {
        return writeDate;
    }

    public void setWriteDate(Date writeDate) {
        this.writeDate = writeDate;
    }

    public Date getReadDate() {
        return readDate;
    }

    public void setReadDate(Date readDate) {
        this.readDate = readDate;
    }

    public String getAfterReadFeeling() {
        return afterReadFeeling;
    }

    public void setAfterReadFeeling(String afterReadFeeling) {
        this.afterReadFeeling = afterReadFeeling == null ? null : afterReadFeeling.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}