package project.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserInfo extends BaseModel {
    private Integer id;
    private String username;
    private String avatar;
    private String mobile;
    private String createTime;
    private String updateTime;
    private String updateIp;
    private int userId;

    public UserInfo(String createTime, int userId) {
        this.createTime = createTime;
        this.userId = userId;
    }
}
