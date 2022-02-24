package perscholas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import perscholas.database.dao.BookDAO;
import perscholas.database.entity.Book;

import java.util.List;


@Controller
public class IndexController {

    @Autowired
    private BookDAO bookDao;

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public ModelAndView index() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("index");

        List<Book> booksList = bookDao.findAllRandom();
        response.addObject("booksList", booksList);


        return response;

    }
}
