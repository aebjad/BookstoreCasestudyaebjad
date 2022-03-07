package perscholas.validation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.slf4j.Slf4j;
import perscholas.database.dao.OrderBookDAO;
import perscholas.database.dao.OrderDAO;
import perscholas.database.dao.UserDAO;
import perscholas.database.entity.Order;
import perscholas.database.entity.OrderBook;
import perscholas.database.entity.User;

import java.util.List;

@Slf4j
@Component
public class getParameterInterceptor extends HandlerInterceptorAdapter {


	@Autowired
	private UserDAO userDao;

	@Autowired
	private OrderDAO orderDao;

	@Autowired
	private OrderBookDAO orderBookDao;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		// This is a way to ask the security context for the logged-in user.
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentPrincipalName = authentication.getName();
		User user = userDao.findByEmail(currentPrincipalName);
       // To add a user name instead of using  a session
		if(user != null){
			request.setAttribute("user", user);
			// add quantity to the cart at navigation bar
			Order order = orderDao.findByUserIdAndStatus(user.getId(), "cart");
			if(order != null) {
				List<OrderBook> bookList = orderBookDao.findByOrder(order);
				if (bookList != null) {
					// lambda, get how many book in the cart/bag
					final int[] quantity = {0};
					bookList.forEach((n) -> {
						quantity[0] = quantity[0] + n.getQuantity();
					});
					request.setAttribute("quantity", quantity[0]);
				}
			}
		}
		return true;

	}
	

}
