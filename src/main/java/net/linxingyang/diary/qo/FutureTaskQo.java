package net.linxingyang.diary.qo;import net.linxingyang.diary.pojo.FutureTask;public class FutureTaskQo extends FutureTask{    private Integer page;    private Integer limit;    private String orderBy;            public String getOrderBy() {        return orderBy;    }    public void setOrderBy(String orderBy) {        this.orderBy = orderBy;    }    public void setPage(Integer page) {        this.page = page;    }         public Integer getPage() {        return this.page;    }        public void setLimit(Integer limit) {        this.limit = limit;    }        public Integer getLimit() {        return this.limit;        }    }