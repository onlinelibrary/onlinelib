package com.onlinelib.service.book;

import java.util.Date;
import java.util.List;

import com.onlinelib.model.Book;

public interface BookManagementService {

	List<Book> findBooksByAuthor(String author);
	List<Book> findBooksByTitle(String title);
	List<Book> findAll();
	Book updateBook(Book book);
	Book findBookById(Integer id);
	List<Book> findBooksOnHoldForUser(Integer userId);
	List<Book> findBooksCheckedOutByUser(Integer userId);
	List<Book> findBooksOnHoldForAllUsers();
	List<Book> findBooksCheckedOutByAllUsers();
	List<Book> findBooksOnHoldUntilDate(Date selectedDate);
	List<Book> updateBooks(List<Book> books);
}
