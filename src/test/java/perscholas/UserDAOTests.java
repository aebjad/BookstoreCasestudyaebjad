package perscholas;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.annotation.Rollback;
import perscholas.database.dao.UserDAO;
import perscholas.database.entity.User;


import java.util.List;

@SpringBootTest
public class UserDAOTests {

    @Autowired
    private UserDAO userDao;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Test
    @Order(1)
//    @Rollback(value = false)
    public void getUserById(){
        User user = userDao.findById(1);
        Assertions.assertThat(user.getFirstName()).isEqualTo("Ahlam");
    }

    @Test
    @Order(2)
    public void getUserByEmail(){
        User user = userDao.findByEmail("aebjad@gmail.com");
        Assertions.assertThat(user.getFirstName()).isEqualTo("Ahlam");
    }

    @Test
    @Order(3)
    public void getAllUsers(){
        List<User> users = userDao.findAll();
        Assertions.assertThat(users.size()).isGreaterThan(0);
    }

    @Test
    @Order(4)
//    @Rollback(value = false)
    public void updateUserTest() {
        User user = userDao.findById(8);
        user.setFirstName("UT_Updated FirstName");
        userDao.save(user);
        Assertions.assertThat(userDao.findById(8).getFirstName()).isEqualTo(user.getFirstName());
    }

    @Test
    @Order(5)
//    @Rollback(value = false)
    public void addUserTest() {
        User user = new User();;

        user.setEmail("sheilig@gmail.com");
        user.setFirstName("Sam");
        user.setLastName("Heilig");
        user.setAddress("393 Sloan Place");
        user.setCity("Seattle");
        user.setState("WA");
        user.setZipCode("98101");

        String encryptedPassword = passwordEncoder.encode("123");
        user.setPassword(encryptedPassword);

        userDao.save(user);
        Assertions.assertThat(user.getId()).isGreaterThan(0);
    }


}
