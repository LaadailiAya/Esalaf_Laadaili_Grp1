package com.exemple.model;


public class Admin {

    private Long id ;

    private String user ;

    private int pwd;



    public Admin() {
    }

    public Admin(Long id, String user,Integer pwd) {
        this.id = id;
        this.user = user;
        this.pwd = pwd;
    }

    public Long getId() {
        return id;
    }


    public String getUser() {
        return user;
    }

    public Integer getPwd(){ return pwd;}
    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", user='" + user + '\'' +
                ", pwd='" + pwd + '\'' +
                '}';
    }
}
