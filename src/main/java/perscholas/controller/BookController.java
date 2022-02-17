package perscholas.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import perscholas.database.dao.BookDAO;
import perscholas.database.entity.Book;
import perscholas.form.BookFormBean;

import javax.validation.Valid;
import java.util.List;

@Controller
@PreAuthorize("hasAuthority('ADMIN')")
public class BookController {

    public static final Logger LOG = LoggerFactory.getLogger(BookController.class);

    @Autowired
    private BookDAO bookDao;


    @RequestMapping(value = "/newBook", method = RequestMethod.GET)
    public ModelAndView newBook() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("book/newBook");

        BookFormBean form = new BookFormBean();
        response.addObject("formBeanKey", form);

        return response;
    }

    @RequestMapping(value = "/bookSubmit", method = RequestMethod.GET)
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

            Book book = new Book();

            book.setBookName(form.getBookName());
            book.setAuthor(form.getAuthor());
            book.setPrice(form.getPrice());
            book.setUrlImage(form.getUrlImage());
            book.setQuantityInStock(form.getQuantityInStock());

            bookDao.save(book);

            response.setViewName("book/newBook");

        }

            return response;
    }


    @RequestMapping(value = "/bookList", method = RequestMethod.GET)
    public ModelAndView book() throws Exception {
        ModelAndView response = new ModelAndView();

        List<Book> books = bookDao.findAll();
        response.addObject("books", books);

        response.setViewName("book/booksList");
        return response;
    }
}
