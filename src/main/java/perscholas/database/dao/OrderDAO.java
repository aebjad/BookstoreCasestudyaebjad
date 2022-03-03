package perscholas.database.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import perscholas.database.entity.Order;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface OrderDAO extends JpaRepository<Order, Long> {

    public Order findById(@Param("id") Integer id);

    public List<Order> findByUserId(@Param("id") Integer id);

    public List<Order> findByOrderDate(@Param("orderDate") Date orderDate);

    public List<Order> findByShippedDate(@Param("shippedDate") Date shippedDate);

    public List<Order> findByStatus(@Param("status") String status);

   public Order findByUserIdAndStatus(Integer id, String status);


    @Query(value ="select orders.id AS order_id, orders.status, orders.shipped_date, books.book_name, orders_books.quantity\n" +
            "from orders inner join orders_books on orders.id = orders_books.order_id inner join books on orders_books.book_id = books.id\n" +
            "where orders.user_id = :userId and orders.status = :status", nativeQuery = true)
    public List<Map<String, Object>> findOrdersHistory(@Param("userId") Integer userId, @Param("status") String status);


    @Query(value ="select orders.id AS order_id, orders.status, orders.order_date, books.book_name, orders_books.quantity\n" +
            "from orders inner join orders_books on orders.id = orders_books.order_id inner join books on orders_books.book_id = books.id\n" +
            "where orders.user_id = :userId and orders.status = :status", nativeQuery = true)
    public List<Map<String, Object>> findOrderStatus(@Param("userId") Integer userId, @Param("status") String status);


}
