package perscholas.form;

import lombok.Getter;
import lombok.Setter;
import perscholas.validation.TwoFieldsAreEqual;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter

public class BookFormBean {

    // this is a hidden data value and is only needed to distinguish an edit
    private Integer id;

    @NotEmpty(message = "Book name is required.")
    private String bookName;

    private String author;

    private String urlImage;

    private Integer quantityInStock;

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

