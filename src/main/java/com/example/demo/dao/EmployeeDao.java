package com.example.demo.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.example.demo.model.Employee;

@Repository
@Transactional
public class EmployeeDao {

	@PersistenceContext
    private EntityManager entityManager;
	
	
	public void saveEmployee(Employee emp ) {
		entityManager.persist(emp);

	}
}
