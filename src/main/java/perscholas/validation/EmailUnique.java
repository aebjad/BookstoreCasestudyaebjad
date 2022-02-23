package perscholas.validation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

//Create a custom annotation
@Documented
@Constraint(validatedBy = EmailUniqueImpl.class)
@Target( { ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
public @interface EmailUnique {

    String message() default "{UserEmailUnique}";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
