package net.linxingyang.diary.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TaskExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private Integer limit;

    private Integer offset;

    public TaskExample() {
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

        public Criteria andPrivilegeIsNull() {
            addCriterion("privilege is null");
            return (Criteria) this;
        }

        public Criteria andPrivilegeIsNotNull() {
            addCriterion("privilege is not null");
            return (Criteria) this;
        }

        public Criteria andPrivilegeEqualTo(Integer value) {
            addCriterion("privilege =", value, "privilege");
            return (Criteria) this;
        }

        public Criteria andPrivilegeNotEqualTo(Integer value) {
            addCriterion("privilege <>", value, "privilege");
            return (Criteria) this;
        }

        public Criteria andPrivilegeGreaterThan(Integer value) {
            addCriterion("privilege >", value, "privilege");
            return (Criteria) this;
        }

        public Criteria andPrivilegeGreaterThanOrEqualTo(Integer value) {
            addCriterion("privilege >=", value, "privilege");
            return (Criteria) this;
        }

        public Criteria andPrivilegeLessThan(Integer value) {
            addCriterion("privilege <", value, "privilege");
            return (Criteria) this;
        }

        public Criteria andPrivilegeLessThanOrEqualTo(Integer value) {
            addCriterion("privilege <=", value, "privilege");
            return (Criteria) this;
        }

        public Criteria andPrivilegeIn(List<Integer> values) {
            addCriterion("privilege in", values, "privilege");
            return (Criteria) this;
        }

        public Criteria andPrivilegeNotIn(List<Integer> values) {
            addCriterion("privilege not in", values, "privilege");
            return (Criteria) this;
        }

        public Criteria andPrivilegeBetween(Integer value1, Integer value2) {
            addCriterion("privilege between", value1, value2, "privilege");
            return (Criteria) this;
        }

        public Criteria andPrivilegeNotBetween(Integer value1, Integer value2) {
            addCriterion("privilege not between", value1, value2, "privilege");
            return (Criteria) this;
        }

        public Criteria andDefaultTimeIsNull() {
            addCriterion("default_time is null");
            return (Criteria) this;
        }

        public Criteria andDefaultTimeIsNotNull() {
            addCriterion("default_time is not null");
            return (Criteria) this;
        }

        public Criteria andDefaultTimeEqualTo(Integer value) {
            addCriterion("default_time =", value, "defaultTime");
            return (Criteria) this;
        }

        public Criteria andDefaultTimeNotEqualTo(Integer value) {
            addCriterion("default_time <>", value, "defaultTime");
            return (Criteria) this;
        }

        public Criteria andDefaultTimeGreaterThan(Integer value) {
            addCriterion("default_time >", value, "defaultTime");
            return (Criteria) this;
        }

        public Criteria andDefaultTimeGreaterThanOrEqualTo(Integer value) {
            addCriterion("default_time >=", value, "defaultTime");
            return (Criteria) this;
        }

        public Criteria andDefaultTimeLessThan(Integer value) {
            addCriterion("default_time <", value, "defaultTime");
            return (Criteria) this;
        }

        public Criteria andDefaultTimeLessThanOrEqualTo(Integer value) {
            addCriterion("default_time <=", value, "defaultTime");
            return (Criteria) this;
        }

        public Criteria andDefaultTimeIn(List<Integer> values) {
            addCriterion("default_time in", values, "defaultTime");
            return (Criteria) this;
        }

        public Criteria andDefaultTimeNotIn(List<Integer> values) {
            addCriterion("default_time not in", values, "defaultTime");
            return (Criteria) this;
        }

        public Criteria andDefaultTimeBetween(Integer value1, Integer value2) {
            addCriterion("default_time between", value1, value2, "defaultTime");
            return (Criteria) this;
        }

        public Criteria andDefaultTimeNotBetween(Integer value1, Integer value2) {
            addCriterion("default_time not between", value1, value2, "defaultTime");
            return (Criteria) this;
        }

        public Criteria andTaskNameIsNull() {
            addCriterion("task_name is null");
            return (Criteria) this;
        }

        public Criteria andTaskNameIsNotNull() {
            addCriterion("task_name is not null");
            return (Criteria) this;
        }

        public Criteria andTaskNameEqualTo(String value) {
            addCriterion("task_name =", value, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameNotEqualTo(String value) {
            addCriterion("task_name <>", value, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameGreaterThan(String value) {
            addCriterion("task_name >", value, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameGreaterThanOrEqualTo(String value) {
            addCriterion("task_name >=", value, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameLessThan(String value) {
            addCriterion("task_name <", value, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameLessThanOrEqualTo(String value) {
            addCriterion("task_name <=", value, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameLike(String value) {
            addCriterion("task_name like", value, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameNotLike(String value) {
            addCriterion("task_name not like", value, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameIn(List<String> values) {
            addCriterion("task_name in", values, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameNotIn(List<String> values) {
            addCriterion("task_name not in", values, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameBetween(String value1, String value2) {
            addCriterion("task_name between", value1, value2, "taskName");
            return (Criteria) this;
        }

        public Criteria andTaskNameNotBetween(String value1, String value2) {
            addCriterion("task_name not between", value1, value2, "taskName");
            return (Criteria) this;
        }

        public Criteria andStepIsNull() {
            addCriterion("step is null");
            return (Criteria) this;
        }

        public Criteria andStepIsNotNull() {
            addCriterion("step is not null");
            return (Criteria) this;
        }

        public Criteria andStepEqualTo(String value) {
            addCriterion("step =", value, "step");
            return (Criteria) this;
        }

        public Criteria andStepNotEqualTo(String value) {
            addCriterion("step <>", value, "step");
            return (Criteria) this;
        }

        public Criteria andStepGreaterThan(String value) {
            addCriterion("step >", value, "step");
            return (Criteria) this;
        }

        public Criteria andStepGreaterThanOrEqualTo(String value) {
            addCriterion("step >=", value, "step");
            return (Criteria) this;
        }

        public Criteria andStepLessThan(String value) {
            addCriterion("step <", value, "step");
            return (Criteria) this;
        }

        public Criteria andStepLessThanOrEqualTo(String value) {
            addCriterion("step <=", value, "step");
            return (Criteria) this;
        }

        public Criteria andStepLike(String value) {
            addCriterion("step like", value, "step");
            return (Criteria) this;
        }

        public Criteria andStepNotLike(String value) {
            addCriterion("step not like", value, "step");
            return (Criteria) this;
        }

        public Criteria andStepIn(List<String> values) {
            addCriterion("step in", values, "step");
            return (Criteria) this;
        }

        public Criteria andStepNotIn(List<String> values) {
            addCriterion("step not in", values, "step");
            return (Criteria) this;
        }

        public Criteria andStepBetween(String value1, String value2) {
            addCriterion("step between", value1, value2, "step");
            return (Criteria) this;
        }

        public Criteria andStepNotBetween(String value1, String value2) {
            addCriterion("step not between", value1, value2, "step");
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