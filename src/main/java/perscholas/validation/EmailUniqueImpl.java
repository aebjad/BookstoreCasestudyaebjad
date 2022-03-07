package perscholas.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import perscholas.database.dao.UserDAO;
import perscholas.database.entity.User;

//Implement a custom annotation
public class EmailUniqueImpl implements ConstraintValidator<EmailUnique, String> {

    public static final Logger LOG = LoggerFactory.getLogger(EmailUniqueImpl.class);

    @Autowired
    private UserDAO userDao;

    @Override
    public void initialize(EmailUnique constraintAnnotation) {

    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {

        // a custom validation should validate just the email unique and not for null or not empty
        if ( StringUtils.isEmpty(value) ) {
            return true;
        }

        User user = userDao.findByEmail(value);

        if( user == null)
            return true; // email is not found
        else
            return false;

    }

}