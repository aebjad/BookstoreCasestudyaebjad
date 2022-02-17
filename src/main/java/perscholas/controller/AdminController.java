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
import perscholas.database.dao.UserDAO;
import perscholas.database.entity.User;


import java.util.List;

@Controller
@RequestMapping("/admin")
//// this restricts the controller to admin only, this can be done at the class level or at the method level
@PreAuthorize("hasAuthority('ADMIN')")
public class AdminController {

    public static final Logger LOG = LoggerFactory.getLogger(AdminController.class);

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


}
