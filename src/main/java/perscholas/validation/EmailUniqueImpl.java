package perscholas.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//Implement a custom annotation
public class EmailUniqueImpl implements ConstraintValidator<EmailUnique, String> {

    public static final Logger LOG = LoggerFactory.getLogger(EmailUniqueImpl.class);


    @Override
    public void initialize(EmailUnique constraintAnnotation) {

    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if ( StringUtils.isEmpty(value) ) {
            return true;
        }

        boolean passes = ! StringUtils.equals(value, "a@b.com"); // "a@b.com" use a query to garb emails from database

        return ( passes );
    }

}