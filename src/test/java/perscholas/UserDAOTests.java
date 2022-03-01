package perscholas;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import perscholas.database.dao.UserDAO;
import perscholas.database.entity.User;


import java.util.List;

public class UserDAOTests {

    @Autowired
    private UserDAO userDao;

    @Test
//    @Order(1)
    public void getUserById(){
        User user = userDao.findById(1);
        //Assert.assertEquals(user.getFirstName(),"Ahlam");
        Assertions.assertThat(user.getFirstName()).isEqualTo("Ahlam");
    }

    @Test
//    @Order(2)
    public void getUserByEmail(){
        User user = userDao.findByEmail("aebjad@gmal.com");
        Assertions.assertThat(user.getFirstName()).isEqualTo("Ahlam");
    }

    @Test
//    @Order(3)
    public void getAllUsers(){
        List<User> users = userDao.findAll();
        Assertions.assertThat(users.size()).isGreaterThan(0);
    }



}
