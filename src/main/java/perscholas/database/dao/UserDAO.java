package perscholas.database.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import perscholas.database.entity.User;
import perscholas.database.entity.UserRole;

import java.util.List;

public interface UserDAO extends JpaRepository<User, Long> {

    public User findById(@Param("id") Integer id);

    public User findByEmail(@Param("email") String email);

    public List<User> findByFirstName(@Param("firstName") String firstName);

    //public List<User> findByFirstNameAndLastName(String firstName, String lastName);

//    @Query("select u from User u where u.username = :username")
//    public User findByUsername(@Param("username") String uname);
//
//    @Query(value="SELECT u.* FROM user u WHERE u.last_name like '%:lastName%'", nativeQuery = true)
//    public List<User> findByLastName(String lastName);

    @Query("select ur from UserRole ur where ur.user.id = :userId")
    List<UserRole> getUserRoles(Integer userId);
}