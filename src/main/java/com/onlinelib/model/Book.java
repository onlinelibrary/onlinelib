package com.onlinelib.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "books")
public class Book implements Serializable, Cloneable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6935169487750583441L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "title")
	private String title;

	@Column(name = "author")
	private String author;

	@Column(name = "category")
	private String category;

	@Column(name = "is_available")
	private String isAvailable;

	@Column(name = "is_checked_out")
	private String isCheckedOut;

	@Column(name = "checked_out_to")
	private Integer checkedOutTo;

	@Column(name = "return_date")
	private Date returnDate;

	@Column(name = "is_on_hold")
	private String isOnHold;

	@Column(name = "on_hold_by")
	private Integer onHoldBy;

	@Column(name = "pickup_due_date")
	private Date pickupDueDate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getIsAvailable() {
		return isAvailable;
	}

	public void setIsAvailable(String isAvailable) {
		this.isAvailable = isAvailable;
	}

	public String getIsCheckedOut() {
		return isCheckedOut;
	}

	public void setIsCheckedOut(String isCheckedOut) {
		this.isCheckedOut = isCheckedOut;
	}

	public Integer getCheckedOutTo() {
		return checkedOutTo;
	}

	public void setCheckedOutTo(Integer checkedOutTo) {
		this.checkedOutTo = checkedOutTo;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public String getIsOnHold() {
		return isOnHold;
	}

	public void setIsOnHold(String isOnHold) {
		this.isOnHold = isOnHold;
	}

	public Integer getOnHoldBy() {
		return onHoldBy;
	}

	public void setOnHoldBy(Integer onHoldBy) {
		this.onHoldBy = onHoldBy;
	}

	public Date getPickupDueDate() {
		return pickupDueDate;
	}

	public void setPickupDueDate(Date pickupDueDate) {
		this.pickupDueDate = pickupDueDate;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Book [id=");
		builder.append(id);
		builder.append(", title=");
		builder.append(title);
		builder.append(", author=");
		builder.append(author);
		builder.append(", category=");
		builder.append(category);
		builder.append(", isAvailable=");
		builder.append(isAvailable);
		builder.append(", isCheckedOut=");
		builder.append(isCheckedOut);
		builder.append(", checkedOutTo=");
		builder.append(checkedOutTo);
		builder.append(", returnDate=");
		builder.append(returnDate);
		builder.append(", isOnHold=");
		builder.append(isOnHold);
		builder.append(", onHoldBy=");
		builder.append(onHoldBy);
		builder.append(", pickupDueDate=");
		builder.append(pickupDueDate);
		builder.append("]");
		return builder.toString();
	}

}
