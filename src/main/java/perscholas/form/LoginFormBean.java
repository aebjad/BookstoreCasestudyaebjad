package perscholas.form;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

@Getter
@Setter
public class LoginFormBean {

    @NotEmpty(message = "Email is required")
    @Pattern(regexp = "^.+@.+$" , message = "Invalid email format")
    private String email;

    @NotEmpty(message = "Please enter your password")
    private String password;
}
