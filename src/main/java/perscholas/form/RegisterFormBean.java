package perscholas.form;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import perscholas.validation.EmailUnique;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class RegisterFormBean {

    @NotEmpty(message = "Email is required.")
    @Pattern(regexp = "^.+@.+$", message = "Invalid email format")
    @EmailUnique(message = "Email must be unique")
    private String email;

    @NotEmpty
    @Length(min = 1, max = 5,
            message = "First Name must be between 1 and 5 characters in length.")
    private String firstName;

    @NotEmpty(message = "Last Name is required.")
    private String lastName;

   //    private Integer age;

    private String password;
    private String confirmPassword;

    private List<String> errorMessages = new ArrayList<>();

    @Override
    public String toString() {
        return "RegisterFormBean{" +
                "email='" + email + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", password='" + password + '\'' +
                ", confirmPassword='" + confirmPassword + '\'' +
                '}';
    }

}