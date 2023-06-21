package com.semihbiygit.model;

import lombok.*;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class User {

    private Long user_id;
    private String username;
    private String password;
    private String role;
    private int application_id;
}
