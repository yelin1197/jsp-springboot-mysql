package org.whs.dev2.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.whs.dev2.dto.UserRequestDto;
import org.whs.dev2.jwt.JwtUtil;
import org.whs.dev2.service.UserService;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
public class UserRequestController {

    private final UserService userService;
    private final JwtUtil jwtUtil;

    @PostMapping("/register")
    public ResponseEntity<String> register(@RequestBody UserRequestDto dto) {
        userService.register(dto);
        return ResponseEntity.ok("회원가입 성공");
    }

    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody UserRequestDto dto) {
        boolean result = userService.authenticate(dto.getUsername(), dto.getPassword());
        if (result) {
            String token = jwtUtil.generateToken(dto.getUsername());
            return ResponseEntity.ok(token); // JWT를 바로 반환
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인 실패");
        }
    }
}
