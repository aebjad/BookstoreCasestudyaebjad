package perscholas.form;

import lombok.Getter;
import lombok.Setter;
import perscholas.validation.EmailUnique;
import perscholas.validation.TwoFieldsAreEqual;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@TwoFieldsAreEqual(fieldOneName = "confirmPassword", fieldTwoName = "password", message = "Password and Confirm Password must be the same.")
public class RegisterFormBean {

    // this is a hidden data value and is only needed to distinguish an edit
    private Integer id;

    @NotEmpty(message = "Email is required.")
    @Pattern(regexp = "^.+@.+$", message = "Invalid email format")
    @EmailUnique(message = "Email must be unique")
    private String email;

    private String firstName;

    private String lastName;

    @NotEmpty(message = "password is required")
    private String password;
    private String confirmPassword;

    private String address;
    private String city;
    private String zipCode;
    private String state;

    private List<String> errorMessages = new ArrayList<>();

    @Override
    public String toString() {
        return "RegisterFormBean{" +
                "email='" + email + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", password='" + password + '\'' +
                ", confirmPassword='" + confirmPassword + '\'' +
                ", address='" + address + '\'' +
                ", city='" + city + '\'' +
                ", zipCode='" + zipCode + '\'' +
                ", state='" + state + '\'' +
                ", errorMessages=" + errorMessages +
                '}';
    }
}

