package project.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User extends BaseModel {
    private Integer id;
    private String email;
    private String password;
    private UserInfo userInfo;

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }
}
