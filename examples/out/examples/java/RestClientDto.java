
package com.example.demo.dto;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

// ----------------------------------------------
//        module define
// ----------------------------------------------


public class NullReq {





    public Where getWhere() {
        return where;
    }

    public void setWhere(Where where) {
        this.where = where;
    }
}









public class ErrorInfo {


    
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


    
    public ErrorInfo error;  // 



    public Where getWhere() {
        return where;
    }

    public void setWhere(Where where) {
        this.where = where;
    }
}









public class NullQuery {





    public Where getWhere() {
        return where;
    }

    public void setWhere(Where where) {
        this.where = where;
    }
}









public class NullHeader {





    public Where getWhere() {
        return where;
    }

    public void setWhere(Where where) {
        this.where = where;
    }
}









public class DefaultQuery {


    
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


    
    public String token;  // 



    public Where getWhere() {
        return where;
    }

    public void setWhere(Where where) {
        this.where = where;
    }
}









public class Contact {


    
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


    
    public ErrorInfo error;  // 
    
    public Users[] datas;  // 



    public Where getWhere() {
        return where;
    }

    public void setWhere(Where where) {
        this.where = where;
    }
}








        