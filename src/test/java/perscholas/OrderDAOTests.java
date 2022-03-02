package perscholas;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import perscholas.database.dao.OrderDAO;
import perscholas.database.entity.Book;
import perscholas.database.entity.Order;


import java.util.List;
import java.util.Optional;

@SpringBootTest
public class OrderDAOTests {

    @Autowired
    private OrderDAO orderDao;

    @Test
  //    @Rollback(value = false)
    public void getOrderByIdTest(){
        Order order = orderDao.findById(4);
        Assertions.assertThat(order.getUser().getId()).isEqualTo(2);
    }

    @Test
    public void getOrderByStatusTest(){
        List<Order> order = orderDao.findByStatus("shipped");
        Assertions.assertThat(order.size()).isGreaterThan(0);
    }

    @Test
  //    @Rollback(value = false)
    public void updateOrderTest() {
        Order book = orderDao.findById(12);
        book.setStatus("shipped");
        orderDao.save(book);
        Assertions.assertThat(orderDao.findById(12).getStatus()).isEqualTo(book.getStatus());
    }

    @Test
    // @Rollback(value = true)
    public void deleteOrderTest() {
        Order order = orderDao.findById(14);
        orderDao.delete(order);
        Optional<Order> optionalRecipe = Optional.ofNullable(orderDao.findById(order.getId()));

        Order tempRecipe = null;
        if (optionalRecipe.isPresent()) {
            tempRecipe = optionalRecipe.get();
        }

        Assertions.assertThat(tempRecipe).isNull();
    }






//    @Test
//  //  @Rollback(value = true)
//    public void deleteOrderTest() {
//        Order order = orderDao.findById(13);
//        orderDao.delete(order);
//        Optional<Order> optionalRecipe = Optional.ofNullable(orderDao.findById(order.getId()));
//
//        Order tempRecipe = null;
//        if (optionalRecipe.isPresent()) {
//            tempRecipe = optionalRecipe.get();
//        }
//
//        Assertions.assertThat(tempRecipe).isNull();
//    }

//    @Test
//    @Order(4)
////    @Rollback(value = false)
//    public void saveBookTest() {
//
//        Book book = Book.builder().recipeDescription("Fajitas").prepTime("1").cookTime("10").servings("2")
//                .directions("Cook It").Image("IMAGE URL").categories(null).difficulty(Difficulty.EASY).ingredient(null)
//                .build();
//
//        bookDao.save(book);
//
//        Assertions.assertThat(book.getId()).isGreaterThan(0);
//    }
}
