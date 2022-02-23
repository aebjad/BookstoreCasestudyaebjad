package perscholas.database.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import perscholas.database.entity.Book;
import perscholas.database.entity.OrderBook;
import perscholas.database.entity.UserRole;

import java.util.List;

public interface OrderBookDAO extends JpaRepository<OrderBook, Long> {

    public OrderBook findByOrderId(@Param("id") Integer id);

    public OrderBook findByBookId(@Param("id") Integer id);

    public  OrderBook findByBookIdAndOrderId(Integer bookId, Integer orderId);

//    @Query("select ob from OrderBook ob where ob.book = :bookId and ob.order = :orderId")
//    OrderBook findByBookIdAndOrderId(Integer bookId, Integer orderId);


}
