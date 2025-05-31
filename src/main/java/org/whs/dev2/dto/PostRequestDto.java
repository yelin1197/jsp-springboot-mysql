package org.whs.dev2.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

@Getter
@Setter
@NoArgsConstructor
public class PostRequestDto {
    private String title;
    private String content;
}