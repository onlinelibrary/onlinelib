package com.onlinelib.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.onlinelib.model.Book;

public interface IBookRepository extends JpaRepository<Book, Integer> {

	List<Book> findBooksByAuthor(String author);
	
	@Query("select bks from Book as bks where bks.title like :title")
	List<Book> findBooksByTitle(@Param("title") String title);

	@Query("select bks from Book as bks where bks.onHoldBy=:userId")
	List<Book> findBooksOnHoldForUser(@Param("userId")Integer userId);

	@Query("select bks from Book as bks where bks.checkedOutTo=:userId")
	List<Book> findBooksCheckedOutUser(@Param("userId")Integer userId);

	@Query("select bks from Book as bks where bks.onHoldBy is not null")
	List<Book> findBooksOnHoldForAllUsers();
	
	@Query("select bks from Book as bks where bks.checkedOutTo is not null")
	List<Book> findBooksCheckedOutByAllUsers();

	@Query("select bks from Book as bks where bks.pickupDueDate <=:selectedDate")
	List<Book> findBooksOnHoldUntilDate(@Param("selectedDate")Date selectedDate);
}
