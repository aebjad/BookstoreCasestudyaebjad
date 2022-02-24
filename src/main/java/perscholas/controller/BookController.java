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
import perscholas.database.dao.BookDAO;
import perscholas.database.entity.Book;
import perscholas.form.BookFormBean;


import javax.validation.Valid;
import java.util.List;

@Controller
//@PreAuthorize("hasAuthority('ADMIN')")
public class BookController {

    public static final Logger LOG = LoggerFactory.getLogger(BookController.class);

    @Autowired
    private BookDAO bookDao;

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/newBook", method = RequestMethod.GET)
    public ModelAndView newBook() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("book/newBook");

        BookFormBean form = new BookFormBean();
        response.addObject("formBeanKey", form);

        return response;
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/bookSubmit", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView bookSubmit(@Valid BookFormBean form, BindingResult errors) throws Exception {
        ModelAndView response = new ModelAndView();

//        System.out.println(form);

        if(errors.hasErrors()) {
            for (FieldError error : errors.getFieldErrors()) {
                // add the error message to the errorMessages list in the form bean
                form.getErrorMessages().add(error.getDefaultMessage());
                System.out.println("error field = " + error.getField() + " message = " + error.getDefaultMessage());
                LOG.debug("error field = " + error.getField() + " message = " + error.getDefaultMessage());

            }
            //   response.addObject("formError", errors);
            response.addObject("formBeanKey", form);
            response.setViewName("book/newBook");
        }else{
            //  // there are no errors on the form submission lets redirect to the add new book page
            //    right here that you would save the new book to the database

          //  if( form.getId() == null) {
                // the id is not present in the form been, so we know it's adding a new book

                Book book = new Book();

                book.setBookName(form.getBookName());
                book.setAuthor(form.getAuthor());
                book.setPrice(form.getPrice());
                book.setUrlImage(form.getUrlImage());
                book.setQuantityInStock(form.getQuantityInStock());

                bookDao.save(book);
           // }
            response.setViewName("book/newBook");

        }

            return response;
    }


//    @RequestMapping(value = "/allBooksList", method = RequestMethod.GET)
//    public ModelAndView allBooksList() throws Exception {
//        ModelAndView response = new ModelAndView();
//
//        List<Book> books = bookDao.findAll();
//        response.addObject("books", books);
//
//        response.setViewName("book/booksList");
//        return response;
//    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value ="/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(required = false) Integer id) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("book/editBook");

        if( id != null){
            // id has been passed to this form
            Book book = bookDao.findById(id);
        //    System.out.println("edit method :"+ book);

            // populate the form bean with the data loaded from the database
            BookFormBean form = new BookFormBean();
            form.setBookName(book.getBookName());
            form.setAuthor(book.getAuthor());
            form.setPrice(book.getPrice());
            form.setUrlImage(book.getUrlImage());
            form.setQuantityInStock(book.getQuantityInStock());
            // since we loaded this from the database we know the id field
            form.setId(book.getId());

            response.addObject("formBeanKey", form);


        }
        return response;
    }



    // this method describes what happens when an admin submits the form to the back end
    // it handles update logic for saving the book input to the database
    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value ="/editBook", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView editBook(@Valid BookFormBean form, BindingResult errors) throws Exception {
        ModelAndView response = new ModelAndView();

    //      System.out.println(form);

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
            // update book details so we need to load the book from the database first
            Book book = bookDao.findById(form.getId());
       //     System.out.println("editBook method: " + book);

            if(book != null) {
                book.setBookName(form.getBookName());
                book.setAuthor(form.getAuthor());
                book.setUrlImage(form.getUrlImage());
                book.setPrice(form.getPrice());
                book.setQuantityInStock(form.getQuantityInStock());

                bookDao.save(book);
            }
                response.setViewName("admin/home");


    }

        return response;
    }

    @RequestMapping(value ="/searchBookList", method = RequestMethod.GET)
    public ModelAndView searchBookList(@RequestParam(required = false) String searchBooklist) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("book/searchBookList");
      //  System.out.println("searchBooklist" + searchBooklist);
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

        if( id != null){
            // id has been passed to this form/method
            Book book = bookDao.findById(id);
            //    System.out.println("edit method :"+ book);

            // populate the form bean with the data loaded from the database
            BookFormBean form = new BookFormBean();
            form.setBookName(book.getBookName());
            form.setAuthor(book.getAuthor());
            form.setPrice(book.getPrice());
            form.setUrlImage(book.getUrlImage());
            form.setQuantityInStock(book.getQuantityInStock());
            // since we loaded this from the database we know the id field
            form.setId(book.getId());

            response.addObject("formBeanKey", form);


        }
        return response;
    }
}
