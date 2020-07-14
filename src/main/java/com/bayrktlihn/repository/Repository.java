package com.bayrktlihn.repository;

import java.util.List;

public interface Repository<TABLE, ID> {
	TABLE save(TABLE value);

	List<TABLE> findAll();

	void deleteById(ID id);
	
	TABLE findById(ID id);
}
