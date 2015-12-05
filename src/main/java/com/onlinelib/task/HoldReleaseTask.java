package com.onlinelib.task;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Component;

import com.onlinelib.model.Book;
import com.onlinelib.service.book.BookManagementService;

@Component
@DependsOn({ "bookManagementServiceImpl" })
public class HoldReleaseTask {

	@Autowired
	private BookManagementService bookManagementService;

	Timer timer;

	public HoldReleaseTask() {
		timer = new Timer();
		timer.schedule(new HoldRelease(), 0, 60 * 1000);
	}

	class HoldRelease extends TimerTask {

		@Override
		public void run() {
			if (null != bookManagementService) {
				Calendar calendar = Calendar.getInstance();
				calendar.add(Calendar.DATE, -1);
				Date selectedDate = calendar.getTime();
				List<Book> booksOnHoldPastDue = bookManagementService
						.findBooksOnHoldUntilDate(selectedDate);
				if (null != booksOnHoldPastDue && booksOnHoldPastDue.size() > 0) {
					System.out.println(booksOnHoldPastDue.size());
					for (Book book : booksOnHoldPastDue) {
						book.setIsOnHold("N");
						book.setOnHoldBy(null);
						book.setIsCheckedOut("N");
						book.setIsAvailable("Y");
						book.setPickupDueDate(null);
					}
					bookManagementService.updateBooks(booksOnHoldPastDue);
				}
			} else {
				System.out.println("Will wait for bean to initialize!");
			}
		}

	}

}
