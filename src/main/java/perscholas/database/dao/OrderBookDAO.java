package perscholas.database.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import perscholas.database.entity.Order;
import perscholas.database.entity.OrderBook;


import java.util.List;

public interface OrderBookDAO extends JpaRepository<OrderBook, Long> {

    public OrderBook findByOrderId(@Param("id") Integer id);

    public OrderBook findByBookId(@Param("id") Integer id);

    public  OrderBook findByBookIdAndOrderId(Integer bookId, Integer orderId);

    public List<OrderBook> findByOrder(Order order);

    public OrderBook findById(@Param("id") Integer id);


}
