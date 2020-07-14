package com.bayrktlihn.repository.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bayrktlihn.entity.Product;
import com.bayrktlihn.repository.ProductRepository;

@Repository
public class ProductRepositoryImpl implements ProductRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Product save(Product value) {

		getSession().saveOrUpdate(value);

		return value;
	}

	@Override
	public List<Product> findAll() {

		return getSession().createQuery("from Product", Product.class).list();

	}

	@Override
	public void deleteById(Integer id) {
		Product product = new Product();
		product.setId(id);
		getSession().remove(product);

	}

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public Product findById(Integer id) {
		return getSession().get(Product.class, id);
	}

}
