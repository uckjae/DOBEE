package com.dobee.vo.member;


import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class User {

    private String mail;
    private String password;
    private String name;
    private byte[] myPic;
    private int authCode;
    private int teamCode;
    private MultipartFile multiFile;
   
        
}
