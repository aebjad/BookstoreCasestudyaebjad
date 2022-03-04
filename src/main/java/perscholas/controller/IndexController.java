package perscholas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import perscholas.database.dao.OrderBookDAO;
import perscholas.database.dao.OrderDAO;
import perscholas.database.dao.UserDAO;
import perscholas.database.entity.Order;
import perscholas.database.entity.OrderBook;
import perscholas.database.entity.User;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class IndexController {

    @Autowired
    private  UserDAO userDao;

    @Autowired
    private OrderDAO orderDao;

    @Autowired
    private OrderBookDAO orderBookDao;

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public ModelAndView index(HttpSession session) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("index");

        // This is a way to ask the security context for the logged-in user.
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();

        User user = userDao.findByEmail(currentPrincipalName);
        if(user != null) {
            // set the user session
            session.setAttribute("user", user);

            Order order = orderDao.findByUserIdAndStatus(user.getId(), "cart");
            if (order != null) {

                List<OrderBook> bookList = orderBookDao.findByOrder(order);

                // lambda, get how many book in the cart/bag
                final int[] quantity = {0};
                bookList.forEach((n) -> {
                    quantity[0] = quantity[0] + n.getQuantity();
                });
                session.setAttribute("quantity", quantity[0]);
            }
        }
        return response;

    }
}
