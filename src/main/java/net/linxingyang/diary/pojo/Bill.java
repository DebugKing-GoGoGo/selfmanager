package net.linxingyang.diary.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class Bill {
    private Integer id;

    private Date billDate;

    private Integer costType;

    private BigDecimal costMoney;

    private Integer payType;

    private Integer payWay;

    private String useTo;

    private Date createDate;

    private Date modifyDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getBillDate() {
        return billDate;
    }

    public void setBillDate(Date billDate) {
        this.billDate = billDate;
    }

    public Integer getCostType() {
        return costType;
    }

    public void setCostType(Integer costType) {
        this.costType = costType;
    }

    public BigDecimal getCostMoney() {
        return costMoney;
    }

    public void setCostMoney(BigDecimal costMoney) {
        this.costMoney = costMoney;
    }

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    public Integer getPayWay() {
        return payWay;
    }

    public void setPayWay(Integer payWay) {
        this.payWay = payWay;
    }

    public String getUseTo() {
        return useTo;
    }

    public void setUseTo(String useTo) {
        this.useTo = useTo == null ? null : useTo.trim();
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