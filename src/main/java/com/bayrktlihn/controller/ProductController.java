package com.bayrktlihn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bayrktlihn.entity.Product;
import com.bayrktlihn.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService productService;

	@GetMapping
	public String productList(Model model, @RequestParam(required = false) String overUnit) {
		
		if(overUnit != null) {
			model.addAttribute("overUnit", "error");
		}

		model.addAttribute("products", productService.findAll());

		return "productList";
	}

	@GetMapping("/{id}")
	public String product(@PathVariable int id, Model model) {

		Product product = productService.findById(id);

		if (product != null) {
			model.addAttribute("product", productService.findById(id));
		} else {
			return "redirect:/product";
		}

		return "product";

	}
	
	

}
