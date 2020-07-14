package com.bayrktlihn.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bayrktlihn.entity.Category;
import com.bayrktlihn.entity.Condition;
import com.bayrktlihn.entity.Demo;
import com.bayrktlihn.entity.File;
import com.bayrktlihn.entity.Product;
import com.bayrktlihn.entity.Status;
import com.bayrktlihn.service.ProductService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private ProductService productService;

	@GetMapping
	public String admin() {

		return "admin";
	}

	@GetMapping("/productForm")
	public String productForm(Model model) {

		Product product = new Product();

		model.addAttribute("product", product);
		model.addAttribute("conditionOptions", Arrays.asList(Condition.values()));
		model.addAttribute("categoryOptions", Arrays.asList(Category.values()));
		model.addAttribute("statusOptions", Arrays.asList(Status.values()));

		return "productForm";
	}

	@PostMapping("/product")
	public String postProduct(@ModelAttribute @Valid Product product, BindingResult bindingResult,
			HttpServletRequest request, Model model) {

		if (bindingResult.hasErrors()) {
			model.addAttribute("product", product);
			model.addAttribute("conditionOptions", Arrays.asList(Condition.values()));
			model.addAttribute("categoryOptions", Arrays.asList(Category.values()));
			model.addAttribute("statusOptions", Arrays.asList(Status.values()));
			return "productForm";
		}

		if (product.getId() == 0)
			productService.save(product);

		if (product.getFiles() != null && product.getFiles().size() == 0) {
			Product findedProduct = productService.findById(product.getId());
			product.setFiles(findedProduct.getFiles());
		}

		MultipartFile productImage = product.getImage();

		System.out.println(productImage);

		if (productImage != null && !productImage.isEmpty()) {
			try {
				
				if(product.getFiles() != null && product.getFiles().size() > 0) {
					product.getFiles().clear();
				}
				
				String rootDirectory = request.getSession().getServletContext().getRealPath("/");

				Path path = Paths.get(rootDirectory + "/WEB-INF/resources/img/" + product.getId() + ".png");
				System.out.println(path);
				productImage.transferTo(path);

				File file = new File();
				file.setPath("/img/" + product.getId() + ".png");

				product.getFiles().add(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		

		productService.save(product);

		return "redirect:/admin/product";
	}

	@GetMapping("/product")
	public String productList(Model model) {

		model.addAttribute("products", productService.findAll());

		return "productList";
	}

	@GetMapping("/delete/product/{id}")
	public String deleteProduct(@PathVariable int id, HttpServletRequest request) {

		Product findedProduct = productService.findById(id);

		System.out.println("Silme");
		for (File file : findedProduct.getFiles()) {
			System.out.println("Bulundu");
			try {
				String rootDirectory = request.getSession().getServletContext().getRealPath("/");

				Path path = Paths.get(rootDirectory + "/WEB-INF/resources" + file.getPath());

				Files.deleteIfExists(path);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		productService.deleteById(id);

		return "redirect:/admin/product";
	}

	@GetMapping("/edit/product/{id}")
	public String editProduct(@PathVariable int id, Model model) {
		Product product = productService.findById(id);

		model.addAttribute("product", product);
		model.addAttribute("conditionOptions", Arrays.asList(Condition.values()));
		model.addAttribute("categoryOptions", Arrays.asList(Category.values()));
		model.addAttribute("statusOptions", Arrays.asList(Status.values()));

		return "productForm";

	}

	@GetMapping("/showLoginPage")
	public String showLoginPage() {
		return "admin-login";
	}

	@GetMapping("/demo")
	public String demo(Model model) {
		model.addAttribute("demo", new Demo());
		return "demo";
	}

	@PostMapping("/demo")
	@ResponseBody
	public String demoResponse(@ModelAttribute Demo demo) {
		return "tamam "+demo.getDemo();
	}

}
