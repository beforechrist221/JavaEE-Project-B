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
public class Category implements Serializable {
    private Integer id;
    private String title;
    private String desc;
    private String group;
    private String icon;
    private Integer categoryId;
    private int status;
    private String createTime;
    private String updateTime;
    private List<Category> categories;
}