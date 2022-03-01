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

    public List<User> findByFirstNameContainingIgnoreCase(@Param("firstName") String firstName);

    public List<User> findByLastNameContainingIgnoreCase(@Param("lastName") String lastName);

    public List<User> findByFirstNameContainingIgnoreCaseOrLastNameContainingIgnoreCase(String firstName, String lastName);
    public List<User> findByFirstNameContainingIgnoreCaseAndLastNameContainingIgnoreCase(String firstName, String lastName);

    @Query("select ur from UserRole ur where ur.user.id = :userId")
    List<UserRole> getUserRoles(Integer userId);


    //public List<User> findByFirstNameAndLastName(String firstName, String lastName);
   // public List<User> findByFirstNameIgnoreCaseOrLastNameIgnoreCase(String firstName, String lastName);







//    @Query(value = "Select recipes.* from recipes inner JOIN users_recipes on recipes.recipe_id = users_recipes.recipe_id where users_recipes.date=:date and users_recipes.user_id=:userId", nativeQuery = true)
//    List<Recipe> findUserRecipesByDate(@Param("date")String date, @Param("userId")Integer userId);

//    @Query(value = "Select coalesce(sum(foods.calories),0) AS calories, coalesce((foods.carbs),0) AS carbs, coalesce((foods.fats),0) AS fats, coalesce((foods.protein),0) As protein, coalesce(sum(foods.price),0) as price, recipes.* From foods Inner JOIN recipes_foods on recipes_foods.food_id = foods.food_id right join recipes on recipes.recipe_id = recipes_foods.recipe_id group by recipe_id having recipes.recipe_name like %:keyword% or recipes.recipe_desc like %:keyword%",nativeQuery = true)
//    List<Map<String,Object>> caloriesByRecipeWithKeyword(@Param("keyword")String keyword);

    //public List<User> findByFirstNameAndLastName(String firstName, String lastName);

//    @Query("select u from User u where u.username = :username")
//    public User findByUsername(@Param("username") String uname);
//
//    @Query(value="SELECT u.* FROM user u WHERE u.last_name like '%:lastName%'", nativeQuery = true)
//    public List<User> findByLastName(String lastName);






}