package perscholas.form;

import lombok.Getter;
import lombok.Setter;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter

public class BookFormBean {

    // this is a hidden data value and is only needed to distinguish an edit
    private Integer id;

    @NotEmpty(message = "Book name is required.")
    private String bookName;

    @NotEmpty(message = "Author name is required.")
    private String author;

    private String urlImage;

    private String category;

    private String description;

    @Min(value=0, message="Quantity must be at least 0")
    private Integer quantityInStock;

    @Min(value=0, message="Price must be at least 0.00")
    private Double price;


    private List<String> errorMessages = new ArrayList<>();

    @Override
    public String toString() {
        return "BookFormBean{" +
                "id=" + id +
                ", bookName='" + bookName + '\'' +
                ", author='" + author + '\'' +
                ", urlImage='" + urlImage + '\'' +
                ", quantityInStock=" + quantityInStock +
                ", price=" + price +
                ", errorMessages=" + errorMessages +
                '}';
    }
}

