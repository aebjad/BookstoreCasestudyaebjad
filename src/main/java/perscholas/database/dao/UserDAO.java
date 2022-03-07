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

    public List<User> findAllByOrderByFirstNameAsc();

    public List<User> findByFirstName(@Param("firstName") String firstName);

    public List<User> findByFirstNameContainingIgnoreCase(@Param("firstName") String firstName);

    public List<User> findByLastNameContainingIgnoreCase(@Param("lastName") String lastName);

    public List<User> findByFirstNameContainingIgnoreCaseOrLastNameContainingIgnoreCase(String firstName, String lastName);
    public List<User> findByFirstNameContainingIgnoreCaseAndLastNameContainingIgnoreCase(String firstName, String lastName);

    @Query("select ur from UserRole ur where ur.user.id = :userId")
    List<UserRole> getUserRoles(Integer userId);


}