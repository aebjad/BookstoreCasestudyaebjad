package perscholas.database.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import perscholas.database.entity.Book;



import java.util.List;

public interface BookDAO extends JpaRepository<Book, Long> {

    public Book findById(@Param("id") Integer id);

    public Book findByBookName(@Param("bookName") String bookName);

    public List<Book> findByAuthor(@Param("author") String author);

    public List<Book> findByCategoryContainingIgnoreCase(@Param("category") String category);

    public List<Book> findAll();

    public List<Book> findByBookNameContainingIgnoreCaseOrAuthorContainsIgnoreCase(String bookName, String author);

//    @Query(value ="Select book.* from Book order by RAND LIMIT 8", nativeQuery = true)
//    @Query(value ="Select * from Book order by RAND() LIMIT 8", nativeQuery = true)
//    @Query(value ="Select book.* from Book order by RANDOM() LIMIT 8", nativeQuery = true)
//      @Query("select b from Book b ORDER BY RAND, LIMIT 8 )
//      public List<Book> findAllRandom();



   // public List<Book> findByBookNameAndAndAuthor(String bookName, String author);


//    @Query(value = "Select recipes.* from recipes inner JOIN users_recipes on recipes.recipe_id = users_recipes.recipe_id where users_recipes.date=:date and users_recipes.user_id=:userId", nativeQuery = true)
//    List<Recipe> findUserRecipesByDate(@Param("date")String date, @Param("userId")Integer userId);

//    @Query(value = "Select b from book b inner JOIN orders_books on books.id = orders_books.book_id where orders_books.order=:order and orders_books.user=:user", nativeQuery = true)
//    List<Book> findUserBookListByUserAndOrder(@Param("user") User user, @Param("order") Order order);


//    @Query(value = "Select coalesce(sum(foods.calories),0) AS calories, coalesce((foods.carbs),0) AS carbs, coalesce((foods.fats),0) AS fats, coalesce((foods.protein),0) As protein, coalesce(sum(foods.price),0) as price, recipes.* From foods Inner JOIN recipes_foods on recipes_foods.food_id = foods.food_id right join recipes on recipes.recipe_id = recipes_foods.recipe_id group by recipe_id having recipes.recipe_name like %:keyword% or recipes.recipe_desc like %:keyword%",nativeQuery = true)
//    List<Map<String,Object>> caloriesByRecipeWithKeyword(@Param("keyword")String keyword);
}
