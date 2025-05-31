package org.whs.dev2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomePageController {
    @GetMapping("/")
    public String home() {
        return "index"; // → /WEB-INF/views/index.jsp 로 매핑됨
    }
}
