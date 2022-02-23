package perscholas.database.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import perscholas.database.entity.Book;
import perscholas.database.entity.Order;
import perscholas.database.entity.UserRole;

import java.util.Date;
import java.util.List;

public interface OrderDAO extends JpaRepository<Order, Long> {

    public Order findOrderById(@Param("id") Integer id);

    public List<Order> findByUserId(@Param("id") Integer id);


    public List<Order> findByOrderDate(@Param("orderDate") Date orderDate);

    public List<Order> findByShippedDate(@Param("shippedDate") Date shippedDate);

    public List<Order> findByStatus(@Param("status") String status);

   public Order findByUserIdAndStatus(Integer id, String status);

   // public List<Book> findByBookNameContainingIgnoreCaseOrAuthorContainsIgnoreCase(String bookName, String author);

   // @Query("select u from User u where u.username = :username")
//    public User findByUsername(@Param("username") String uname);
//
//    @Query(value="SELECT u.* FROM user u WHERE u.last_name like '%:lastName%'", nativeQuery = true)
//    public List<User> findByLastName(String lastName);

//    @Query("select ur from UserRole ur where ur.user.id = :userId")
//    List<UserRole> getUserRoles(Integer userId);
}
