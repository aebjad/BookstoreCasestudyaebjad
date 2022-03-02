package perscholas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
//@RequestMapping("/user")
public class LoginController {



    @RequestMapping(value =  "/login/login", method = RequestMethod.GET)
    public ModelAndView login() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("/login/login");

        return response;
    }


    @RequestMapping(value = "/login/logoutSuccess", method = RequestMethod.GET)
    public ModelAndView logoutSuccess() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("index");

        return response;
    }
}
