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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import perscholas.database.dao.UserDAO;
import perscholas.database.dao.UserRoleDAO;
import perscholas.database.entity.User;
import perscholas.database.entity.UserRole;
import perscholas.form.RegisterFormBean;

//import marked from "marked";

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


    // this method is responsible for populating the jsp page with the correct data so the page can render
    // if this method is called without the id parameter it will be a create and no database will be loaded
    // if it is called with an id it will be an edit and we need to load the user from the databse and
    // populate the form bean.
    @RequestMapping(value ="/register", method = RequestMethod.GET)
    public ModelAndView register() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("registration/register");

        RegisterFormBean form = new RegisterFormBean();
        response.addObject("formBeanKey", form);

        return response;
    }

    // this method describes what happens when a user submits the form to the back end
    // it handles the creation logic for saving the user input to the database
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
            //   response.addObject("formError", errors);
            response.addObject("formBeanKey", form);
            response.setViewName("registration/register");
        }else{
            //  // there are no errors on the form submission lets redirect to the login page
            //    right here that you would save the new user registration to the database

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

            // if you are saving a new user without an id.  The return value of save will
            // create a new autoincremented ID record and return the user object with the new id populated
            //        System.out.println(user);
            userDao.save(user);

               // this is a creation because the incoming id variable on the form is null
                // so ... lets create a user role record for this user also
                UserRole ur = new UserRole();

                ur.setUser(user);
                ur.setUserRole("USER");

                userRoleDao.save(ur);


      //             response.setViewName("redirect:/login/login");
            response.setViewName("registration/register");
          //  response.setViewName("/login/loginSecurityPost");

        }

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



