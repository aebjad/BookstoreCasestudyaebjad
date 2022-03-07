package perscholas.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import perscholas.database.dao.UserDAO;
import perscholas.database.dao.UserRoleDAO;
import perscholas.database.entity.User;
import perscholas.database.entity.UserRole;
import perscholas.form.RegisterFormBean;


import javax.validation.Valid;

@Controller
public class RegistrationController {

    public static final Logger LOG = LoggerFactory.getLogger(RegistrationController.class);

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserDAO userDao;

    @Autowired
    private UserRoleDAO userRoleDao;


    @RequestMapping(value ="/register", method = RequestMethod.GET)
    public ModelAndView register() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("registration/register");

        RegisterFormBean form = new RegisterFormBean();
        response.addObject("formBeanKey", form);

        return response;
    }

    //  submits the form to the back end to register a user
    @RequestMapping(value ="/registerSubmit", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView registerSubmit(@Valid RegisterFormBean form, BindingResult errors) throws Exception {
        ModelAndView response = new ModelAndView();

        if(errors.hasErrors()) {
            for (FieldError error : errors.getFieldErrors()) {
                // add the error message to the errorMessages list in the form bean
                form.getErrorMessages().add(error.getDefaultMessage());
                System.out.println("error field = " + error.getField() + " message = " + error.getDefaultMessage());
                LOG.debug("error field = " + error.getField() + " message = " + error.getDefaultMessage());

            }

            response.addObject("formBeanKey", form);
            response.setViewName("registration/register");
        }else{
            //   save the new user registration to the database
            User user = new User();;

            user.setEmail(form.getEmail());
            user.setFirstName(form.getFirstName());
            user.setLastName(form.getLastName());
            user.setAddress(form.getAddress());
            user.setCity(form.getCity());
            user.setState(form.getState());
            user.setZipCode(form.getZipCode());

            String encryptedPassword = passwordEncoder.encode(form.getPassword());
            user.setPassword(encryptedPassword);

            userDao.save(user);

            // create a user role record for this user also
            UserRole ur = new UserRole();
            ur.setUser(user);
            ur.setUserRole("USER");
            userRoleDao.save(ur);

            response.setViewName("redirect:/registerSuccess");

        }

        return response;
    }

    @RequestMapping(value ="/registerSuccess", method = RequestMethod.GET)
    public ModelAndView registerSuccess() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("registration/registerSuccess");

        RegisterFormBean form = new RegisterFormBean();

        return response;
    }

    @RequestMapping(value ="/aboutUs", method =  RequestMethod.GET)
    public ModelAndView aboutUs() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("contact/aboutUs");

        return response;
    }


    @RequestMapping(value ="/contactUs", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView contactUs() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("contact/contactUs");


        return response;
    }


}



