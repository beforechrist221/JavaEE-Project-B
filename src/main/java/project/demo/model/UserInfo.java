package project.demo.model;

import java.io.Serializable;

public class UserInfo implements Serializable {
    private Integer id;
    private String username;
    private String avatar;
    private String mobile;
    private String createTime;
    private String updateTime;
    private String updateIp;
    private int userId;

    public UserInfo() {
    }

    public UserInfo(String createTime, int userId) {
        this.createTime = createTime;
        this.userId = userId;
    }

    public UserInfo(Integer id, String username, String avatar, String mobile, String createTime, String updateTime, String updateIp, int userId) {
        this.id = id;
        this.username = username;
        this.avatar = avatar;
        this.mobile = mobile;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.updateIp = updateIp;
        this.userId = userId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getUpdateIp() {
        return updateIp;
    }

    public void setUpdateIp(String updateIp) {
        this.updateIp = updateIp;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", avatar='" + avatar + '\'' +
                ", mobile='" + mobile + '\'' +
                ", createTime='" + createTime + '\'' +
                ", updateTime='" + updateTime + '\'' +
                ", updateIp='" + updateIp + '\'' +
                ", userId='" + userId + '\'' +
                '}';
    }
}
