package com.bayrktlihn.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@NotNull
	@NotEmpty(message = "The product name must not be null")
	private String name;
	@Enumerated(EnumType.STRING)
	private Category category;
	private String description;
	@Min(value = 0, message = "The product price must not be less than zero.")
	private double price;
	@Enumerated(EnumType.STRING)
	private Condition cndition;
	@Enumerated(EnumType.STRING)
	private Status status;
	@Column(name = "unit_in_stock")
	@Min(value = 0, message = "The product unit must not be less than zero.")
	private int unitInStock;
	private String manufacturer;

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "Product_File", joinColumns = @JoinColumn(name = "product_id"), inverseJoinColumns = {
			@JoinColumn(name = "file_path") })
	private List<File> files;

	@Transient
	private MultipartFile image;

	public Product() {

		files = new ArrayList<File>();
	}

}
