package project.demo.model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.EqualsAndHashCode;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Category extends BaseModel {
    private Integer id;
    private String title;
    private String desc;
    private Integer parentId;
    private int status;
    private String createTime;
    private String updateTime;
}