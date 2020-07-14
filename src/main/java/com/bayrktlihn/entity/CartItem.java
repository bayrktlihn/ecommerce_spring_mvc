package com.bayrktlihn.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartItem {
	private Product product;
	private int quantity;
}
