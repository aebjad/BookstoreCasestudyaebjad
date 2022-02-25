package perscholas.controller;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import perscholas.database.dao.BookDAO;
import perscholas.database.dao.UserDAO;
import perscholas.database.entity.Book;
import perscholas.database.entity.User;


import java.util.List;

@Controller
@RequestMapping("/admin")
//// this restricts the controller to admin only, this can be done at the class level or at the method level
@PreAuthorize("hasAuthority('ADMIN')")
public class AdminController {

    public static final Logger LOG = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    private BookDAO bookDao;

    @Autowired
    private UserDAO userDao;


    //@PreAuthorize("hasAuthority('ADMIN', 'USER')")
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView home() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("admin/home");

        return response;
    }

    @RequestMapping(value ="/userList", method = RequestMethod.GET)
    public ModelAndView userList(@RequestParam(required = false) String search) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("admin/userList");

        // Find user using firstname or lastname case-insensitive
        if(!StringUtils.isEmpty(search)) {
            List<User> userList = userDao.findByFirstNameContainingIgnoreCaseOrLastNameContainingIgnoreCase(search, search);
            response.addObject("userList", userList);
            response.addObject("search",search);
        }

        return response;
    }

    @RequestMapping(value ="/bookList", method = RequestMethod.GET)
    public ModelAndView bookList(@RequestParam(required = false) String booksearch) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("admin/booksList");

        // Find book using book name, author name or any key case-insensitive
        if(!StringUtils.isEmpty(booksearch)) {
            List<Book> bookList = bookDao.findByBookNameContainingIgnoreCaseOrAuthorContainsIgnoreCase(booksearch, booksearch);
            response.addObject("bookList", bookList);
            response.addObject("booksearch",booksearch);
        }else {
            List<Book> bookList = bookDao.findAll();
            response.addObject("bookList", bookList);
            response.addObject("booksearch",booksearch);
            System.out.println(bookList);
        }

        return response;
    }

    @RequestMapping(value = "/deleteBook", method = RequestMethod.GET)
    public ModelAndView delete(@RequestParam Integer id) throws Exception {
        ModelAndView response = new ModelAndView();

        response.setViewName("admin/booksList");

//        if(!StringUtils.isEmpty(booksearch) && id != null) {
//
//            List<Book> bookList = bookDao.findByBookNameContainingIgnoreCaseOrAuthorContainsIgnoreCase(booksearch, booksearch);
//            response.addObject("bookList", bookList);
//            response.addObject("booksearch", booksearch);

            Book delete = bookDao.findById(id);
            if (delete != null) {
                bookDao.delete(delete);
            }
//        }
        return response;
    }

}
