package com.example.bookclub.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.example.bookclub.models.Book;
import com.example.bookclub.services.BookService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class BookController {
	
	// Imported Service
	@Autowired
	private BookService bookServ;
	
	@GetMapping("/books")
	public String renderDashboard(HttpSession session, Model model) {
		if(session.getAttribute("userId") == null) {
			session.invalidate();
			return "redirect:/";
		}
		List<Book> allBooks = bookServ.allBooks();
		model.addAttribute("bookList", allBooks);
		return "dashboard.jsp";
	}
	
	@GetMapping("/books/new")
	public String renderCreateBookForm(HttpSession session,@ModelAttribute("newBook")Book newBook) {
		if(session.getAttribute("userId") == null) {
			session.invalidate();
			return "redirect:/";
		}
		return "createBook.jsp";
	}
	
	@PostMapping("/books/new")
	public String processCreateBook(HttpSession session,@Valid @ModelAttribute("newBook")Book newBook, BindingResult result) {
		if(result.hasErrors()) {
			return "createBook.jsp";
		} else {
			bookServ.createBook(newBook);
			return "redirect:/books";
		}
	}
	
	@GetMapping("/books/{id}")
	public String bookDetailsPage(@PathVariable("id")Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			session.invalidate();
			return "redirect:/";
		}
		Book oneBook = bookServ.oneBook(id);
		model.addAttribute("oneBook", oneBook);
		return "viewBook.jsp";
	}
	
	@DeleteMapping("/books/{id}")
	public String deleteBookById(@PathVariable("id")Long id) {
		bookServ.deleteBook(id);
		return "redirect:/books";
	}
	
	@GetMapping("/books/{id}/edit")
	public String renderEditBookForm(@PathVariable("id")Long id, Model model, HttpSession session) {
		if(session.getAttribute("userId") == null) {
			session.invalidate();
			return "redirect:/";
		}
		Book oneBook = bookServ.oneBook(id);
		model.addAttribute("oneBook", oneBook);
		return "editBook.jsp";
	}
	
	@PutMapping("/books/{id}/edit")
	public String processEditBook(@Valid @ModelAttribute("oneBook")Book oneBook, BindingResult result) {
		if(result.hasErrors()) {
			return "editBook.jsp";
		} else {
			bookServ.updateBook(oneBook);
			return "redirect:/books";
		}
	}
}
