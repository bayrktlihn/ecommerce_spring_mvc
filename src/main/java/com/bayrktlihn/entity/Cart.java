package com.bayrktlihn.entity;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Cart {

	private List<CartItem> cartItems = new ArrayList<CartItem>();

	public double getTotalPrice() {
		double totalPrice = 0;

		for (CartItem carItem : cartItems) {
			totalPrice += carItem.getProduct().getPrice() * carItem.getQuantity();
		}

		return totalPrice;

	}

	public void addCartItem(Product product, int quantity) {

		Optional<CartItem> finded = cartItems.stream().filter(carItem -> {
			return carItem.getProduct().getId() == product.getId();
		}).collect(Collectors.toList()).stream().findFirst();

		if (finded.isEmpty()) {
			CartItem cartItem = new CartItem();
			cartItem.setProduct(product);
			cartItem.setQuantity(quantity);
			cartItems.add(cartItem);
		} else {
			CartItem cartItem = finded.get();
			cartItem.setQuantity(cartItem.getQuantity() + quantity);
		}

	}

	public void deleteCartItemByProductId(Product product) {

		for (int i = 0; i < cartItems.size(); i++) {
			CartItem cartItem = cartItems.get(i);
			if (cartItem.getProduct().getId() == product.getId()) {
				cartItems.remove(i);
				break;
			}
		}

	}

}
