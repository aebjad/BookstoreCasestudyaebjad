package perscholas.validation;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = TwoFieldsAreEqualImpl.class)
@Target({ ElementType.TYPE, ElementType.ANNOTATION_TYPE })
@Retention(RetentionPolicy.RUNTIME)
public @interface TwoFieldsAreEqual {

    String fieldOneName();

    String fieldTwoName();

    String message() default "{TwoFieldsAreEqual}";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

}