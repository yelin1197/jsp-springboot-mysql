package org.whs.dev2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.whs.dev2.dto.UserRequestDto;
import org.whs.dev2.service.UserService;

@Controller
public class UserPageController {

    private final UserService userService;

    public UserPageController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/register")
    public String showRegisterForm() {
        return "register";
    }

    @PostMapping("/register")
    public String register(@RequestParam String username,
                           @RequestParam String password,
                           @RequestParam(required = false) String email, Model model) {
        UserRequestDto dto = new UserRequestDto();
        dto.setUsername(username);
        dto.setPassword(password);
        dto.setEmail(email);

        try {
            userService.register(dto);
            return "redirect:/login";
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            return "register"; // 같은 register.jsp 페이지 다시 보여주기
        }
    }

    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        Model model) {
        boolean result = userService.authenticate(username, password);
        if (result) {
            model.addAttribute("username", username);
            return "redirect:/"; // 로그인 성공 시 홈으로
        } else {
            model.addAttribute("error", "로그인 실패");
            return "login"; // 로그인 실패 시 다시 로그인 페이지
        }
    }
}
