package project.demo.model;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Address implements Serializable {
    private Integer id;
    private String province;
    private String city;
    private String district;
    private String town;
    private String detail;
    private String name;
    private String mobile;
    private int status;
    private Integer userId;
}