package com.bayrktlihn.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bayrktlihn.entity.Cart;
import com.bayrktlihn.entity.Product;
import com.bayrktlihn.service.ProductService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private ProductService productService;

	@GetMapping
	public String showCart(HttpServletRequest request, Model model) {

		Cart cart = getCart(request);

		model.addAttribute("cartItems", cart.getCartItems());
		model.addAttribute("totalPrice", cart.getTotalPrice());

		return "cart";

	}
	
	
	

	@PostMapping("/addCartItem")
	public String addCartItem(@RequestParam int productId, @RequestParam int quantity, HttpServletRequest request,
			Model model) {

		Product product = productService.findById(productId);

		if (!(product.getUnitInStock() >= quantity)) {

			return "redirect:/product/" + productId + "?overUnit";
		}

		Cart cart = getCart(request);

		cart.addCartItem(product, quantity);

		productService.save(product);

		return "redirect:/cart";

	}

	@GetMapping("/delete/{id}")
	public String deleteCart(@PathVariable int id, HttpServletRequest request) {

		Cart cart = getCart(request);

		cart.deleteCartItemByProductId(productService.findById(id));

		return "redirect:/cart";
	}

	@GetMapping("/deleteAll")
	public String deleteAllCart(HttpServletRequest request) {

		getCart(request).getCartItems().clear();

		return "redirect:/cart";
	}

	private Cart getCart(HttpServletRequest request) {
		HttpSession session = request.getSession(true);

		if (session.getAttribute("myCart") == null) {

			session.setAttribute("myCart", new Cart());
		}

		Cart cart = (Cart) session.getAttribute("myCart");

		return cart;
		
	}

}
