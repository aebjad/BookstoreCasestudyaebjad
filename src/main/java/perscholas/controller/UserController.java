package perscholas.controller;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import perscholas.database.dao.UserDAO;
import perscholas.database.entity.User;
import perscholas.form.EditFormBean;
import perscholas.form.RegisterFormBean;

import javax.validation.Valid;


@Slf4j
@Controller
@PreAuthorize("hasAnyAuthority('ADMIN','USER')")
public class UserController {

    public static final Logger LOG = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserDAO userDao;

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public ModelAndView profile() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/profile");

        // This is a way to ask the security context for the logged-in user.
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();

        User user = userDao.findByEmail(currentPrincipalName);
         response.addObject("user", user);

        return response;
    }

    @RequestMapping(value = "/editUserProfile", method = RequestMethod.GET)
    public ModelAndView editUserProfile() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/editUserProfile");

        // This is a way to ask the security context for the logged-in user.
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();

        User user = userDao.findByEmail(currentPrincipalName);
      //  response.addObject("user", user);

        EditFormBean form = new EditFormBean();
        form.setEmail(user.getEmail());
        form.setPassword(user.getPassword());
        form.setFirstName(user.getFirstName());
        form.setLastName(user.getLastName());
        form.setAddress(user.getAddress());
        form.setCity(user.getCity());
        form.setZipCode(user.getZipCode());
        form.setState(user.getState());
            // since we loaded this from the database we know the id field
        form.setId(user.getId());
        response.addObject("formBeanKey", form);


        return response;
    }


    @RequestMapping(value ="/updateUser", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView updateUser(@Valid EditFormBean form, BindingResult errors) throws Exception {
        ModelAndView response = new ModelAndView();

            // update user information so we need to load the user from the database first
            User user = userDao.findById(form.getId());

            if(user != null) {
                user.setFirstName(form.getFirstName());
                user.setLastName(form.getLastName());
                user.setAddress(form.getAddress());
                user.setCity(form.getCity());
                user.setState(form.getState());
                user.setZipCode(form.getZipCode());

                String encryptedPassword = passwordEncoder.encode(form.getPassword());
                user.setPassword(encryptedPassword);

                userDao.save(user);
            }
            response.setViewName("/user/profile");


//        }

        return response;
    }




}
