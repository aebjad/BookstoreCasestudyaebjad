package perscholas.controller;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import perscholas.database.dao.*;
import perscholas.database.entity.*;
import perscholas.form.BookFormBean;


import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
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

        // Find a user using firstname or lastname case-insensitive
        if(!StringUtils.isEmpty(search)) {
            List<User> userList = userDao.findByFirstNameContainingIgnoreCaseOrLastNameContainingIgnoreCase(search, search);
            response.addObject("userList", userList);
            response.addObject("search",search);
        }

        return response;
    }


    @RequestMapping(value ="/usersList", method = RequestMethod.GET)
    public ModelAndView usersList() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("admin/userList");

            List<User> userList = userDao.findAllByOrderByFirstNameAsc();
            response.addObject("userList", userList);


        return response;
    }

    @RequestMapping(value ="/bookList", method = RequestMethod.GET)
    public ModelAndView bookList(@RequestParam(required = false) String booksearch) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("admin/booksList");

        // Find a book using book name, author name or any key case-insensitive
        if(!StringUtils.isEmpty(booksearch)) {
            List<Book> bookList = bookDao.findByBookNameContainingIgnoreCaseOrAuthorContainsIgnoreCase(booksearch, booksearch);
            response.addObject("bookList", bookList);
            response.addObject("booksearch",booksearch);

        }else {
            List<Book> bookList = bookDao.findAllByOrderByBookNameAsc();
            response.addObject("bookList", bookList);
        }

        return response;
    }

    @RequestMapping(value = "/deleteBook", method = RequestMethod.GET)
    public ModelAndView delete(@RequestParam Integer id, HttpServletRequest request) throws Exception {
        ModelAndView response = new ModelAndView();

        //get the address of the page that makes the request.
        String referrer = request.getHeader("referer");
        response.setViewName("redirect:"+ referrer);

            if(id != null) {
                Book delete = bookDao.findById(id);
                if (delete != null) {
                    bookDao.delete(delete);
                }
            }
//        }
        return response;
    }


    @RequestMapping(value = "/newBook", method = RequestMethod.GET)
    public ModelAndView newBook() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("book/newBook");

        BookFormBean form = new BookFormBean();
        response.addObject("formBeanKey", form);

        return response;
    }

    // Save the new book to the database
    @RequestMapping(value = "/bookSubmit", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView bookSubmit(@Valid BookFormBean form, BindingResult errors) throws Exception {
        ModelAndView response = new ModelAndView();

        if(errors.hasErrors()) {
            for (FieldError error : errors.getFieldErrors()) {
                // add the error message to the errorMessages list in the form bean
                form.getErrorMessages().add(error.getDefaultMessage());
                System.out.println("error field = " + error.getField() + " message = " + error.getDefaultMessage());
                LOG.debug("error field = " + error.getField() + " message = " + error.getDefaultMessage());

            }
            response.addObject("formBeanKey", form);
            response.setViewName("book/newBook");
        }else{
            // There are no errors on the form submission so redirect to the add new book page
           // save the new book to the database
            Book book = new Book();

            book.setBookName(form.getBookName());
            book.setAuthor(form.getAuthor());
            book.setPrice(form.getPrice());
            book.setUrlImage(form.getUrlImage());
            book.setQuantityInStock(form.getQuantityInStock());
            book.setCategory(form.getCategory());
            book.setDescription(form.getDescription());

            bookDao.save(book);

            response.setViewName("book/newBook");

        }

        return response;
    }


//    Load book details and send them to the edit form
    @RequestMapping(value ="/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(required = false) Integer id) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("book/editBook");

        if( id != null){
            // id has been passed to this form
            Book book = bookDao.findById(id);

            // populate the form bean with the data loaded from the database
            BookFormBean form = new BookFormBean();
            form.setBookName(book.getBookName());
            form.setAuthor(book.getAuthor());
            form.setPrice(book.getPrice());
            form.setCategory(book.getCategory());
            form.setDescription(book.getDescription());
            form.setUrlImage(book.getUrlImage());
            form.setQuantityInStock(book.getQuantityInStock());
            // since we loaded this from the database we know the id field
            form.setId(book.getId());

            response.addObject("formBeanKey", form);

        }
        return response;
    }

    // This method describes what happens when an admin submits the form to the back end
    // it handles update logic for saving the book input to the database
    // This is update book method
    @RequestMapping(value ="/editBook", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView editBook(@Valid BookFormBean form, BindingResult errors) throws Exception {
        ModelAndView response = new ModelAndView();

        if (errors.hasErrors()) {
            for (FieldError error : errors.getFieldErrors()) {
                // add the error message to the errorMessages list in the form bean
                form.getErrorMessages().add(error.getDefaultMessage());
                System.out.println("error field = " + error.getField() + " message = " + error.getDefaultMessage());
                LOG.debug("error field = " + error.getField() + " message = " + error.getDefaultMessage());

            }
            response.addObject("formBeanKey", form);
            response.setViewName("book/editBook");
        } else {
            //  // there are no errors on the form submission lets
            // update book details, we need to load the book from the database first
            Book book = bookDao.findById(form.getId());
            //     System.out.println("editBook method: " + book);

            if(book != null) {
                book.setBookName(form.getBookName());
                book.setAuthor(form.getAuthor());
                book.setUrlImage(form.getUrlImage());
                book.setPrice(form.getPrice());
                book.setCategory(form.getCategory());
                book.setDescription(form.getDescription());
                book.setQuantityInStock(form.getQuantityInStock());

                bookDao.save(book);
            }
            response.setViewName("admin/home");


        }

        return response;
    }


}
