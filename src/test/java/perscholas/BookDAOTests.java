package perscholas;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import perscholas.database.dao.BookDAO;
import perscholas.database.entity.Book;


import java.util.List;
import java.util.Optional;

@SpringBootTest
public class BookDAOTests {

    @Autowired
    private BookDAO bookDao;

    @Test
    @Order(1)
//    @Rollback(value = false)
    public void getBookById(){
        Book book = bookDao.findById(1);
        Assertions.assertThat(book.getBookName()).isEqualTo("Very Hungry Caterpillar");
    }

    @Test
    @Order(2)
    public void getBookByAuthor(){
        List<Book> books = bookDao.findByAuthor("Raina Telgemeier");
        Assertions.assertThat(books.size()).isGreaterThan(0);
    }

    @Test
    @Order(3)
//    @Rollback(value = false)
    public void updateBookTest() {
        Book book = bookDao.findById(3);
        book.setQuantityInStock(7);
        bookDao.save(book);
        Assertions.assertThat(bookDao.findById(3).getQuantityInStock()).isEqualTo(book.getQuantityInStock());
    }

    @Test
    @Order(4)
   // @Rollback(value = true)
    public void deleteBookTest() {
        Book book = bookDao.findById(37);
        bookDao.delete(book);
        Optional<Book> optionalRecipe = Optional.ofNullable(bookDao.findById(book.getId()));

        Book tempRecipe = null;
        if (optionalRecipe.isPresent()) {
            tempRecipe = optionalRecipe.get();
        }

        Assertions.assertThat(tempRecipe).isNull();
    }

    @Test
    @Order(5)
    public void addBookTest() {

        Book book = new Book();

        book.setBookName("The Pigeon Will Ride the Roller Coaster!");
        book.setAuthor("Mo Willems");
        book.setCategory("kid");
        book.setQuantityInStock(10);
        book.setPrice(5.99);
        book.setUrlImage("/pub/images/pigeon.jpg ");

        bookDao.save(book);

        Assertions.assertThat(book.getId()).isGreaterThan(0);
    }
}
