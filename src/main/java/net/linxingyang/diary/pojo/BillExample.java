package net.linxingyang.diary.pojo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BillExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private Integer limit;

    private Integer offset;

    public BillExample() {
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

        public Criteria andBillDateIsNull() {
            addCriterion("bill_date is null");
            return (Criteria) this;
        }

        public Criteria andBillDateIsNotNull() {
            addCriterion("bill_date is not null");
            return (Criteria) this;
        }

        public Criteria andBillDateEqualTo(Date value) {
            addCriterion("bill_date =", value, "billDate");
            return (Criteria) this;
        }

        public Criteria andBillDateNotEqualTo(Date value) {
            addCriterion("bill_date <>", value, "billDate");
            return (Criteria) this;
        }

        public Criteria andBillDateGreaterThan(Date value) {
            addCriterion("bill_date >", value, "billDate");
            return (Criteria) this;
        }

        public Criteria andBillDateGreaterThanOrEqualTo(Date value) {
            addCriterion("bill_date >=", value, "billDate");
            return (Criteria) this;
        }

        public Criteria andBillDateLessThan(Date value) {
            addCriterion("bill_date <", value, "billDate");
            return (Criteria) this;
        }

        public Criteria andBillDateLessThanOrEqualTo(Date value) {
            addCriterion("bill_date <=", value, "billDate");
            return (Criteria) this;
        }

        public Criteria andBillDateIn(List<Date> values) {
            addCriterion("bill_date in", values, "billDate");
            return (Criteria) this;
        }

        public Criteria andBillDateNotIn(List<Date> values) {
            addCriterion("bill_date not in", values, "billDate");
            return (Criteria) this;
        }

        public Criteria andBillDateBetween(Date value1, Date value2) {
            addCriterion("bill_date between", value1, value2, "billDate");
            return (Criteria) this;
        }

        public Criteria andBillDateNotBetween(Date value1, Date value2) {
            addCriterion("bill_date not between", value1, value2, "billDate");
            return (Criteria) this;
        }

        public Criteria andCostTypeIsNull() {
            addCriterion("cost_type is null");
            return (Criteria) this;
        }

        public Criteria andCostTypeIsNotNull() {
            addCriterion("cost_type is not null");
            return (Criteria) this;
        }

        public Criteria andCostTypeEqualTo(Integer value) {
            addCriterion("cost_type =", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeNotEqualTo(Integer value) {
            addCriterion("cost_type <>", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeGreaterThan(Integer value) {
            addCriterion("cost_type >", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("cost_type >=", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeLessThan(Integer value) {
            addCriterion("cost_type <", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeLessThanOrEqualTo(Integer value) {
            addCriterion("cost_type <=", value, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeIn(List<Integer> values) {
            addCriterion("cost_type in", values, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeNotIn(List<Integer> values) {
            addCriterion("cost_type not in", values, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeBetween(Integer value1, Integer value2) {
            addCriterion("cost_type between", value1, value2, "costType");
            return (Criteria) this;
        }

        public Criteria andCostTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("cost_type not between", value1, value2, "costType");
            return (Criteria) this;
        }

        public Criteria andCostMoneyIsNull() {
            addCriterion("cost_money is null");
            return (Criteria) this;
        }

        public Criteria andCostMoneyIsNotNull() {
            addCriterion("cost_money is not null");
            return (Criteria) this;
        }

        public Criteria andCostMoneyEqualTo(BigDecimal value) {
            addCriterion("cost_money =", value, "costMoney");
            return (Criteria) this;
        }

        public Criteria andCostMoneyNotEqualTo(BigDecimal value) {
            addCriterion("cost_money <>", value, "costMoney");
            return (Criteria) this;
        }

        public Criteria andCostMoneyGreaterThan(BigDecimal value) {
            addCriterion("cost_money >", value, "costMoney");
            return (Criteria) this;
        }

        public Criteria andCostMoneyGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("cost_money >=", value, "costMoney");
            return (Criteria) this;
        }

        public Criteria andCostMoneyLessThan(BigDecimal value) {
            addCriterion("cost_money <", value, "costMoney");
            return (Criteria) this;
        }

        public Criteria andCostMoneyLessThanOrEqualTo(BigDecimal value) {
            addCriterion("cost_money <=", value, "costMoney");
            return (Criteria) this;
        }

        public Criteria andCostMoneyIn(List<BigDecimal> values) {
            addCriterion("cost_money in", values, "costMoney");
            return (Criteria) this;
        }

        public Criteria andCostMoneyNotIn(List<BigDecimal> values) {
            addCriterion("cost_money not in", values, "costMoney");
            return (Criteria) this;
        }

        public Criteria andCostMoneyBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("cost_money between", value1, value2, "costMoney");
            return (Criteria) this;
        }

        public Criteria andCostMoneyNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("cost_money not between", value1, value2, "costMoney");
            return (Criteria) this;
        }

        public Criteria andPayTypeIsNull() {
            addCriterion("pay_type is null");
            return (Criteria) this;
        }

        public Criteria andPayTypeIsNotNull() {
            addCriterion("pay_type is not null");
            return (Criteria) this;
        }

        public Criteria andPayTypeEqualTo(Integer value) {
            addCriterion("pay_type =", value, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeNotEqualTo(Integer value) {
            addCriterion("pay_type <>", value, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeGreaterThan(Integer value) {
            addCriterion("pay_type >", value, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("pay_type >=", value, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeLessThan(Integer value) {
            addCriterion("pay_type <", value, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeLessThanOrEqualTo(Integer value) {
            addCriterion("pay_type <=", value, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeIn(List<Integer> values) {
            addCriterion("pay_type in", values, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeNotIn(List<Integer> values) {
            addCriterion("pay_type not in", values, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeBetween(Integer value1, Integer value2) {
            addCriterion("pay_type between", value1, value2, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("pay_type not between", value1, value2, "payType");
            return (Criteria) this;
        }

        public Criteria andPayWayIsNull() {
            addCriterion("pay_way is null");
            return (Criteria) this;
        }

        public Criteria andPayWayIsNotNull() {
            addCriterion("pay_way is not null");
            return (Criteria) this;
        }

        public Criteria andPayWayEqualTo(Integer value) {
            addCriterion("pay_way =", value, "payWay");
            return (Criteria) this;
        }

        public Criteria andPayWayNotEqualTo(Integer value) {
            addCriterion("pay_way <>", value, "payWay");
            return (Criteria) this;
        }

        public Criteria andPayWayGreaterThan(Integer value) {
            addCriterion("pay_way >", value, "payWay");
            return (Criteria) this;
        }

        public Criteria andPayWayGreaterThanOrEqualTo(Integer value) {
            addCriterion("pay_way >=", value, "payWay");
            return (Criteria) this;
        }

        public Criteria andPayWayLessThan(Integer value) {
            addCriterion("pay_way <", value, "payWay");
            return (Criteria) this;
        }

        public Criteria andPayWayLessThanOrEqualTo(Integer value) {
            addCriterion("pay_way <=", value, "payWay");
            return (Criteria) this;
        }

        public Criteria andPayWayIn(List<Integer> values) {
            addCriterion("pay_way in", values, "payWay");
            return (Criteria) this;
        }

        public Criteria andPayWayNotIn(List<Integer> values) {
            addCriterion("pay_way not in", values, "payWay");
            return (Criteria) this;
        }

        public Criteria andPayWayBetween(Integer value1, Integer value2) {
            addCriterion("pay_way between", value1, value2, "payWay");
            return (Criteria) this;
        }

        public Criteria andPayWayNotBetween(Integer value1, Integer value2) {
            addCriterion("pay_way not between", value1, value2, "payWay");
            return (Criteria) this;
        }

        public Criteria andUseToIsNull() {
            addCriterion("use_to is null");
            return (Criteria) this;
        }

        public Criteria andUseToIsNotNull() {
            addCriterion("use_to is not null");
            return (Criteria) this;
        }

        public Criteria andUseToEqualTo(String value) {
            addCriterion("use_to =", value, "useTo");
            return (Criteria) this;
        }

        public Criteria andUseToNotEqualTo(String value) {
            addCriterion("use_to <>", value, "useTo");
            return (Criteria) this;
        }

        public Criteria andUseToGreaterThan(String value) {
            addCriterion("use_to >", value, "useTo");
            return (Criteria) this;
        }

        public Criteria andUseToGreaterThanOrEqualTo(String value) {
            addCriterion("use_to >=", value, "useTo");
            return (Criteria) this;
        }

        public Criteria andUseToLessThan(String value) {
            addCriterion("use_to <", value, "useTo");
            return (Criteria) this;
        }

        public Criteria andUseToLessThanOrEqualTo(String value) {
            addCriterion("use_to <=", value, "useTo");
            return (Criteria) this;
        }

        public Criteria andUseToLike(String value) {
            addCriterion("use_to like", value, "useTo");
            return (Criteria) this;
        }

        public Criteria andUseToNotLike(String value) {
            addCriterion("use_to not like", value, "useTo");
            return (Criteria) this;
        }

        public Criteria andUseToIn(List<String> values) {
            addCriterion("use_to in", values, "useTo");
            return (Criteria) this;
        }

        public Criteria andUseToNotIn(List<String> values) {
            addCriterion("use_to not in", values, "useTo");
            return (Criteria) this;
        }

        public Criteria andUseToBetween(String value1, String value2) {
            addCriterion("use_to between", value1, value2, "useTo");
            return (Criteria) this;
        }

        public Criteria andUseToNotBetween(String value1, String value2) {
            addCriterion("use_to not between", value1, value2, "useTo");
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