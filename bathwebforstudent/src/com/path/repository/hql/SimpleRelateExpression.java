package com.path.repository.hql;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import javax.persistence.criteria.Order;

/**
 * 简单条件表达式 
 * 
 * @author lee
 * 
 */
public class SimpleRelateExpression implements Criterion {

	public Order toOrder(Root<?> root, CriteriaQuery<?> query,
			CriteriaBuilder builder) {
		// TODO Auto-generated method stub
		return null;
	}

	private String fieldName1; //属性名  
	private String fieldName2; //对应值
	private Operator operator; //计算符  

	protected SimpleRelateExpression(String fieldName1, String fieldName2, Operator operator) {
		this.fieldName1 = fieldName1;
		this.fieldName2 = fieldName2;
		this.operator = operator;
	}


	public String getFieldName1() {
		return fieldName1;
	}

	public void setFieldName1(String fieldName1) {
		this.fieldName1 = fieldName1;
	}

	public String getFieldName2() {
		return fieldName2;
	}

	public void setFieldName2(String fieldName2) {
		this.fieldName2 = fieldName2;
	}

	public Operator getOperator() {
		return operator;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Predicate toPredicate(Root<?> root, CriteriaQuery<?> query,
			CriteriaBuilder builder) {
		Path expression1 = null;
		if (fieldName1.contains(".")) {
			String[] names = fieldName1.split("\\.");// StringUtils.split(fieldName,
													// ".");
			expression1 = root.get(names[0]);
			for (int i = 1; i < names.length; i++) {
				expression1 = expression1.get(names[i]);
			}
		} else {
			expression1 = root.get(fieldName1);
		}
		
		
		Path expression2 = null;
		if (fieldName2.contains(".")) {
			String[] names = fieldName2.split("\\.");// StringUtils.split(fieldName,
													// ".");
			expression2 = root.get(names[1]);
			for (int i = 1; i < names.length; i++) {
				expression2 = expression1.get(names[i]);
			}
		} else {
			expression2 = root.get(fieldName2);
		}

		switch (operator) {
		case EQ_R:
			return builder.equal(expression1, expression2);
		case NE_R:
			return builder.notEqual(expression1, expression2);
		case LIKE_R:
			return builder.like((Expression<String>) expression1, "%" + expression2+ "%");
		case LT_R:
			return builder.lessThan(expression1, expression2);
		case GT_R:
			return builder.greaterThan(expression1, expression2);
		case LTE_R:
			return builder.lessThanOrEqualTo(expression1, expression2);
		case GTE_R:
			return builder.greaterThanOrEqualTo(expression1, expression2);
		default:
			return null;
		}
	}

}