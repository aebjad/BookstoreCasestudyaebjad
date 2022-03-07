package perscholas.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
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
import javax.servlet.http.HttpServletRequest;

import java.util.*;

@Controller
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


    @PreAuthorize("hasAnyAuthority('ADMIN', 'USER')")
    @RequestMapping(value = "/addToCart", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView addToCart(@RequestParam(required = true) Integer id, HttpServletRequest request) throws Exception {

        ModelAndView response = new ModelAndView();
        String referrer = request.getHeader("referer");

        if (id != null) {
                // This is a way to ask the security context for the logged-in user.
                Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                String currentPrincipalName = authentication.getName();
                User user = userDao.findByEmail(currentPrincipalName);

                Book book = bookDao.findById(id);

                // Check if we have a book in the inventory
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

                                // Decrease quantity in stock
                                book.setQuantityInStock(book.getQuantityInStock() - 1);
                                bookDao.save(book);

                            } else {
                                // add a new  order-book object
                                OrderBook newOrderBook = new OrderBook();
                                newOrderBook.setOrder(order);
                                newOrderBook.setBook(book);
                                newOrderBook.setQuantity(1);
                                orderBookDao.save(newOrderBook);

                                // Decrease quantity in stock
                                book.setQuantityInStock(book.getQuantityInStock() - 1);
                                bookDao.save(book);

                            }

                        }

                    response.setViewName("redirect:"+referrer);


                }
                else{ // quantity in stock is zero
                    response.addObject("error","Sorry Out of Stock");
                    response.setViewName("redirect:"+referrer);

                }
            } else

            response.setViewName("redirect:"+referrer);


        return response;
    }


    @PreAuthorize("hasAuthority('USER')")
    @RequestMapping(value = "/userBag", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView userBag() throws Exception {

        ModelAndView response = new ModelAndView();

        // This is a way to ask the security context for the logged-in user.
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        User user = userDao.findByEmail(currentPrincipalName);
        // To add a user name instead of using  a session
        response.addObject("user", user);

        if(user != null) {
            Order order = orderDao.findByUserIdAndStatus(user.getId(), "cart");
            if (order != null) {

                response.addObject("orderId", order.getId());

                List<OrderBook> bookList = orderBookDao.findByOrder(order);
                response.addObject("bookList", bookList);

                // lambda, get how many book in the cart/bag
                final int[] quantity = {0};
                bookList.forEach( (n) -> {
                    quantity[0] = quantity[0] +  n.getQuantity();
                     });
                response.addObject("quantity", quantity[0]);

                double total = 0;
                double totalprice = 3.5;
                for (int i = 0; i < bookList.size(); i++) {
                    total += (bookList.get(i).getQuantity() * bookList.get(i).getBook().getPrice());
                }

                total = Math.floor(total * 100) / (100); // allow 2 number of decimal places
                totalprice += total; // total + tax + shipping
                totalprice = Math.floor(totalprice * 100) / (100);

                response.addObject("total", total);
                response.addObject("totalprice", totalprice);
            }
        }
           response.setViewName("user/userBag");

        return response;
    }

    // decrease the quantity of the book in the cart by 1
    @RequestMapping(value = "/lowerQuantity", method = RequestMethod.GET)
    public ModelAndView lowerQuantity(@RequestParam(required = true) Integer orderBookId,
                                      HttpServletRequest request) throws Exception {

        ModelAndView response = new ModelAndView();

        //get the address of the page that makes the request.
        String referrer = request.getHeader("referer");
        response.setViewName("redirect:"+ referrer);

        OrderBook orderBook = orderBookDao.findById(orderBookId);
        if(orderBook != null) {
            if(orderBook.getQuantity() > 1 ) {
                orderBook.setQuantity(orderBook.getQuantity() - 1);
                orderBookDao.save(orderBook);
                //increase book quantity in stock by 1
                Book book = orderBook.getBook();
                book.setQuantityInStock(book.getQuantityInStock() + 1);
                bookDao.save(book);
            }

        }
        return response;
    }

   // increase the quantity of the book in the cart by 1
    @RequestMapping(value = "/increaseQuantity", method = RequestMethod.GET)
    public ModelAndView increaseQuantity(@RequestParam(required = true) Integer orderBookId,
                                         HttpServletRequest request) throws Exception {

        ModelAndView response = new ModelAndView();

        //get the address of the page that makes the request.
        String referrer = request.getHeader("referer");
        response.setViewName("redirect:"+ referrer);

        OrderBook orderBook = orderBookDao.findById(orderBookId);

        if(orderBook != null) {

            if(orderBook.getBook().getQuantityInStock() > 0) {
                orderBook.setQuantity(orderBook.getQuantity() + 1);
                orderBookDao.save(orderBook);
                // decrease the book quantity in stock by 1
                Book book = orderBook.getBook();
                book.setQuantityInStock(book.getQuantityInStock() - 1);
                bookDao.save(book);

            } else
            response.addObject("error", "Sorry, Out of Stuck");
        }
        return response;
    }

    //delete a book in the cart
    @RequestMapping(value = "/deleteOrderBook", method = RequestMethod.GET)
    public ModelAndView deleteOrderBook(@RequestParam(required = true) Integer orderBookId,
                                         HttpServletRequest request) throws Exception {
        ModelAndView response = new ModelAndView();

        //get the address of the page that makes the request.
        String referrer = request.getHeader("referer");
        response.setViewName("redirect:"+ referrer);

        if(orderBookId != null) {
            OrderBook orderBook = orderBookDao.findById(orderBookId);
            if (orderBook != null) {
                //increase book quantity in stock
                Book book = orderBook.getBook();
                book.setQuantityInStock(book.getQuantityInStock() + orderBook.getQuantity());
                bookDao.save(book);

                orderBookDao.delete(orderBook);

            }
        }

        return response;
    }

    // Get all user's orders that have been shipped
    @RequestMapping(value = "/orderHistory", method = RequestMethod.GET)
    public ModelAndView orderHistory(@RequestParam(required = true) Integer userId) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/orderHistory");

        // query a list of orders from order table joining order_book to get the list of books name
        List<Map<String, Object>> orders = orderDao.findOrdersHistory(userId, "shipped");
        if(!orders.isEmpty()) {
            response.addObject("orders", orders);
        }
        return response;
    }


    // Get all user's orders that are still in transit
    @RequestMapping(value = "/orderStatus", method = RequestMethod.GET)
    public ModelAndView orderStatus(@RequestParam(required = false) Integer userId) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/orderStatus");


        // when the user request the order status then get the user using security context
        // if userId is not empty then the admin pass it to get the user order status
        if(userId == null) {
            // This is a way to ask the security context for the logged-in user.
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            String currentPrincipalName = authentication.getName();
            User user = userDao.findByEmail(currentPrincipalName);
            // To add a user name instead of using  a session
            response.addObject("user",user);
            userId = user.getId();
        }

        List<Map<String, Object>> orders = orderDao.findOrderStatus(userId, "transit");
        response.addObject("orders", orders);

        return response;
    }

    @RequestMapping(value = "/checkOut", method = RequestMethod.GET)
    public ModelAndView checkOut(@RequestParam(required = false) Integer orderId) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/checkOut");

        Order order = orderDao.findById(orderId);
        order.setStatus("transit");
        Date now = new Date();
        order.setOrderDate(now);

        orderDao.save(order);

        return response;
    }

    }