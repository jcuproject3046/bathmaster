package com.path.repository.hql;

import java.util.Collection;

import org.hibernate.criterion.MatchMode;
import org.springframework.util.StringUtils;

import com.path.repository.hql.Criterion.Operator;


/** 
 * 条件构造器 
 * 用于创建条件表达式 
 * @Class Name Restrictions 
 * @Author lee 
 */
public class Restrictions {
	
	
	
	  public static SimpleRelateExpression eq_r(String fieldName1, String fieldName2, boolean ignoreNull) {  
	        //if(StringUtils.isEmpty(fieldName2))return null;  
	        return new SimpleRelateExpression (fieldName1, fieldName2, Operator.EQ_R);  
	   }  
	  
	  public static SimpleRelateExpression NE_R(String fieldName1, String fieldName2, boolean ignoreNull) {  
	        //if(StringUtils.isEmpty(value))return null;  
	        return new SimpleRelateExpression (fieldName1, fieldName2, Operator.NE_R);  
	   }
  
	  /** 
	     * 等于 
	     * @param fieldName 
	     * @param value 
	     * @param ignoreNull 
	     * @return 
	     */  
    public static SimpleExpression eq(String fieldName, Object value, boolean ignoreNull) {  
        if(StringUtils.isEmpty(value))return null;  
        return new SimpleExpression (fieldName, value, Operator.EQ);  
    }  
      
    /** 
     * 不等于
     * @param fieldName 
     * @param value 
     * @param ignoreNull 
     * @return 
     */  
    public static SimpleExpression ne(String fieldName, Object value, boolean ignoreNull) {  
        if(StringUtils.isEmpty(value))return null;  
        return new SimpleExpression (fieldName, value, Operator.NE);  
    }  
  
    /** 
     * 模糊匹配 
     * @param fieldName 
     * @param value 
     * @param ignoreNull 
     * @return 
     */  
    public static SimpleExpression like(String fieldName, String value, boolean ignoreNull) {  
        if(StringUtils.isEmpty(value))return null;  
        return new SimpleExpression (fieldName, value, Operator.LIKE);  
    }  
  
    /** 
     *  
     * @param fieldName 
     * @param value 
     * @param matchMode 
     * @param ignoreNull 
     * @return 
     */  
    public static SimpleExpression like(String fieldName, String value,  
            MatchMode matchMode, boolean ignoreNull) {  
        if(StringUtils.isEmpty(value))return null;  
        return null;  
    }  
  
    /** 
     * 大于 
     * @param fieldName 
     * @param value 
     * @param ignoreNull 
     * @return 
     */  
    public static SimpleExpression gt(String fieldName, Object value, boolean ignoreNull) {  
        if(StringUtils.isEmpty(value))return null;  
        return new SimpleExpression (fieldName, value, Operator.GT);  
    }  
  
    /** 
     * 小于 
     * @param fieldName 
     * @param value 
     * @param ignoreNull 
     * @return 
     */  
    public static SimpleExpression lt(String fieldName, Object value, boolean ignoreNull) {  
        if(StringUtils.isEmpty(value))return null;  
        return new SimpleExpression (fieldName, value, Operator.LT);  
    }  
  
    /** 
     * 小于等于 
     * @param fieldName 
     * @param value 
     * @param ignoreNull 
     * @return 
     */  
    public static SimpleExpression lte(String fieldName, Object value, boolean ignoreNull) {  
        if(StringUtils.isEmpty(value))return null;  
        return new SimpleExpression (fieldName, value, Operator.LTE);  
    }  
  
    /** 
     * 大于等于 
     * @param fieldName 
     * @param value 
     * @param ignoreNull 
     * @return 
     */  
    public static SimpleExpression gte(String fieldName, Object value, boolean ignoreNull) {  
        if(StringUtils.isEmpty(value))return null;  
        return new SimpleExpression(fieldName, value, Operator.GTE);  
    }  
    
    /**
     * 
     * @param fieldName
     * @param value
     * @param ignoreNull
     * @return
     */
    public static SimpleExpression asc(String fieldName, Object value, boolean ignoreNull) {  
        //if(StringUtils.isEmpty(value))return null;  
        return new SimpleExpression (fieldName, value, Operator.ASC);  
    }
    
    public static SimpleExpression desc(String fieldName, Object value, boolean ignoreNull) {  
        //if(StringUtils.isEmpty(value))return null;  
        return new SimpleExpression (fieldName, value, Operator.DESC);  
    }

  
    /** 
     * 并且 
     * @param criterions 
     * @return 
     */  
    public static LogicalExpression and(Criterion... criterions){  
        return new LogicalExpression(criterions, Operator.AND);  
    }  
    /** 
     * 或者 
     * @param criterions 
     * @return 
     */  
    public static LogicalExpression or(Criterion... criterions){  
        return new LogicalExpression(criterions, Operator.OR);  
    }  
    /** 
     * 包含于 
     * @param fieldName 
     * @param value 
     * @return 
     */  
    @SuppressWarnings("rawtypes")  
    public static LogicalExpression in(String fieldName, Collection value, boolean ignoreNull) {  
        if(ignoreNull&&(value==null||value.isEmpty())){  
            return null;  
        }  
        SimpleExpression[] ses = new SimpleExpression[value.size()];  
        int i=0;  
        for(Object obj : value){  
            ses[i]=new SimpleExpression(fieldName,obj,Operator.EQ);  
            i++;  
        }  
        return new LogicalExpression(ses,Operator.OR);  
    }  
}  
