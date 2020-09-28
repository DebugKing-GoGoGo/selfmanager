package net.linxingyang.book.pojo;

import java.util.Date;

public class Booklist {
    private Integer id;

    private Integer year;

    private String bookName;

    private String author;

    private Integer state;

    private String readingThinking;

    private Integer discard;

    private Date createDate;

    private Date modifyDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName == null ? null : bookName.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getReadingThinking() {
        return readingThinking;
    }

    public void setReadingThinking(String readingThinking) {
        this.readingThinking = readingThinking == null ? null : readingThinking.trim();
    }

    public Integer getDiscard() {
        return discard;
    }

    public void setDiscard(Integer discard) {
        this.discard = discard;
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