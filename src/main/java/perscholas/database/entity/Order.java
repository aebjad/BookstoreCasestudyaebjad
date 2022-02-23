package perscholas.database.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.*;

@Getter
@Setter
@Entity
@Table(name = "orders")
public class Order {
    @Id
    // this annotation is what tells hibernate that this variable is an auto
    // incremented primary key
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

//    @Column(name = "user_id")
//    private Integer userId;

    @Column(name = "status")
    private String status;


    @Column(name = "order_date")
    @Temporal(TemporalType.DATE)
    private Date orderDate;

    @Column(name = "shipped_date")
    @Temporal(TemporalType.DATE)
    private Date shippedDate;

    @ManyToOne(fetch = FetchType.LAZY, cascade=CascadeType.ALL)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;


//    @ManyToMany
//    @JoinTable(name = "orders_books",
//            joinColumns = @JoinColumn(name = "order_id", referencedColumnName = "id"),
//            inverseJoinColumns = @JoinColumn(name = "book_id", referencedColumnName = "id")) // Add this constraint so that a student can only sign up for a class once.
//    private List<Book> books = new ArrayList<Book>();







//    @ManyToOne(fetch = FetchType.LAZY, optional = false)
//    @JoinColumn(name = "user_id", nullable = false)
//    private User user;

//    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
//    @JoinTable(name = "orders_books",
//            joinColumns = {
//                    @JoinColumn(name = "order_id", referencedColumnName = "id",
//                            nullable = false, updatable = false)},
//            inverseJoinColumns = {
//                    @JoinColumn(name = "book_id", referencedColumnName = "id",
//                            nullable = false, updatable = false)})
//    private Set<Book> books = new HashSet<>();




}
