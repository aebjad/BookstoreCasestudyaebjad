package perscholas.database.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import perscholas.database.entity.Book;



import java.util.List;

public interface BookDAO extends JpaRepository<Book, Long> {

    public Book findById(@Param("id") Integer id);

    public Book findByBookName(@Param("bookName") String bookName);

    public List<Book> findByAuthor(@Param("author") String author);

    public List<Book> findByCategoryContainingIgnoreCase(@Param("category") String category);

    public List<Book> findAllByOrderByBookNameAsc();

    public List<Book> findByBookNameContainingIgnoreCaseOrAuthorContainsIgnoreCase(String bookName, String author);

}
