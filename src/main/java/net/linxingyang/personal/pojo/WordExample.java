package net.linxingyang.personal.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class WordExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private Integer limit;

    private Integer offset;

    public WordExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getOffset() {
        return offset;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andWordIsNull() {
            addCriterion("word is null");
            return (Criteria) this;
        }

        public Criteria andWordIsNotNull() {
            addCriterion("word is not null");
            return (Criteria) this;
        }

        public Criteria andWordEqualTo(String value) {
            addCriterion("word =", value, "word");
            return (Criteria) this;
        }

        public Criteria andWordNotEqualTo(String value) {
            addCriterion("word <>", value, "word");
            return (Criteria) this;
        }

        public Criteria andWordGreaterThan(String value) {
            addCriterion("word >", value, "word");
            return (Criteria) this;
        }

        public Criteria andWordGreaterThanOrEqualTo(String value) {
            addCriterion("word >=", value, "word");
            return (Criteria) this;
        }

        public Criteria andWordLessThan(String value) {
            addCriterion("word <", value, "word");
            return (Criteria) this;
        }

        public Criteria andWordLessThanOrEqualTo(String value) {
            addCriterion("word <=", value, "word");
            return (Criteria) this;
        }

        public Criteria andWordLike(String value) {
            addCriterion("word like", value, "word");
            return (Criteria) this;
        }

        public Criteria andWordNotLike(String value) {
            addCriterion("word not like", value, "word");
            return (Criteria) this;
        }

        public Criteria andWordIn(List<String> values) {
            addCriterion("word in", values, "word");
            return (Criteria) this;
        }

        public Criteria andWordNotIn(List<String> values) {
            addCriterion("word not in", values, "word");
            return (Criteria) this;
        }

        public Criteria andWordBetween(String value1, String value2) {
            addCriterion("word between", value1, value2, "word");
            return (Criteria) this;
        }

        public Criteria andWordNotBetween(String value1, String value2) {
            addCriterion("word not between", value1, value2, "word");
            return (Criteria) this;
        }

        public Criteria andFromWhoIsNull() {
            addCriterion("from_who is null");
            return (Criteria) this;
        }

        public Criteria andFromWhoIsNotNull() {
            addCriterion("from_who is not null");
            return (Criteria) this;
        }

        public Criteria andFromWhoEqualTo(String value) {
            addCriterion("from_who =", value, "fromWho");
            return (Criteria) this;
        }

        public Criteria andFromWhoNotEqualTo(String value) {
            addCriterion("from_who <>", value, "fromWho");
            return (Criteria) this;
        }

        public Criteria andFromWhoGreaterThan(String value) {
            addCriterion("from_who >", value, "fromWho");
            return (Criteria) this;
        }

        public Criteria andFromWhoGreaterThanOrEqualTo(String value) {
            addCriterion("from_who >=", value, "fromWho");
            return (Criteria) this;
        }

        public Criteria andFromWhoLessThan(String value) {
            addCriterion("from_who <", value, "fromWho");
            return (Criteria) this;
        }

        public Criteria andFromWhoLessThanOrEqualTo(String value) {
            addCriterion("from_who <=", value, "fromWho");
            return (Criteria) this;
        }

        public Criteria andFromWhoLike(String value) {
            addCriterion("from_who like", value, "fromWho");
            return (Criteria) this;
        }

        public Criteria andFromWhoNotLike(String value) {
            addCriterion("from_who not like", value, "fromWho");
            return (Criteria) this;
        }

        public Criteria andFromWhoIn(List<String> values) {
            addCriterion("from_who in", values, "fromWho");
            return (Criteria) this;
        }

        public Criteria andFromWhoNotIn(List<String> values) {
            addCriterion("from_who not in", values, "fromWho");
            return (Criteria) this;
        }

        public Criteria andFromWhoBetween(String value1, String value2) {
            addCriterion("from_who between", value1, value2, "fromWho");
            return (Criteria) this;
        }

        public Criteria andFromWhoNotBetween(String value1, String value2) {
            addCriterion("from_who not between", value1, value2, "fromWho");
            return (Criteria) this;
        }

        public Criteria andLikePercentIsNull() {
            addCriterion("like_percent is null");
            return (Criteria) this;
        }

        public Criteria andLikePercentIsNotNull() {
            addCriterion("like_percent is not null");
            return (Criteria) this;
        }

        public Criteria andLikePercentEqualTo(Integer value) {
            addCriterion("like_percent =", value, "likePercent");
            return (Criteria) this;
        }

        public Criteria andLikePercentNotEqualTo(Integer value) {
            addCriterion("like_percent <>", value, "likePercent");
            return (Criteria) this;
        }

        public Criteria andLikePercentGreaterThan(Integer value) {
            addCriterion("like_percent >", value, "likePercent");
            return (Criteria) this;
        }

        public Criteria andLikePercentGreaterThanOrEqualTo(Integer value) {
            addCriterion("like_percent >=", value, "likePercent");
            return (Criteria) this;
        }

        public Criteria andLikePercentLessThan(Integer value) {
            addCriterion("like_percent <", value, "likePercent");
            return (Criteria) this;
        }

        public Criteria andLikePercentLessThanOrEqualTo(Integer value) {
            addCriterion("like_percent <=", value, "likePercent");
            return (Criteria) this;
        }

        public Criteria andLikePercentIn(List<Integer> values) {
            addCriterion("like_percent in", values, "likePercent");
            return (Criteria) this;
        }

        public Criteria andLikePercentNotIn(List<Integer> values) {
            addCriterion("like_percent not in", values, "likePercent");
            return (Criteria) this;
        }

        public Criteria andLikePercentBetween(Integer value1, Integer value2) {
            addCriterion("like_percent between", value1, value2, "likePercent");
            return (Criteria) this;
        }

        public Criteria andLikePercentNotBetween(Integer value1, Integer value2) {
            addCriterion("like_percent not between", value1, value2, "likePercent");
            return (Criteria) this;
        }

        public Criteria andDiscardIsNull() {
            addCriterion("discard is null");
            return (Criteria) this;
        }

        public Criteria andDiscardIsNotNull() {
            addCriterion("discard is not null");
            return (Criteria) this;
        }

        public Criteria andDiscardEqualTo(Integer value) {
            addCriterion("discard =", value, "discard");
            return (Criteria) this;
        }

        public Criteria andDiscardNotEqualTo(Integer value) {
            addCriterion("discard <>", value, "discard");
            return (Criteria) this;
        }

        public Criteria andDiscardGreaterThan(Integer value) {
            addCriterion("discard >", value, "discard");
            return (Criteria) this;
        }

        public Criteria andDiscardGreaterThanOrEqualTo(Integer value) {
            addCriterion("discard >=", value, "discard");
            return (Criteria) this;
        }

        public Criteria andDiscardLessThan(Integer value) {
            addCriterion("discard <", value, "discard");
            return (Criteria) this;
        }

        public Criteria andDiscardLessThanOrEqualTo(Integer value) {
            addCriterion("discard <=", value, "discard");
            return (Criteria) this;
        }

        public Criteria andDiscardIn(List<Integer> values) {
            addCriterion("discard in", values, "discard");
            return (Criteria) this;
        }

        public Criteria andDiscardNotIn(List<Integer> values) {
            addCriterion("discard not in", values, "discard");
            return (Criteria) this;
        }

        public Criteria andDiscardBetween(Integer value1, Integer value2) {
            addCriterion("discard between", value1, value2, "discard");
            return (Criteria) this;
        }

        public Criteria andDiscardNotBetween(Integer value1, Integer value2) {
            addCriterion("discard not between", value1, value2, "discard");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNull() {
            addCriterion("remark is null");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNotNull() {
            addCriterion("remark is not null");
            return (Criteria) this;
        }

        public Criteria andRemarkEqualTo(String value) {
            addCriterion("remark =", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotEqualTo(String value) {
            addCriterion("remark <>", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThan(String value) {
            addCriterion("remark >", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThanOrEqualTo(String value) {
            addCriterion("remark >=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThan(String value) {
            addCriterion("remark <", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThanOrEqualTo(String value) {
            addCriterion("remark <=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLike(String value) {
            addCriterion("remark like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotLike(String value) {
            addCriterion("remark not like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkIn(List<String> values) {
            addCriterion("remark in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotIn(List<String> values) {
            addCriterion("remark not in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkBetween(String value1, String value2) {
            addCriterion("remark between", value1, value2, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotBetween(String value1, String value2) {
            addCriterion("remark not between", value1, value2, "remark");
            return (Criteria) this;
        }

        public Criteria andCreateDateIsNull() {
            addCriterion("create_date is null");
            return (Criteria) this;
        }

        public Criteria andCreateDateIsNotNull() {
            addCriterion("create_date is not null");
            return (Criteria) this;
        }

        public Criteria andCreateDateEqualTo(Date value) {
            addCriterion("create_date =", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotEqualTo(Date value) {
            addCriterion("create_date <>", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateGreaterThan(Date value) {
            addCriterion("create_date >", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateGreaterThanOrEqualTo(Date value) {
            addCriterion("create_date >=", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateLessThan(Date value) {
            addCriterion("create_date <", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateLessThanOrEqualTo(Date value) {
            addCriterion("create_date <=", value, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateIn(List<Date> values) {
            addCriterion("create_date in", values, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotIn(List<Date> values) {
            addCriterion("create_date not in", values, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateBetween(Date value1, Date value2) {
            addCriterion("create_date between", value1, value2, "createDate");
            return (Criteria) this;
        }

        public Criteria andCreateDateNotBetween(Date value1, Date value2) {
            addCriterion("create_date not between", value1, value2, "createDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateIsNull() {
            addCriterion("modify_date is null");
            return (Criteria) this;
        }

        public Criteria andModifyDateIsNotNull() {
            addCriterion("modify_date is not null");
            return (Criteria) this;
        }

        public Criteria andModifyDateEqualTo(Date value) {
            addCriterion("modify_date =", value, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateNotEqualTo(Date value) {
            addCriterion("modify_date <>", value, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateGreaterThan(Date value) {
            addCriterion("modify_date >", value, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateGreaterThanOrEqualTo(Date value) {
            addCriterion("modify_date >=", value, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateLessThan(Date value) {
            addCriterion("modify_date <", value, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateLessThanOrEqualTo(Date value) {
            addCriterion("modify_date <=", value, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateIn(List<Date> values) {
            addCriterion("modify_date in", values, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateNotIn(List<Date> values) {
            addCriterion("modify_date not in", values, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateBetween(Date value1, Date value2) {
            addCriterion("modify_date between", value1, value2, "modifyDate");
            return (Criteria) this;
        }

        public Criteria andModifyDateNotBetween(Date value1, Date value2) {
            addCriterion("modify_date not between", value1, value2, "modifyDate");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}