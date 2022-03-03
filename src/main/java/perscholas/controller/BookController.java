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
import perscholas.database.dao.UserDAO;
import perscholas.database.entity.Book;
import perscholas.database.entity.User;
import perscholas.form.BookFormBean;


import javax.validation.Valid;
import java.util.List;

@Controller
//@PreAuthorize("hasAuthority('ADMIN')")
public class BookController {

    public static final Logger LOG = LoggerFactory.getLogger(BookController.class);

    @Autowired
    private BookDAO bookDao;

    @Autowired
    private UserDAO userDao;

    @RequestMapping(value ="/searchBookCategory", method = RequestMethod.GET)
    public ModelAndView bookCategory(@RequestParam(required = false) String searchBooklist) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("book/searchBookList");

        // This is a way to ask the security context for the logged-in user.
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        User user = userDao.findByEmail(currentPrincipalName);

        if(user != null){
            response.addObject("user", user);
        }

      //  System.out.println("searchBooklist" + searchBooklist);
        // Find book using book category case-insensitive
        if(!StringUtils.isEmpty(searchBooklist)) {

            List<Book> booksList = bookDao.findByCategoryContainingIgnoreCase(searchBooklist);
           // System.out.println(booksList);
            response.addObject("booksList", booksList);
            response.addObject("searchBooklist",searchBooklist);
        }else{ // if no category seleceted, then retrieve all books
            List<Book> booksList = bookDao.findAll();
           // System.out.println(booksList);
            response.addObject("booksList", booksList);
            response.addObject("searchBooklist",searchBooklist);
        }

        return response;
    }

    @RequestMapping(value ="/searchBookList", method = RequestMethod.GET)
    public ModelAndView searchBookList(@RequestParam(required = false) String searchBooklist) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("book/searchBookList");

        // This is a way to ask the security context for the logged-in user.
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        User user = userDao.findByEmail(currentPrincipalName);

        if(user != null){
            response.addObject("user", user);
        }

        // Find book using book name, author name or any key case-insensitive
        if(!StringUtils.isEmpty(searchBooklist)) {

            List<Book> booksList = bookDao.findByBookNameContainingIgnoreCaseOrAuthorContainsIgnoreCase(searchBooklist, searchBooklist);
            //      System.out.println(booksList);

            response.addObject("booksList", booksList);
            response.addObject("searchBooklist",searchBooklist);
        }

        return response;
    }

    @RequestMapping(value ="/bookDetails", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView bookDetails(@RequestParam(required = false) Integer id) throws Exception {
        ModelAndView response = new ModelAndView();

        response.setViewName("book/bookDetails");

        // This is a way to ask the security context for the logged-in user.
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        User user = userDao.findByEmail(currentPrincipalName);

        if(user != null){
            response.addObject("user", user);
        }

        if( id != null){
            // id has been passed to this form/method
            Book book = bookDao.findById(id);
            //    System.out.println("edit method :"+ book);

            if(book != null) {
                // populate the form bean with the data loaded from the database
                BookFormBean form = new BookFormBean();
                form.setBookName(book.getBookName());
                form.setAuthor(book.getAuthor());
                form.setPrice(book.getPrice());
                form.setUrlImage(book.getUrlImage());
                form.setQuantityInStock(book.getQuantityInStock());
                form.setDescription(book.getDescription());
                // since we loaded this from the database we know the id field
                form.setId(book.getId());

                response.addObject("formBeanKey", form);
            }

        }
        return response;
    }
}
