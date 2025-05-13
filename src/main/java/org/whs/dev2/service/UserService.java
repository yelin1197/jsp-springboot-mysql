package org.whs.dev2.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.whs.dev2.dto.UserRequestDto;
import org.whs.dev2.entity.User;
import org.whs.dev2.repository.UserRepository;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    public void register(UserRequestDto dto) {
        if (userRepository.findByUsername(dto.getUsername()).isPresent()) {
            throw new IllegalArgumentException("이미 존재하는 아이디입니다.");
        }
        User user = new User();
        user.setUsername(dto.getUsername());
        user.setPassword(dto.getPassword()); // 추후 BCrypt로 암호화 가능
        user.setEmail(dto.getEmail());
        userRepository.save(user);
    }

    public boolean authenticate(String username, String password) {
        return userRepository.findByUsername(username)
                .map(user -> user.getPassword().equals(password))
                .orElse(false);
    }
}
