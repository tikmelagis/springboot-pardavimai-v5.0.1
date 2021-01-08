package com.jonaspetrauskas.dev.model;

public class ChangePass {

    private Long id2;
    private String password2;
    private String passwordConfirm2;

    public ChangePass(){}

    public ChangePass(Long id2, String password2, String passwordConfirm2) {
        this.id2 = id2;
        this.password2 = password2;
        this.passwordConfirm2 = passwordConfirm2;
    }

    public Long getId2() {
        return id2;
    }

    public void setId2(Long id2) {
        this.id2 = id2;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }

    public String getPasswordConfirm2() {
        return passwordConfirm2;
    }

    public void setPasswordConfirm2(String passwordConfirm2) {
        this.passwordConfirm2 = passwordConfirm2;
    }
}
