package perscholas.database.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import perscholas.database.entity.Book;
import perscholas.database.entity.Order;
import perscholas.database.entity.OrderBook;
import perscholas.database.entity.UserRole;

import java.util.List;

public interface OrderBookDAO extends JpaRepository<OrderBook, Long> {

    public OrderBook findByOrderId(@Param("id") Integer id);

    public OrderBook findByBookId(@Param("id") Integer id);

    public  OrderBook findByBookIdAndOrderId(Integer bookId, Integer orderId);

    public List<OrderBook> findByOrder(Order order);

//    @Query("select ob from OrderBook ob where ob.book = :book and ob.order =
//    @Query("select ob from OrderBook ob where ob.order = :order")
//     List<OrderBook> findByOrder(Order order);

//    @Query("select o from OrderItem o where o.order.id = :orderId and o.product = :product")
//    List<OrderItem> findByOrderIdAndProductId(@Param("orderId")  Long orderId, @Param("product") Product product);
//    List<OrderItem> findByOrderIdAndProductId(@Param("orderId")  Long orderId, @Param("productId")  Long productId);

}
