
package com.example.demo.dto;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

// ----------------------------------------------
//        module define
// ----------------------------------------------


public class NullReq {

    @NotNull
    @Valid
    private Where where;



    public Where getWhere() {
        return where;
    }

    public void setWhere(Where where) {
        this.where = where;
    }
}









public class ErrorInfo {

    @NotNull
    @Valid
    private Where where;
    public int error;  // error code
    public String error_text;  // error text



    public Where getWhere() {
        return where;
    }

    public void setWhere(Where where) {
        this.where = where;
    }
}









public class NullRsp {

    @NotNull
    @Valid
    private Where where;
    public ErrorInfo error;  // 



    public Where getWhere() {
        return where;
    }

    public void setWhere(Where where) {
        this.where = where;
    }
}









public class NullQuery {

    @NotNull
    @Valid
    private Where where;



    public Where getWhere() {
        return where;
    }

    public void setWhere(Where where) {
        this.where = where;
    }
}









public class NullHeader {

    @NotNull
    @Valid
    private Where where;



    public Where getWhere() {
        return where;
    }

    public void setWhere(Where where) {
        this.where = where;
    }
}









public class DefaultQuery {

    @NotNull
    @Valid
    private Where where;
    public String where;  // sql where
    public String sort;  // sql sort
    public String csv;  // csv config
    public String show;  // show config



    public Where getWhere() {
        return where;
    }

    public void setWhere(Where where) {
        this.where = where;
    }
}









public class DefaultHeader {

    @NotNull
    @Valid
    private Where where;
    public String token;  // 



    public Where getWhere() {
        return where;
    }

    public void setWhere(Where where) {
        this.where = where;
    }
}









public class Contact {

    @NotNull
    @Valid
    private Where where;
    public String phone;  // phone
    public String email;  // email



    public Where getWhere() {
        return where;
    }

    public void setWhere(Where where) {
        this.where = where;
    }
}









public class CreateUserReqIdCard {

    @NotNull
    @Valid
    private Where where;
    public String cardno;  // 
    public CreateUserReqIdCardEnumCardType = CreateUserReqIdCardEnumCardType.IDCARD cardtype;  // 



    public Where getWhere() {
        return where;
    }

    public void setWhere(Where where) {
        this.where = where;
    }
}









public class CreateUserReq {

    @NotNull
    @Valid
    private Where where;
    public String username;  // 
    public int age;  // 
    public EnumSexType = EnumSexType.NONE sex;  // 
    public Contact contact;  // 
    public CreateUserReqIdCard card;  // 
    public Date birthday;  // 



    public Where getWhere() {
        return where;
    }

    public void setWhere(Where where) {
        this.where = where;
    }
}









public class CreateUserQuery {

    @NotNull
    @Valid
    private Where where;
    public boolean = false is_debug;  // 
    public int rnd;  // 



    public Where getWhere() {
        return where;
    }

    public void setWhere(Where where) {
        this.where = where;
    }
}








        
public class Users {

    @NotNull
    @Valid
    private Where where;
    public int userid;  // 
    public Date create_time;  // 
    public String username;  // 
    public int age;  // 
    public EnumSexType = EnumSexType.NONE sex;  // 
    public Contact contact;  // 
    public CreateUserReqIdCard card;  // 
    public Date birthday;  // 



    public Where getWhere() {
        return where;
    }

    public void setWhere(Where where) {
        this.where = where;
    }
}









public class GetUsersRsp {

    @NotNull
    @Valid
    private Where where;
    public ErrorInfo error;  // 
    public Users[] datas;  // 



    public Where getWhere() {
        return where;
    }

    public void setWhere(Where where) {
        this.where = where;
    }
}








        