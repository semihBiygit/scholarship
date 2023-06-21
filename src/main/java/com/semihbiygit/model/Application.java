package com.semihbiygit.model;

import lombok.*;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Application {

    private Long application_id;
    private String firstName;
    private String lastName;
    private String birthDate;
    private String universityName;
    private String address;
    private String cv;
    private String status;
    private int user_id;
}
