package com.example.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.bookclub.models.Book;
import com.example.bookclub.repositories.BookRepository;

@Service
public class BookService {
	@Autowired
	private BookRepository bookRepo;
	
	//Find All
	public List<Book> allBooks(){
		return bookRepo.findAll();
	}
	
	//Find One
	public Book oneBook(Long id) {
		Optional<Book> optionalBook = bookRepo.findById(id);
		if(optionalBook.isPresent()) {
			return optionalBook.get();
		}else {
			return null;
		}
	}
	
	//Create
	public Book createBook(Book newBook) {
		return bookRepo.save(newBook);
	}
	
	//Update
	public Book updateBook(Book oneBook) {
		return bookRepo.save(oneBook);		
	}
	
	//Delete
	public void deleteBook(Long id) {
		bookRepo.deleteById(id);
	}
}
