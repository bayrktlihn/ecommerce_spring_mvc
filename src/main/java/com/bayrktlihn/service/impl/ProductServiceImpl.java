package com.bayrktlihn.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bayrktlihn.entity.Product;
import com.bayrktlihn.repository.ProductRepository;
import com.bayrktlihn.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductRepository productRepository;

	@Transactional
	@Override
	public Product save(Product value) {
		return productRepository.save(value);
	}

	@Transactional
	@Override
	public List<Product> findAll() {
		return productRepository.findAll();
	}

	@Transactional
	@Override
	public void deleteById(Integer id) {
		productRepository.deleteById(id);
	}

	@Transactional
	@Override
	public Product findById(Integer id) {
		return productRepository.findById(id);
	}

}
