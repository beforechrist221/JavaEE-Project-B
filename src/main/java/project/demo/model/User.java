package project.demo.model;

import java.io.Serializable;

public class User implements Serializable {

    private Integer id;
    private String email;
    private String username;
    private String password;
    private String avatar;

    public User() {
    }

    public User(Integer id, String email, String username, String avatar) {
        this.id = id;
        this.email = email;
        this.username = username;
        this.avatar = avatar;
    }

    public User(Integer id, String email, String username, String password, String avatar) {
        this.id = id;
        this.email = email;
        this.username = username;
        this.password = password;
        this.avatar = avatar;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", avatar='" + avatar + '\'' +
                '}';
    }
}
