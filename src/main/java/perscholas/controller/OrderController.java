package perscholas.controller;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import perscholas.database.dao.BookDAO;
import perscholas.database.dao.OrderBookDAO;
import perscholas.database.dao.OrderDAO;
import perscholas.database.dao.UserDAO;
import perscholas.database.entity.Book;
import perscholas.database.entity.Order;
import perscholas.database.entity.OrderBook;
import perscholas.database.entity.User;
import perscholas.form.BookFormBean;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
//@PreAuthorize("hasAuthority('ADMIN')")
//@PreAuthorize("hasAuthority('ADMIN', 'USER')")
public class OrderController {

    public static final Logger LOG = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private BookDAO bookDao;

    @Autowired
    private OrderDAO orderDao;

    @Autowired
    private UserDAO userDao;

    @Autowired
    private OrderBookDAO orderBookDao;

    // for adding an item to an order
    // 0) on your jsp page when a user adds an item to the cart you will pass the product id
    // 1) query your product by the productId
    // 1.1)  get the user record for the logged-in user with getLoggedInUser function
    // 2) query your oder by the user_id and status cart ( this gets the most recent order for the logged-in user)
    // 3) if the order does not exist ( id of the query response is null )
    //      3a) create the order with status cart
    //      3c) add the user object to the order
    // 4) query the order_products table to see if the product is already in the order
    // 5) if the product is not in the order
    //      5a ) create a new order_product entity
    //      5b ) set the product id on the order_product
    //      5c ) set the order id on the order_product
    // 6) if the product is already in the order
    //      6a ) increment the quantity on the order_product
    // 7) persist the order_product

//    @PreAuthorize("hasAuthority('ADMIN', 'USER')")
    @RequestMapping(value = "/addToCart", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView addToCart(@RequestParam(required = true) Integer id) throws Exception {

        ModelAndView response = new ModelAndView();


            if (id != null) {
                // This is a way to ask the security context for the logged-in user.
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                String currentPrincipalName = authentication.getName();

                User user = userDao.findByEmail(currentPrincipalName);

                Book book = bookDao.findById(id);

                if (book.getQuantityInStock() > 0) {

                    // User can have more than one order but just one should be cart status
                    Order order = orderDao.findByUserIdAndStatus(user.getId(), "cart");

                    //If the order does not exist then create a new order with status cart
                    // and add the user object to the order
                    if (order == null) {
                        order = new Order();
                        order.setStatus("cart");
                        order.setUser(user);
                        orderDao.save(order);
                    }
                    // add the book to the order exist with cart status or to the new order that we just created
                    if ("cart".equals(order.getStatus())) {
                        // orderBook need to be query by orderId and bookId
                        //if the book is in the orderBook we increment the quantity by 1
                        OrderBook orderBook = orderBookDao.findByBookIdAndOrderId(book.getId(), order.getId());
                        if (orderBook != null) {
                            orderBook.setQuantity(orderBook.getQuantity() + 1);
                            orderBookDao.save(orderBook);

                        } else {
                            // add a new  order-book object
                            OrderBook newOrderBook = new OrderBook();
                            newOrderBook.setOrder(order);
                            newOrderBook.setBook(book);
                            newOrderBook.setQuantity(1);

                            orderBookDao.save(newOrderBook);

                        }

                        // Don't need date for adding to the cart
//                        Date now = new Date();
////                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
////                    now = formatter.parse(String.valueOf(now));
//                        order.setOrderDate(now);
//
//                        orderDao.save(order);
                    }
                    response.setViewName("redirect:/bookDetails?id=" + book.getId());
//                       setViewName("redirect:/bookDetails?id=1&error="Out of Stock");

                }
                else{
                    response.addObject("error","Sorry Out of Stock");
                    response.setViewName("redirect:/bookDetails?id="+id);
                //    response.setViewName("redirect:/bookDetails?id="+id+"&error= \"Sorry Out of Stock\"");
                }
            } else {
             //   response.addObject("formError", "Sorry Book not found");
                response.setViewName("redirect:/bookDetails?error= \"Sorry Book not found\"");
            }

//        }

        return response;
    }

}