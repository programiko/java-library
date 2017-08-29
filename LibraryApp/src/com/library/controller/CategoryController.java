package com.library.controller;


import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.library.model.Category;
import com.library.service.CategoryService;

@Controller
@RequestMapping("/category")
public class CategoryController {

	@Autowired
	
	private CategoryService categoryService;
	
	@GetMapping("/categories")
	
	public String categoryList(Model model) {
		
		model.addAttribute("category",  new Category());
		model.addAttribute("listCategories", categoryService.getCategory());
		
		return "categories";
	}
	
	@GetMapping("/UpdatingForm")
	public String updatingCategory(@RequestParam("updateCategory") int id, Model model) {
		
		Category category = categoryService.updateCategory(id);
		model.addAttribute("category", category);
		
		return "ShowCategory";
	}
	@GetMapping("/DeletingForm")
	public String deletingCategory (@RequestParam("deleteCategory") int id, Model model) {
		
		Category category = new Category();
		categoryService.removeCategory(id);
		model.addAttribute("category", category);
		return "redirect:/category/categories";
	}
	@GetMapping("/AddingForm")
	
	public String addingCategory(Model model) {
		
		Category category = new Category();
		
		model.addAttribute("category", category);
		
		return "ShowCategory";
	}
	@PostMapping("/saveCategory")
	
	public String addedCategory(@ModelAttribute("category") Category category) {
		
		categoryService.addCategory(category);
		
		
		return "redirect:/category/categories";
	}
	

	@GetMapping("/search")
	void search(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		String term = request.getParameter("term");
		String searchList = new Gson().toJson(categoryService.searchAutocomplete(term));
		
			response.getWriter().write(searchList);
	}
	
	@PostMapping("/searchByName")
	public String searchByName(@RequestParam("search") String str, Model model) {
		
		model.addAttribute("listCategories", categoryService.searchCategoryByName(str));
		return "categories";
	}
}
