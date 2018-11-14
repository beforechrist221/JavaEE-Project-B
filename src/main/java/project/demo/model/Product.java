package project.demo.model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product implements Serializable {
    private Integer id;
    private String title;
    private String desc;
    private double price;
    private double originalPrice;
    private String coverPicture;
    private String slidePictures;
    private String detailPictures;
    private String spec;
    private int stock;
    private int status;
    private String createTime;
    private String updateTime;
    private Integer categoryId;

    private Cart cart;
}