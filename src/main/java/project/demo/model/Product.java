package project.demo.model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.EqualsAndHashCode;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product extends BaseModel {
    private Integer id;
    private String title;
    private String desc;
    private double price;
    private String coverPicture;
    private String slidePictures;
    private String detailPictures;
    private String spec;
    private int stock;
    private int status;
    private String createTime;
    private String updateTime;
}