package com.path.repository.hql;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import javax.persistence.criteria.Order;
import org.springframework.data.jpa.domain.Specification;

public class Criteria<T> implements Specification<T> {
	private List<Criterion> criterions = new ArrayList<Criterion>();

	public Predicate toPredicate(Root<T> root, CriteriaQuery<?> query,
			CriteriaBuilder builder) {
		if (!criterions.isEmpty()) {
			List<Predicate> predicates = new ArrayList<Predicate>();
			for (Criterion c : criterions) {
				Predicate p = c.toPredicate(root, query, builder);
				if (p != null) {
					predicates.add(p);
				}
			}

			List<Order> orders = new ArrayList<Order>();
			for (Criterion c : criterions) {
				Order o = c.toOrder(root, query, builder);
				if(o!=null){
					orders.add(o);
				}
				
			}

			// c.add(Restrictions.eq("tbFlight.fvacancy","fvacancy", true));
			// Path x= root.get("tbFlight.fvacancy");
			// Path y= root.get("fvacancy");
			// builder.(x, y);
			// 将所有条件用 and 联合起来
			if (orders != null && orders.size() > 0) {
				query.orderBy(orders);
				builder.conjunction();
			}
			if (predicates.size() > 0) {
				return builder.and(predicates.toArray(new Predicate[predicates
						.size()]));
			}

		}
		return builder.conjunction();
	}

	   /** 
     * 增加简单条件表达式 
     * @Methods Name add 
     * @Create In 2012-2-8 By lee 
     * @param expression0 void 
     */  
	public void add(Criterion criterion) {
		if (criterion != null) {
			criterions.add(criterion);
		}
	}
}