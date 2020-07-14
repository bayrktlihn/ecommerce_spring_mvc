package com.bayrktlihn.service;

import java.util.List;

public interface Service<TABLE, ID> {
	TABLE save(TABLE value);

	List<TABLE> findAll();

	void deleteById(ID id);

	TABLE findById(ID id);
}
