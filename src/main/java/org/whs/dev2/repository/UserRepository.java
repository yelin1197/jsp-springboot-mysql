package org.whs.dev2.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.whs.dev2.entity.User;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);
}
